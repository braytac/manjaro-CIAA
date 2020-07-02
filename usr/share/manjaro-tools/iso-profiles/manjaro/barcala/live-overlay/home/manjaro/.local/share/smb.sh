#sudo mount.cifs //163.10.3.178/"Almacenamiento permanente" ~/Almacenamiento_Permanente -o username=guest,password=''
sleep 10
gio mount smb://163.10.3.178/"Almacenamiento permanente" < ~/.local/share/srvcred