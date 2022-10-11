# Resoluções das tarefas e dos desafios propostos em BASH

## create-permissions-structure.sh:
- Usar como referência a imagem localizada em *images/create-permissions-structure-img-01.png* para a estrutura a ser criada;
- Excluir diretórios, arquivos, grupos e usuários criados anteriormente;
- Todo provisionamento deve ser feito em um arquivo do tipo Bash Script;
- O dono de todos os diretórios criados será o usuário root;
- Todos os usuários terão permissão total dentro do diretório *publico*;
- Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
- Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertecem;
- Subir arquivo de script criado para o GitHub;

## provision-web-server.sh:

- Atualizar o servidor;
- Instalar os pacotes Apache e Unzip;
- Baixar a aplicação disponível no endereço https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
- Copiar os arquivos da aplicação no diretório padrão do apache;
- Subir arquivo de script para um repositório no GitHub.

# Ambiente de testes com Vagrant

O Vagrant é utilizado neste projeto para subir uma máquina virtual local e temporária para testar os scripts criados.

Altere o Vagrantfile para especificar qual dos scripts será executado. Exemplo:

`config.vm.provision "shell", path: "create-permissions-structure.sh"`