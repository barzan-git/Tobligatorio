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
	estaprod=0
	echo "ingrese nombre del producto" 
	read nombredelproductonuevo 
	archivo="/home/alumno/Desktop/productos.txt" 
	while IFS= read -r nombredelproducto && IFS= read -r descripcion && IFS= read -r precio && IFS= read -r stock && IFS= read -r guion; do 
	if [[ $nombredelproductonuevo == $nombredelproducto ]]; then 
		estaprod=1 
		break 
	fi 
	done < "$archivo" 
	if [[ "$estaprod" -eq 1 ]]; then 
		echo "producto ya existente" 
	else 
	echo "ingrese descripcion" 
	read descripcion 
	echo "ingrese precio" 
	read precio 
	echo "ingrese stock" 
	read stock 
	echo "$nombredelproductonuevo" >> productos.txt 
	echo "$descripcion" >> productos.txt 
	echo "$precio" >> productos.txt 
	echo "$stock" >> productos.txt 
	echo "#" >> productos.txt 
	echo "producto nuevo agregado" 
	fi 
}

ventadeproductos() {

}
menuinicio
