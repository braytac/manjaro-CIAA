#!/bin/bash
# ******************************************************
#  @file mntsqfs.sh
#  @brief Montar SQUASHFS wine si existe, actualizar menú,
#         apps en escritorio, y ejecutar posibles futuras operaciones 
#         sin reempaquetar ISO
# @author Enrique Cabo
# @version 1.1
# @date 05/10/2019
# ******************************************************

iso_path="/run/miso/img_dev"
FILE="/home/manjaro/.wine/home/extra.sh"


if [[ -f "$iso_path/wsfs" && ! -d "/home/manjaro/.wine" ]]; then

   echo "Detectado SQFS. Montando Overlay..."
   mkdir -p /home/manjaro/.wine /tmp/winesfs
   mount -t tmpfs none /home/manjaro/.wine
   mkdir /home/manjaro/.wine/up /home/manjaro/.wine/wrk

   chown  -R 1000:1000 /tmp/winesfs

   mount "$iso_path/wsfs" /tmp/winesfs
   mount -t overlay overlay -o lowerdir=/tmp/winesfs,upperdir=/home/manjaro/.wine/up,workdir=/home/manjaro/.wine/wrk /home/manjaro/.wine


   \cp -ran /tmp/winesfs/home/local/* /home/manjaro/.local/
   \cp -ran /tmp/winesfs/home/config/* /home/manjaro/.config/
   \cp -an "/tmp/winesfs/home/local/share/applications/wine/LTspice XVII.desktop" /home/manjaro/Escritorio
   \cp -an "/tmp/winesfs/home/local/share/applications/wine/Programs/Proteus 8 Professional/Proteus 8 Professional.desktop" /home/manjaro/Escritorio
   ln -s /tmp/winesfs/home/*.exe /home/manjaro/Escritorio/

fi
echo $FILE
if [ -f "$FILE" ]; then
    echo "Ejecutando script opcional extra.sh..."
    /bin/sh $FILE
fi
   chown 1000:1000 /home/manjaro/.wine
