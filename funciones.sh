menuinicio() {
while true; do
	echo "1. Ingresar con ususario"
	echo "2. Registrar usuario"
	read option
	case $option in
		1) verificarusuario ;; 
		2) registrarusuario ;;
		*) echo "Opcion no valida"
	esac
done
}


estaverif=0
verificarusuario() {
echo "ingrese usuario"
read usuario
echo "ingrese contrasena"
read contrasena
archivo="/home/alumno/Desktop/usuarios.txt"
	while IFS= read -r nombre &&  IFS= read -r contra && IFS= read -r guion; do
	if [[ $usuario == $nombre && $contrasena == $contra ]]; then
		estaverif=1
		break
	fi
	done < "$archivo"
	if [[ "$estaverif" -eq 1 ]]; then
	menusistema
	else
	echo "Registre el usuario"
	fi
}

registrarusuario() {
	echo "ingrese usuario"
	read usuarionuevo
	archivo="/home/alumno/Desktop/usuarios.txt"
	while IFS= read -r nombre && IFS= read -r contra && IFS= read -r guion; do
	if [[ $usuarionuevo == $nombre ]]; then
		estauser=1
		break
	fi
	done < "$archivo"
	if [[ "$estauser" -eq 1 ]]; then
	echo "usuario ya existente"
	verificarusuario
	else
	echo "ingrese contrasena"
	read contrasenanueva
	echo "$usuarionuevo" >> usuarios.txt
	echo "$contrasenanueva" >> usuarios.txt
	echo "#" >> usuarios.txt
	echo "usuario nuevo agregado"
	menusistema
	fi
}

menusistema() {
while true; do
	echo "1. Alta de productos"
	echo "2. Venta de productos"
	echo "3. Salir"
	read option
	case $option in
		1) altadeproducto ;;
		2) ventadeproductos ;;
		3) menuinicio ;;
		*) echo "Opcion no valida"
	esac
done
}

altadeproducto() { 
	
}

ventadeproductos() {

}
menuinicio
