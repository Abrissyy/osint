#!/bin/bash


export LANG=en_US.UTF-8

clear_screen() {
    clear
    cat logo.abrissy
    echo
    echo "Welcome to 1000101 Osint tool. Type 'help' to get help"
}

clear_screen

while true; do
    read -p "$USER <~> " hud

    case $hud in
        help)
            echo
            echo "ipl    - Search information about IPV4 Public address"
            echo "web    - Type web domain to get IP address"
            echo "clear  - Clearing console"
            echo "myip   - Get your IPV4 public address"
            echo "tping  - Try ping public ipv4 adress (does not work on every IP address"
            echo "nmcli  - get informations about your wifi card"
            echo "port   - scan ip for open ports"
            echo "mport  - check your internet open ports "
            echo "proxyc - you can check proxy adress. you will get website source if proxy working"
            echo "ahost  - scan for active hosts on ip"
            echo 
            echo "doxh   - Doxxing template builder"
            echo
            echo "req-ins- Download all reqiremeants" 
            echo "credit - Read credits"
            echo "stop   - Exit"
            echo
            ;;
        ipl)
            read -p "$USER <~> Public IPV4/ " ip
            curl ipinfo.io/"$ip"?token=7ac6b2bcbf4dae
            echo
            ;;
        credit)
            echo
            echo "Tool coded by Abrissy (t.me/Abrissy)"
            echo "Discord server: "https://discord.gg/FzJgXTC2Wg
            echo "Official website - https://abrissyy.github.io/100101"
            echo "Partners - https://abrissyy.github.io/100101/partners"
            echo "Tool working on - Windows 32/64 bit and Linux any distribution (wine package required)"
            echo "Github - https://github.com/Abrissyy"
            echo
            ;;
        web)
            echo
            read -p "$USER <~> Web Domain/ " web
            ping -c 1 "$web"
            echo
            ;;
        myip)
            echo
            read -p "Are you sure you want to show your own IP? (Y/N) " confirm
            if [ "$confirm" = "Y" ] || [ "$confirm" = "y" ]; then
                curl https://api.ipify.org
            fi
            echo
            ;;
        clear)
            clear_screen
            ;;
        tping)
            echo "If you want stop pinging IP just clikc ctrl + C"
            read -p "$USER <~> Public IPV4/ " ip
            ping $ip
            ;;
        nmcli)
            nmcli 
        ;;
        stop)
        echo "1000101 osint has been disabled"
        exit 
        ;;
        req-ins)
        echo "ubuntu | kali | arch | fedora |"
        echo "choose your OS to install packages (if you use termux or WSL choose ubuntu)"
        read -p "$USER <~> OS/ " os

        case $os in
    ubuntu)
        sudo apt-get install nmap
        sudo apt-get install networkmanager
        echo "Succesful downloaded osint requiremeants"
        ;;
    kali)
        sudo apt-get install nmap
        sudo apt-get install networkmanager
        echo "Succesful downloaded osint requiremeants"

        ;;
    arch)
        pacman -S nmap
        pacman -S networkmanager
        echo "Succesful downloaded osint requiremeants"
        ;;
    fedora)
        sudo dnf install nmap
        sudo dnf install networkmanager
        echo "Succesful downloaded osint requiremeants"
        ;;
    *)
        echo "invalid OS"
        ;;
esac
        ;;
        port)
        read -p "$USER <~> Public IP/ " ip
        nmap $ip
        ;;
        mport)
        nmap localhost
        ;;
        proxyc)
        echo "REMEMBER if you checking http proxy u must type HTTP website!"
        read -p "$USER <~> proxy_ip:port/ " proxy
        read -p "$USER <~> website to check/ " url
        curl -x $proxy $url
        ;;
        ahost)
        read -p "$USER <~> IP/ " ip
        nmap -sn $ip/24
        ;;
        doxh)
        read -p "$USER <~> Name/ " name
        read -p "$USER <~> Last name/" lastname
        read -p "$USER <~> Discord name/ " dcname
        read -p "$USER <~> Discord ID/ " dcid
        read -p "$USER <~> Country/ " country
        read -p "$USER <~> City/ " city
        read -p "$USER <~> Dox reason/ " reason
        read -p "$USER <~> victim instagram url/ " instagram
        read -p "$USER <~> victim facebook profile url/ " fb
        read -p "$USER <~> victim tiktok url/ " tiktok
        read -p "$USER <~> victim youtube url/ " youtube
        read -p "$USER <~> victim snapchat name/ " snapchat
        read -p "$USER <~> ip adress/ " ip
        read -p "$USER <~> timezone/ " timezone
        read -p "$USER <~> phone number/ " phone
        read -p "$USER <~> Age/ " age
        camel=$(<camel.abrissy)
        del "dox.txt"
        echo "
┌──────────────────────────────────────────────────────────────────────────────────┐
│                                Join 100101 Cult                                  │
│                         https://discord.gg/g3p325R9Yn                            │
└──────────────────────────────────────────────────────────────────────────────────┘
        $camel
        Reason: $reason
        ---> Personal Informations:
        Name: $name
        Last name: $lastname
        Full name: $name $lastname
        Age: $age
        City: $city
        Country: $country
        Timezone: $timezone
        Phone number: $phone

        ---> Social media:
        Discord name: $dcname
        Discord ID: $dcid
        Snapchat: $snapchat
        Instagram: $instagram
        Youtube: $youtube
        Tiktok: $tiktok
        Facebook: $fb
        ">> dox.txt

        ;;
        *)
            echo "Invalid option. Type 'help' for available options."
            ;;
    esac
done
