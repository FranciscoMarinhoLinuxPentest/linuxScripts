#!/bin/bash
###Programa de instalação
####Francisco Marinho
echo "Instalando Programas necessários"
apt install wget -y 
apt install mplayer -y
apt install unzip -y
apt install make gcc cmake build-essential -y 
echo "Baixando o programa principal"
wget https://github.com/ujjwal96/xwinwrap/archive/master.zip
echo "Descompactando"
unzip master.zip
cd xwinwrap-master
echo "Compilando"
make
mv xwinwrap /usr/bin/
echo "Qual o caminho onde está o video"
echo "Digite o caminho inteiro.."
read video
echo "Criando arquivo de configuração"
rm /bin/screen.sh
touch screen.sh
echo "#!/bin/bash">>screen.sh
echo "xwinwrap -ni  -fs -s -st -sp -b -nf -- mplayer -nosound -loop 0  -wid WID $video ">>screen.sh
mv screen.sh /bin
echo "Criado arquivo de configuração"
echo "Inicie o programa digitando screen.sh no seu terminal"
