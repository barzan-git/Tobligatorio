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
 echo "Ingrese el nombre del producto que desea comprar"
    read nombredelproducto
    echo "Ingrese la cantidad que desea comprar"
    read cantidad
    archivo="/home/alumno/Desktop/productos.txt"
    tempfile=$(mktemp)
    encontrado=0

    while IFS= read -r nombre && IFS= read -r descripcion && IFS= read -r precio && IFS= read -r stock && IFS= read -r guion; do
        if [[ $nombredelproducto == $nombre ]]; then
            encontrado=1
            if (( stock >= cantidad )); then
                newstock=$(( stock - cantidad ))
                echo "$nombre" >> "$tempfile"
                echo "$descripcion" >> "$tempfile"
                echo "$precio" >> "$tempfile"
                echo "$newstock" >> "$tempfile"
                echo "#" >> "$tempfile"
                echo "Venta realizada con éxito"
            else
                echo "No hay suficiente stock para realizar la venta"
                echo "$nombre" >> "$tempfile"
                echo "$descripcion" >> "$tempfile"
                echo "$precio" >> "$tempfile"
                echo "$stock" >> "$tempfile"
                echo "#" >> "$tempfile"
            fi
        else
            echo "$nombre" >> "$tempfile"
            echo "$descripcion" >> "$tempfile"
            echo "$precio" >> "$tempfile"
            echo "$stock" >> "$tempfile"
            echo "#" >> "$tempfile"
        fi
    done < "$archivo"

    if (( encontrado == 0 )); then
        echo "Producto no encontrado"
    fi

    mv "$tempfile" "$archivo"
}
menuinicio
