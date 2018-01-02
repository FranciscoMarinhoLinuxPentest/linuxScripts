#!/bin/bash
##Script de Atualização do Kernel
##Criado por Francisco Marinho
##Obtendo kernel atual

echo "Seu Kernel Atual é:"
uname -r

KERNEL_ATUAL=$(uname -r | tr -d ". a b c d e f g h i j k l m n o p q r s t u v x y z A B C D E F G H I J K L M N O P Q R S T U V X Y Z"
)
instalar=$(cat install)
touch install
cont=0
cont1=0
apt update -y 
apt-cache search linux-image |awk '{print $1}' | grep -v linux-headers >>lista

apt-cache search linux-image |awk '{print $1}' | grep  image | awk  -F - '{print $3}' | tr -d "." >>lista_kernel

for KERNEL_NOVO in $( cat lista_kernel )
do
		test $KERNEL_NOVO -gt $KERNEL_ATUAL &> /dev/null   && test $KERNEL_NOVO -gt $instalar &> /dev/null   && echo $KERNEL_NOVO >install 
done

for KERNEL_NEW in $(cat lista_kernel)
do
	(((cont++)))
	test $KERNEL_NEW -eq $instalar 2> /dev/null && break 
done

for kernel in $(cat lista)
do
	(((cont1++)))
	echo $kernel >final
	test $cont1 -eq $cont && break
done
clear
echo "INSTALANDO NOVO KERNEL"
sleep 5
apt install `cat final` -y
rm -rf instalar
rm -rf final
rm -rf lista
rm -rf lista_kernel
echo "Se computador será reiniciadoem 5s"
sleep 5
reboot
