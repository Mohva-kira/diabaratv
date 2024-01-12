import React from "react";
import "./header.css";

import { Fragment, useState } from "react";
import { Dialog, Disclosure, Popover, Transition } from "@headlessui/react";
import Searchbar from "../Searchbar";
import {
  ArrowPathIcon,
  Cog8ToothIcon,
  ChartPieIcon,
  CursorArrowRaysIcon,
  FingerPrintIcon,
  SquaresPlusIcon,
  XMarkIcon,
  TvIcon,
  MusicalNoteIcon,
  GiftIcon,
  UserIcon,
  UserCircleIcon
  
} from "@heroicons/react/24/outline";
import { IoIosLogOut } from "react-icons/io";
// import { PiTelevisionSimpleLight } from "react-icons/pi";

import {
  ChevronDownIcon,
  PhoneIcon,
  PlayCircleIcon,
  
} from "@heroicons/react/20/solid";
import { logOut } from "../../redux/features/auth/authSlice";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";

function classNames(...classes) {
  return classes.filter(Boolean).join(" ");
}



const account = [
  {
    name: "Profile",
    description: "Toutes les informations sur votre compte",
    href: "/profile",
    icon: UserCircleIcon
    
  }
]

const products = [
  {
    name: "Web TV",
    description: "La chaine télé en ligne",
    href: "#",
    icon: TvIcon
    ,
  },
  {
    name: "Musique",
    description: "De la musique à volonté en streaming",
    href: "#",
    icon: MusicalNoteIcon,
  },
  {
    name: "Goodies",
    description: "Toutes type d'accessoires pour le bien être des auditeurs",
    href: "#",
    icon: GiftIcon,
  },

];
const callsToAction = [
  { name: "Deconnexion", href: "#", icon: PhoneIcon },
];



const auth = [
  { name: "Deconnexion", href: "#" , icon: IoIosLogOut },
  // { name: "Contact sales", href: "#", icon: PhoneIcon },
];

const Header = () => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const dispatch = useDispatch()
  const navigate = useNavigate()
  const stateUser = useSelector(state => state.auth)
  const storageUser = JSON.parse(localStorage.getItem('auth'))
  const user = stateUser?.auth.user ? stateUser : storageUser

  console.warn('user', user)
  const logout = async () => {
    dispatch(logOut())
    localStorage.clear()
    console.log('cleared')
    navigate('/login')
    
  }
  
  return (
    <header className="bg-[#191624] p-2 mt-2">
      <nav
        className="mx-auto flex max-w-7xl items-center justify-between  lg:px-8"
        aria-label="Global"
      >
        {/* <div className="flex lg:flex-1">
          <a href="#" className="-m-1.5 p-1.5">
            <span className="sr-only">Your Company</span>
            <img
              className="h-8 w-auto"
              src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
              alt=""
            />
          </a>
        </div> */}
        <div className="flex ">
          <Searchbar />
        </div>
        <div className="flex lg:hidden absolute md:hidden block top-16 right-5">
          <button
            type="button"
            className="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700"
            onClick={() => setMobileMenuOpen(true)}
          >
            <span className="sr-only">Open main menu</span>
            <Cog8ToothIcon className="h-6 w-6" aria-hidden="true" />
          </button>
        </div>
        <Popover.Group className="hidden lg:flex lg:gap-x-12">
          <Popover className="relative">
            <Popover.Button className="flex items-center gap-x-1 text-sm font-semibold text-gray-400 hover:text-cyan-400">
              Nos produits
              <ChevronDownIcon
                className="h-5 w-5 flex-none text-gray-400 hover:text-cyan-400"
                aria-hidden="true"
              />
            </Popover.Button>

            <Transition
              as={Fragment}
              enter="transition ease-out duration-200"
              enterFrom="opacity-0 translate-y-1"
              enterTo="opacity-100 translate-y-0"
              leave="transition ease-in duration-150"
              leaveFrom="opacity-100 translate-y-0"
              leaveTo="opacity-0 translate-y-1"
            >
              <Popover.Panel className="absolute bg-[#483d8b] -left-8 top-full z-10 mt-3 w-screen max-w-md overflow-hidden rounded-3xl shadow-lg ring-1 ring-gray-900/5">
                <div className="p-4">
                  {products.map((item) => (
                    <div
                      key={item.name}
                      className="group relative flex items-center gap-x-6 rounded-lg p-4 text-sm leading-6  text-gray-400 hover:text-cyan-400"
                    >
                      <div className="flex h-11 w-11 flex-none items-center justify-center rounded-lg bg-gray-50 group-hover:bg-white">
                        <item.icon
                          className="h-6 w-6 text-gray-400 group-hover:text-cyan-400"
                          aria-hidden="true"
                        />
                      </div>
                      <div className="flex-auto">
                        <a
                          href={item.href}
                          className="block font-semibold text-gray-400 hover:text-cyan-400"
                        >
                          {item.name}
                          <span className="absolute inset-0" />
                        </a>
                        <p className="mt-1 text-gray-400 ">
                          {item.description}
                        </p>
                      </div>
                    </div>
                  ))}
                </div>
                <div className="grid grid-cols-2 divide-x divide-gray-900/5 bg-gray-50">
                  {auth.map((item) => (
                    <a
                      key={item.name}
                      href={item.href}
                      className="flex items-center justify-center gap-x-2.5 p-3 text-sm font-semibold leading-6 text-gray-900 hover:bg-gray-100"
                    >
                      <item.icon
                        className="h-5 w-5 flex-none text-gray-400"
                        aria-hidden="true"
                      />
                      {item.name}
                    </a>
                  ))}
                </div>
              </Popover.Panel>
            </Transition>
          </Popover>

          <a
            href="#"
            className="text-sm font-semibold leading-6  text-gray-400 hover:text-cyan-400"
          >
            Fonctionnalités
          </a>
          <a
            href="#"
            className="text-sm font-semibold leading-6  text-gray-400 hover:text-cyan-400"
          >
            Boutiques
          </a>
          <a
            href="#"
            className="text-sm font-semibold leading-6 text-gray-400 hover:text-cyan-400"
          >
            Qui sommes nous? 
          </a>
        </Popover.Group>
        <div className="hidden lg:flex lg:flex-1 lg:justify-end">
          <Popover className="relative">
            <Popover.Button className="flex justify-center items-center gap-x-1  text-sm font-semibold text-gray-400 hover:text-cyan-400">
              <a
                href="/auth"
                className="font-semibold leading-6  text-gray-400 hover:text-cyan-400"

              >
                <div className=" text-white text-xs p-1"> 
                  <p>{user?.auth ? user?.auth?.user?.username : user.user.username}</p>
                  
                </div>
                <div className="w-10 mt-1 "> 
                <p className=" bg-blue-600 bg-opacity-80 rounded-full"> <UserIcon /> </p>  
                </div>
              </a>
              <ChevronDownIcon
                className="h-5 w-5 flex-none text-gray-400 hover:text-cyan-400"
                aria-hidden="true"
              />
            </Popover.Button>

            <Transition
              as={Fragment}
              enter="transition ease-out duration-200"
              enterFrom="opacity-0 translate-y-1"
              enterTo="opacity-100 translate-y-0"
              leave="transition ease-in duration-150"
              leaveFrom="opacity-100 translate-y-0"
              leaveTo="opacity-0 translate-y-1"
            >
              <Popover.Panel className="absolute bg-[#483d8b] -left-72 top-full z-10 mt-3 w-96 max-w-md overflow-hidden rounded-3xl shadow-lg ring-1 ring-gray-900/5">
                <div className="p-4">
                  {account.map((item) => (
                    <div
                      key={item.name}
                      className="group relative flex items-center gap-x-6 rounded-lg p-4 text-sm leading-6  text-gray-400 hover:text-cyan-400"
                    >
                      <div className="flex h-11 w-11 flex-none items-center justify-center rounded-lg bg-gray-50 group-hover:bg-white">
                        <item.icon
                          className="h-6 w-6 text-gray-400 group-hover:text-cyan-400"
                          aria-hidden="true"
                        />
                      </div>
                      <div className="flex-auto">
                        <a
                          href={item.href}
                          className="block font-semibold text-gray-400 hover:text-cyan-400"
                        >
                          {item.name}
                          <span className="absolute inset-0" />
                        </a>
                        <p className="mt-1 text-gray-400 ">
                          {item.description}
                        </p>
                      </div>
                    </div>
                  ))}
                </div>
                <div className="grid grid-cols-2 divide-x divide-gray-900/5 bg-gray-50">
                  {auth.map((item) => (
                    <a
                      key={item.name}
                      href={item.href}
                      onClick={() => logout()}
                      className="flex items-center justify-center gap-x-2.5 p-3 text-sm font-semibold leading-6 text-gray-900 hover:bg-gray-100"
                    >
                      <item.icon
                        className="h-5 w-5 flex-none text-gray-400"
                        aria-hidden="true"
                      />
                      {item.name}
                    </a>
                  ))}
                </div>
              </Popover.Panel>
            </Transition>
          </Popover>
        </div>
      </nav>
      <Dialog
        as="div"
        className="lg:hidden"
        open={mobileMenuOpen}
        onClose={setMobileMenuOpen}
      >
        <div className="fixed inset-0 z-10" />
        <Dialog.Panel
          className={`absolute top-0 h-screen w-2/3 bg-gradient-to-tl from-white/10 to-[#483d8b] 
                    background-blur-lg z-10 p-6 md:hidden smooth-transition ${
                      mobileMenuOpen ? "left-0" : "left-full"
                    }`}
        >
          <div className="flex items-center justify-between">
            <a href="#" className="-m-1.5 p-1.5">
              <span className="sr-only">Your Company</span>
              <img
                className="h-8 w-auto"
                src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
                alt=""
              />
            </a>
            <button
              type="button"
              className="-m-2.5 rounded-md p-2.5 text-gray-700"
              onClick={() => setMobileMenuOpen(false)}
            >
              <span className="sr-only">Close menu</span>
              <XMarkIcon className="h-6 w-6" aria-hidden="true" />
            </button>
          </div>
          <div className="mt-6 flow-root">
            <div className="-my-6 divide-y divide-gray-500/10">
              <div className="space-y-2 py-6">
                <Disclosure as="div" className="-mx-3">
                  {({ open }) => (
                    <>
                      <Disclosure.Button className="flex w-full items-center justify-between rounded-lg py-2 pl-3 pr-3.5 text-base font-semibold leading-7 hover:bg-gray-50">
                        Product
                        <ChevronDownIcon
                          className={classNames(
                            open ? "rotate-180" : "",
                            "h-5 w-5 flex-none"
                          )}
                          aria-hidden="true"
                        />
                      </Disclosure.Button>
                      <Disclosure.Panel className="mt-2 space-y-2">
                        {[...products, ...callsToAction].map((item) => (
                          <Disclosure.Button
                            key={item.name}
                            as="a"
                            href={item.href}
                            className="block rounded-lg py-2 pl-6 pr-3 text-sm font-semibold leading-7 text-gray-900 hover:bg-gray-50"
                          >
                            {item.name}
                          </Disclosure.Button>
                        ))}
                      </Disclosure.Panel>
                    </>
                  )}
                </Disclosure>
                <a
                  href="#"
                  className="-mx-3 block rounded-lg py-2 px-3 text-base font-semibold leading-7 text-gray-400 hover:text-cyan-400"
                >
                  Features
                </a>
                <a
                  href="#"
                  className="-mx-3 block rounded-lg py-2 px-3 text-base font-semibold leading-7  text-gray-400 hover:text-cyan-400"
                >
                  Marketplace
                </a>
                <a
                  href="#"
                  className="-mx-3 block rounded-lg py-2 px-3 text-base font-semibold leading-7  text-gray-400 hover:text-cyan-400"
                >
                  Company
                </a>
              </div>
              <div className="py-6">
                <Disclosure as="div" className="-mx-3">
                  {({ open }) => (
                    <>
                      <Disclosure.Button className="flex w-full items-center justify-between rounded-lg py-2 pl-3 pr-3.5 text-base font-semibold leading-7 hover:bg-gray-50">
                        <a
                          href="#"
                          className="-mx-3 block rounded-lg py-2.5 px-3 text-base font-semibold leading-7  text-gray-400 hover:text-cyan-400"
                        >
                         <UserIcon /> <span aria-hidden="true">&rarr;</span>
                        </a>
                        <ChevronDownIcon
                          className={classNames(
                            open ? "rotate-180" : "",
                            "h-5 w-5 flex-none"
                          )}
                          aria-hidden="true"
                        />
                      </Disclosure.Button>
                      <Disclosure.Panel className="mt-2 space-y-2">
                        {[...products, ...callsToAction].map((item) => (
                          <Disclosure.Button
                            key={item.name}
                            as="a"
                         
                            onClick={() => logout()}
                            className="block rounded-lg py-2 pl-6 pr-3 text-sm font-semibold leading-7 text-gray-900 hover:bg-gray-50"
                          >
                            {item.name}
                          </Disclosure.Button>
                        ))}
                      </Disclosure.Panel>
                    </>
                  )}
                </Disclosure>
              </div>
            </div>
          </div>
        </Dialog.Panel>
      </Dialog>
    </header>
  );
};

export default Header;
