pathBackup=$1
pathDestino=$2
prefixo=$3
gerado=$pathDestino/$prefixo.tar

data=$(date +"%Y%m%d_%H%M%S")

#pega o penúltimo arquivo gerado para comparar com o último
ultimo=`ls -r1 $pathDestino/$prefixo* | sed -n '1p'`

tar -cvf $gerado $pathBackup

#descompacto o último para comparar
gunzip $ultimo

ultimo=`echo $ultimo | cut -d'.' -f 1 | awk '{print $1".tar"}'`

echo "ultimo: $ultimo"
echo "gerado: $gerado"

#se existir
if [ -f "$ultimo" ] ;then
	#file found
	cmp $ultimo $gerado
	result="$?"	
	echo "resultado: $result"	
	#iguais
	if [[ $result -eq 0 ]] ;then
		echo "arquivos iguais. Removerei o gerado: "$gerado
		rm -f $gerado
	 
		#compacto novamente o último
		gzip $ultimo
	else
		#compacto novamente o último
		gzip $ultimo
     
		#compacto o último gerado
		gzip $gerado
	 
		mv $gerado.gz $pathDestino/$prefixo"_"$data.tar.gz
	fi;
else
	#file not found
	#compacto o último gerado
	gzip $gerado
	mv $gerado.gz $pathDestino/$prefixo"_"$data.tar.gz
fi;