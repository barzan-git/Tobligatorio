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
