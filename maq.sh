#!/bin/bash

echo "deseja alterar a senha do usuario ubuntu? (s/n) recomendado se for primeira conexao"
read inst
if [ \"$inst\" == \"s\" ];
then
sudo passwd ubuntu
fi

echo "Vamos atualizar sua maquina, se aparecer uma tela roxa selecione os espacos utilizando as setas para direcionamento e espaco para marcar (selecione todos os campos), aperte enter para confirmar)"
sleep 5

sudo apt update && sudo apt upgrade -y

cd /home
xauth add $(xauth -f /home/ubuntu/.Xauthority list|tail -l)
export DISPLAY=:0.0

cd /home/ubuntu
git clone https://github.com/Qquehue/arquivos-sh.git
cd /home/ubuntu/Script-CTC
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo "Gostaria de instalar uma interface gráfica ? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then

sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y

java -version
VERSION="$(java -version 2>&1 | grep version | cut -d'"' -f2)"
if [ "${VERSION}" ];
then
echo "Cliente possui java instalado: ${VERSION}"
sleep 2
else
echo "Cliente nao possui java instalado"
sleep 2
echo "Instalando o Java..."
sleep 2
sudo apt install default-jdk
echo "Voce esta aqui:"
pwd
  cd /home/ubuntu/arquivos-sh
  sudo chmod 777 guiJava.sh

echo "instalando docker..."
sleep 2
sudo apt install docker.io -y

echo "Faça uma conexão com interface gráfica, abra o terminal e digite: guiJava"
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
fi
else
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo "Baixando aplicação versão CLI"
sleep 2
git clone https://Qquehue@github.com/Qquehue/CTC-LocalApp-CLI
#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
echo "instalando docker..."
sleep 3

sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker
docker build -t dockerfile .
docker run -d -p 3306:3306 --name bd-CTC -e MYSQL_ROOT_PASSWORD=urubu100 -e MYSQL_DATABASE=bd-CTC dockerfile

echo "Banco ctc criado"
sleep 2
cd arquivos-sh

echo "Voce esta aqui:"
pwd
sleep 2

alias cliJava="cd /home/ubuntu/arquivos-sh ; bash cliJava.sh"

  cd /home/ubuntu/arquivos-sh
  sudo chmod 777 cliJava.sh

echo "Digite o seguinte comando para inciar a aplicacao: cliJava"
fi