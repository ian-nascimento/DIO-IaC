#!/bin/bash
#----------------------------------------------------------------------------------
# provision-web-server.sh - Script de Provisionamento de um Servidor Web com Apache
#
# Autor: Ian Nascimento
#----------------------------------------------------------------------------------

printf "Atualizando o servidor\n"
apt update && apt upgrade -y

printf "Instalando os pacotes Apache2 e unzip\n"
apt install -y apache2 unzip

printf "Baixando a aplicação no diretório /tmp"
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -P /tmp/

printf "Extraindo/Copiando os arquivos da aplicação no diretório padrão do Apache (/var/www/html/)"
unzip /tmp/main.zip -d /tmp/
cp -pr /tmp/linux-site-dio-main/* /var/www/html/

printf "Reiniciando o serviço apache2"
systemctl restart apache2.service