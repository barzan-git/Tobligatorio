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

}

registrarusuario() {
	
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
