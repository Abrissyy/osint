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
            echo "credit - Get information about tool"
            echo "clear  - Clearing console"
            echo "myip   - Get your IPV4 public address"
            echo "tping  - Try ping public ipv4 adress (its dont work for every ip adress)"
            echo "nmcli  - get informations about your wifi card"
            echo "stop   - Exit"
            echo "port   - scan ip for open ports"
            echo "mport  - check your internet open ports "
            echo "proxyc - you can check proxy adress. you will get website source if proxy working"
            echo "ahost  - scan for active hosts on ip"
            echo
            echo "req    - list of required modules on your linux" 
            echo "readme - Read credits"
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
        readme)
            clear
            cat credits.txt
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
        req)
        echo Required modules list:
        echo "- NetworkManager"
        echo "- nmap"
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
        *)
            echo "Invalid option. Type 'help' for available options."
            ;;
    esac
done
