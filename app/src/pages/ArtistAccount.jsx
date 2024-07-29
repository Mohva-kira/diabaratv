import React, { useRef, useState } from 'react'
import { ArtistRevenue, DetailsHeader, Discography } from '../components'
import { useGetArtistDetailsQuery } from '../redux/services/artistApi'
import Input from '../components/Input'
import { useParams } from 'react-router-dom'
import { CgProfile } from "react-icons/cg";
import { GiWallet } from "react-icons/gi";
import { IoAlbums } from "react-icons/io5";
import { motion } from 'framer-motion'
import { GiLoveSong } from "react-icons/gi";
import { IoIosAlbums } from "react-icons/io";
import { IoAddOutline } from "react-icons/io5";



const ArtistAccount = () => {



    const { id: artistId } = useParams()

    const { data: artistData, isFetching: isFetchingArtistDetails, isError: error } = useGetArtistDetailsQuery(artistId)
    const [name, setName] = useState()
    const [genre, setGenre] = useState()

    const [email, setEmail] = useState()

    const [dob, setDOB] = useState()
    const [phone, setPhone] = useState()

    const ref = useRef()
    const [selected, setselected] = useState('infos')

    console.log('alert', artistData)
    return (
        <div className='w-full p-4 m-4 flex flex-wrap gap-4'>
            <DetailsHeader artiste_id={1} artistData={artistData} />

            <div className="flex sm:flex-col md:flex-row w-full justify-center items-center m-4" >
                <motion.div

                    whileHover={{
                        scale: 1.2,
                        transition: { duration: 1 },
                    }}
                    whileTap={{ scale: 0.9 }}
                    className="flex  w-20 p-2 m-2  justify-center items-center text-3xl text-orange-500 shadow-md shadow-orange-600 rounded-3xl h-10">
                    <IoAddOutline className='text-lg' />
                    <GiLoveSong />
                </motion.div>
                <motion.div

                    whileHover={{
                        scale: 1.2,
                        transition: { duration: 1 },
                    }}
                    whileTap={{ scale: 0.9 }}
                    className="flex w-20 p-2 m-2 justify-center items-center  text-3xl text-orange-500 shadow-md shadow-orange-600 rounded-3xl h-10">
                    <IoAddOutline className='text-lg' />

                    <IoIosAlbums />
                </motion.div>
            </div>
            <div className="flex md:flex-row sm:flex-col sm:w-full w-full flex-wrap gap-5">
                <div className='lg:w-1/4 md:w-1/4 sm:w-full'>



                    <div className="flex md:w-full sm:w-full flex-col text-base font-semibold flex-wrap gap-3  m-2 p-2 mb-20 rounded-2xl shadow-md shadow-orange-600 h-auto">
                        <span onClick={() => setselected('infos')} className="flex cursor-pointer text-white flex-wrap gap-3 p-2 m-2 justify-start items-center"> <span className="text-orange-500 text-4xl"><CgProfile /></span> Infos</span>
                        <span onClick={() => setselected('revenus')} className="flex cursor-pointer text-white flex-wrap gap-3 p-2 m-2 justify-start items-center"> <span className="text-orange-500 text-4xl"><GiWallet /></span>Revenues</span>
                        <span onClick={() => setselected('disco')} className="flex cursor-pointer text-white flex-wrap gap-3 p-2 m-2 justify-start items-center"> <span className="text-orange-500 text-4xl"><IoAlbums /></span>Discographie</span>

                    </div>

                </div>

                {selected === 'infos' &&

                    <div className='md:w-3/5 lg:w-3/5 sm:w-full  rounded-2xl flex flex-col p-2 m-2 shadow-md shadow-orange-600'>
                        <div className='w-full mb-10 flex justify-center items-center flex-col flex-wrap gap-4'>
                            <h2 className='text-slate-200 text-xl font-semibold   rounded-2xl'>Details personnels</h2>


                            <div className='w-full'>
                                <div className='flex justify-around '>
                                    <Input className='w-1/2' default={artistData?.data?.attributes.name} value={artistData?.data?.attributes.name} name={'Nom'} useRef={ref} element="input" onInput={e => setName(e?.target.value)} />
                                    <Input className='w-1/2' value={artistData?.data?.attributes.genre} name={'Genre'} useRef={ref} element="input" onInput={e => setGenre(e?.target.value)} />
                                </div>
                                <div className="flex justify-around">
                                    <Input className='w-1/2' value={artistData?.data.attributes.date} name={'Date de naissance'} useRef={ref} element="input" onInput={e => setDOB(e?.target.value)} />
                                    <Input className='w-1/2' default={artistData?.data.attributes.email} name={'email'} useRef={ref} element="input" onInput={e => setEmail(e?.target.value)} />
                                </div>

                                <Input name={'Téléphone'} value={artistData?.data.attributes.phone} useRef={ref} element="input" onInput={e => setPhone(e?.target.value)} />
                            </div>


                        </div>


                        <div className='w-full mb-10 flex justify-center items-center flex-col flex-wrap gap-4'>
                            <h2 className='text-slate-200 text-xl font-semibold   rounded-2xl'>Changer de mot de passe</h2>

                            <div className='w-full'>
                                <div className='flex justify-around '>
                                    <Input className='w-1/2' name={'Ancien Mot de passe'} useRef={ref} element="input" onInput={e => console.log(e)} />
                                    <Input className='w-1/2' name={'Nouveau Mot de passe'} useRef={ref} element="input" onInput={e => console.log(e)} />
                                </div>
                                <div className="flex justify-around">
                                    <Input className='w-1/2' name={'Confirmé mot de passe'} useRef={ref} element="input" onInput={e => console.log(e)} />

                                </div>


                            </div>

                        </div>

                        <div className='w-full mb-10 flex justify-center items-center flex-col flex-wrap gap-4'>
                            <h2 className='text-slate-200 text-xl font-semibold   rounded-2xl'>Adresse</h2>
                            <div className='w-full'>
                                <div className='flex justify-around '>
                                    <Input className='w-1/2 uppercase' value={artistData?.data.attributes.Pays} name={'Pays'} useRef={ref} element="input" onInput={e => console.log(e)} />
                                    <Input className='w-1/2 capitalize' value={artistData?.data.attributes.ville} name={'Ville'} useRef={ref} element="input" onInput={e => console.log(e)} />
                                </div>
                                <div className="flex justify-around">
                                    <Input className='w-1/2 capitalize' value={artistData?.data.attributes.adresse} name={'Adresse'} useRef={ref} element="input" onInput={e => console.log(e)} />
                                    <Input className='w-1/2' value={artistData?.data.attributes.pays} name={'Precision'} useRef={ref} element="input" onInput={e => console.log(e)} />
                                </div>


                            </div>
                        </div>

                    </div>
                }

                {selected === 'revenus' &&
                    <ArtistRevenue artistID={artistId} />
                }

                {selected === 'disco' &&
                    <Discography artistID={artistId} />
                }

            </div>


        </div>
    )
}

export default ArtistAccount