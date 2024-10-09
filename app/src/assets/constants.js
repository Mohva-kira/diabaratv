import { HiOutlineHashtag, HiOutlineHome, HiOutlinePhotograph, HiOutlineUserGroup, HiHeart, HiPlusCircle } from 'react-icons/hi';

export const genres = [
  { title: 'Pop', value: 'POP' },
  { title: 'Hip-Hop', value: 'HIP_HOP_RAP' },
  { title: 'Dance', value: 'DANCE' },
  { title: 'Electronic', value: 'ELECTRONIC' },
  { title: 'Soul', value: 'SOUL_RNB' },
  { title: 'Alternative', value: 'ALTERNATIVE' },
  { title: 'Rock', value: 'ROCK' },
  { title: 'Latin', value: 'LATIN' },
  { title: 'Film', value: 'FILM_TV' },
  { title: 'Country', value: 'COUNTRY' },
  { title: 'Worldwide', value: 'WORLDWIDE' },
  { title: 'Reggae', value: 'REGGAE_DANCE_HALL' },
  { title: 'House', value: 'HOUSE' },
  { title: 'K-Pop', value: 'K_POP' },
];

export const links = [
  { name: 'Découvrir', to: '/', icon: HiOutlineHome },
  { name: 'Autour de toi', to: '/around-you', icon: HiOutlinePhotograph },
  { name: 'Meilleurs artistes', to: '/top-artists', icon: HiOutlineUserGroup },
  { name: 'Favoris', to: '/favourites', icon: HiHeart },
  { name: 'Playlists', to: '/playlists', icon: HiPlusCircle },
  { name: 'Prix', to: '/pricing', icon: HiPlusCircle },
];

