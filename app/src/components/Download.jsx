import React, { useEffect, useState } from 'react'
import { IoCloudDownloadSharp } from "react-icons/io5";
import { MdDownloadDone } from "react-icons/md";
import { motion } from 'framer-motion';
import { useGetDownloadsQuery, usePostDownloadsMutation } from '../redux/services/download';
import { useLiveQuery } from 'dexie-react-hooks';
import { db } from '../db/db';
import axios from 'axios';
import Buffer from 'buffer';
const Download = ({ song, artist, stream }) => {

  //indexed data 
  const indexedSongs = useLiveQuery(() => db.songs.toArray());
  const indexedStreams = useLiveQuery(() => db.streamsData.toArray());
  const indexedImages = useLiveQuery(() => db.images.toArray());
  const indexedArtists = useLiveQuery(() => db.artists.toArray());

  const [status, setStatus] = useState()

  // COnvervtire les images 
  const convertToBase64 = async (file) => {
    const base64 = await fetch(`https://api.diabara.tv${file}`)
      .then((response) => response.blob())
      .then((blob) => {
        const reader = new FileReader();
        reader.readAsDataURL(blob);
        return new Promise((res) => {
          reader.onloadend = () => {
            res(reader.result);
          };
        });
      });
    // console.log('base 64', base64);
    return base64;
  };


  // Concertir les audios 

  const downloadAndStoreAudio = async (audioUrl) => {
    try {
      setStatus('Downloading...');
      const response = await axios.get(`https://api.diabara.tv${audioUrl}`, {
        responseType: 'arraybuffer',
      });
      const base64String = Buffer.Buffer.from(response.data, 'binary').toString(
        'base64',
      );
      const base64Audio = `data:audio/mp3;base64,${base64String}`;

      // console.warn('song base 64', base64Audio)
      setStatus('Audio stored successfully!');

      return base64Audio

    } catch (error) {
      console.error('Error downloading or storing audio:', error);
      setStatus('Failed to store audio.');
    }
  };





  const [isDownloaded, setIsDownloaded] = useState(false)

  const [postDownload] = usePostDownloadsMutation()
  const { data, isLoading, isFetching, isError, refetch } = useGetDownloadsQuery()

  async function addSongs({
    id,
    name,
    audio,
    artist,
    date_de_sortie,
    cover,
    genre,
    pays,
    ville,
    album,
  }) {
    var id;
    try {
      if (name && audio) {
        id = await db.songs.add({
          name,
          audio,
          cover,
          date_de_sortie,
          artist,
          album,
          pays,
          ville,
        });
      } else {
        alert(' provide name and age field of student ');
      }
      setStatus(`Student ${name} successfully added. Got id ${id}`);
      setName('');
      setAge(defaultAge);
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }


  // AJouter les streams à la base de données indexée
  async function addStreams({ song, start, end, uuid }) {
    let id;
    try {
      if (uuid && song) {
        id = await db.streamsData.add({
          song,
          start,
          end,
          uuid,
        });
      } else {
        alert(' provide user and song field of student ');
      }
      setStatus(`Streams successfully added. Got id ${id}`);


    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }

  // Supprimer tous les téléchargements
  const clearAll = () => {

    db.delete({ disableAutoOpen: false })
      .then(() => {
        alert(' database deleted ');
      })
      .catch((err) => {
        console.error('Could not delete database', err);
        alert('Could not delete database');
      })
      .finally(() => {
        // Do what should be done next...
      });
  };

  // Ajouter les artistes à la base de donnée indexée
  async function addArtists({ name, image, date_naissance, adresse, pays, ville, email, biographie, genres }) {
    let id;
    try {
      if (name && image) {
        id = await db.artists.add({
          name,
          image,
          date_naissance,
          adresse,
          pays,
          ville,
          email,
          biographie,
          genres
        });
      } else {
        alert(' provide name and image field of artist ');
      }
      setStatus(`Artist successfully added. Got id ${id}`);


    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }
  const download = async () => {
    // Adding song to Indexed Database
    // clearAll()
    const result = {};
    if (song) {

      if (indexedSongs?.length === 0 || !indexedSongs.includes(song)) {
        const data64 = await convertToBase64(
          song.attributes?.cover?.data[0].attributes.url,
        );
        const song64 = await downloadAndStoreAudio(
          song.attributes.audio?.data.attributes.url,
        );
        // console.log('data 64 2', data64);
        // console.log('data Song', song64);
        result.name = song.attributes.name;
        result.audio = song64;
        result.cover = data64;
        (result.date_de_sortie = song.attributes?.date_de_sortie),
          (result.artist = song.attributes.artist),
          (result.album = song.attributes.album),
          (result.pays = song.attributes.pays),
          (result.ville = song.attributes.ville),
          addSongs(result);
      }
      ;

    }

    if (artist) {


      if (artist.attributes.name) {

        let result = {}
        const { name, image, date_naissance, adresse, pays, ville, email, biographie, genres } = artist.attributes
        let data64 = await convertToBase64(image.data[0].attributes.url)
        result = { name, image: data64, date_naissance, adresse, pays, ville, email, biographie, genres }
        addArtists(result);
      }

    }



    send()



  };


  const send = async () => {
    try {

      let data = { song, user: 1, download_date: new Date(), device_type: navigator.userAgent, ip_address: "127.0.0.1", location: "Bamako" }
      await postDownload(JSON.stringify({ data })).then(rep => {
        console.log('Downloadded')

        if (rep.data) refetch()
      })
    } catch (error) {

    }

  }
  useEffect(() => {

    setIsDownloaded(data?.data?.find(item => item?.attributes.song?.data?.id === song.id))

  }, [data])



  return (

    <motion.button
      whileHover={{ scale: 1.4 }}
      whileTap={{ scale: 0.9 }}
      className=' text-orange-500 p-1'
      onClick={() => {
        isDownloaded ? '' : download()
      }}

    >

      {!isDownloaded ? <IoCloudDownloadSharp /> : <MdDownloadDone />}





    </motion.button>
  )
}

export default Download