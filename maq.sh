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

echo "Gostaria de instalar uma interface gráfica ? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then

sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y

echo "Instalando o Java..."
sleep 2
sudo apt install default-jre -y
echo "Voce esta aqui:"
pwd
  cd /home/ubuntu/arquivos-sh
  sudo chmod 777 guiJava.sh

echo "instalando docker..."
sleep 2
cd /home/ubuntu/Script-CTC

sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo docker pull mysql:8.0
  sudo docker run -d -p 3306:3306 --name bd-CTC -e "MYSQL_DATABASE=bd-CTC" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:8.0
 
  sudo docker exec -it bd-CTC mysql -u root -p -B -N -e"
USE bd-CTC;

create table usoMaquinaReal 
(  
idUso INT PRIMARY KEY AUTO_INCREMENT, 
processos INT, 
usoCPU DOUBLE,
usoMemoria DOUBLE,
upTime DATETIME, 
identificador INT
);"

echo "Faça uma conexão com interface gráfica, abra o terminal e digite: guiJava"
else
cd /home/ubuntu
echo "Baixando aplicação versão CLI"
sleep 2
git clone https://github.com/Qquehue/CTC-LocalApp-CLI.git
echo "instalando docker..."
sleep 3

sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo docker pull mysql:8.0
  sudo docker run -d -p 3306:3306 --name bd-CTC -e "MYSQL_DATABASE=bd-CTC" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:8.0
  sudo docker exec -it bd-CTC mysql -u root -p -B -N -e"
USE bd-CTC;

create table usoMaquinaReal 
(  
idUso INT PRIMARY KEY AUTO_INCREMENT, 
processos INT, 
usoCPU DOUBLE,
usoMemoria DOUBLE,
upTime DATETIME, 
identificador INT
);"

echo "Banco ctc criado"
sleep 2
  
  cd /home/ubuntu/arquivos-sh
  sudo chmod 777 cliJava.sh

  cd /home/ubuntu/Script-CTC/java
sudo docker build -t dockerfile .
sudo docker run -d -t --name java-CTC dockerfile

cd /homr/ubuntu/CTC-LocalApp-CLI/API/local-app/target
echo "Voce esta aqui:"
pwd
sleep 2
echo "Digite o seguinte comando para inciar a aplicacao: bash cliJava.sh"
java -jar local-app-1.0-SNAPSHOT-jar-with-dependencies.jar
fi