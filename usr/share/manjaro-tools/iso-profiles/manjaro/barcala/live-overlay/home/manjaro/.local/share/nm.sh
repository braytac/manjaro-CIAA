#!/bin/bash

set -- $(cat /proc/cmdline)
for x in "$@"; do
    case "$x" in
        ipadd=*)
        ipadd="${x#ipadd=}"
        ;;
        dns=*)
        dns="${x#dns=}"
        ;;
        gateway=*)
        gateway="${x#gateway=}"
        ;;
    esac
done

if [[ -n $ipadd && -n $gateway && -n $dns ]]; then

	conam=$(nmcli con show | grep -i ethernet | awk -v connam=$1 'BEGIN {FS="  "}; {print $1}')
	nmcli con modify "$conam" ipv4.addresses ${ipadd}/26 ipv4.gateway ${gateway} ipv4.dns ${dns}
	nmcli con mod "$conam" ipv4.method manual
	nmcli con down "$conam"
	nmcli con up "$conam"
fi


if [[ -n $ip_shared && -n $re_shared ]]; then
    #sudo mount.cifs //163.10.3.178/"Almacenamiento permanente" ~/Almacenamiento_Permanente -o username=guest,password=''
    sleep 10
    gio mount smb://"$ip_shared"/"$re_shared" < ~/.local/share/srvcred
fi 