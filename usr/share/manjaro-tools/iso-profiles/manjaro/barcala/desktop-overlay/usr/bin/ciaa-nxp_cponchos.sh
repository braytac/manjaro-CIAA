#cd ~/Documentos/firmware_v3
bold=$(tput bold)
normal=$(tput sgr0)
echo -e "Estás en: "$(pwd)"\n--- Firmware estable ---\n"
echo -e "${bold}make clean${normal}\t Borra todos los archivos generados durante la compilación, tests, etc
${bold}make info${normal}\t Información sobre la configuración actual 
${bold}make info_<mod>${normal}\t Información sobre alguno de los módulos de CIAA Firmware
${bold}make all${normal}\t Hace un make clean, generate y compila el proyecto
${bold}make${normal}\t\t Compilar incrementalmente el proyecto actual
${bold}make generate${normal}\t Generacion del RTOS
${bold}make download${normal}\t Flashear la CIAA y correr el programa
${bold}make openocd${normal}\t Iniciar openocd y escuchar esperando conexión con gdb
${bold}make erase${normal}\t Borrar el chip\n\n
Actualizar el firmware actual (v3) :\t${bold}git pull${normal}
Cambiar a firmware v2 y actualizarlo:\t${bold}cd ../firmware_v2 && git pull${normal}
Cambiar a Ponchos git y actualizarlo:\t${bold}~/Documentos/Ponchos && git pull${normal}
Cambiar a sAPI 0.5.0:\t\t\t${bold}cd ../sAPI-r0.5.0${normal}\n"
