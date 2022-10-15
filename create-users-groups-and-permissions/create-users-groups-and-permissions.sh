#!/bin/bash
#------------------------------------------------------------------------------------------------------
# create-users-groups-and-permissions.sh - Script de Criação de Estrutura de Usuários, Diretórios e Permissões
#
# Autor: Ian Nascimento
#------------------------------------------------------------------------------------------------------

diretorios=("/publico" "/adm" "/ven" "/sec")

grupos=("grp_adm" "grp_ven" "grp_sec")

usuarios_adm=("carlos" "maria" "joao")
usuarios_ven=("debora" "sebastiana" "roberto")
usuarios_sec=("josefina" "amanda" "rogerio")

usuarios=$(echo ${usuarios_adm[@]} ${usuarios_ven[@]} ${usuarios_sec[@]})

# Exclui diretórios, arquivos, grupos e usuários criados anteriormente
excluir(){
    for d in ${diretorios[@]}
    do
        rm -rf $d
    done

    for g in ${grupos[@]}
    do
        groupdel $g
    done

    for u in ${usuarios[@]}
    do
        userdel -f -r $u
  done
}

# Cria diretórios, arquivos, grupos e usuários
criar(){
    for d in ${diretorios[@]} 
    do
        mkdir -p $d
    done

    for g in ${grupos[@]} 
    do
        groupadd $g
    done

    for u in ${usuarios[@]} 
    do
        useradd $u   
    done
}

# Define as permissões de acesso dos usuários e grupos aos diretórios e arquivos
definir_permissoes(){
    for u_adm in ${usuarios_adm[@]} 
    do
        usermod -a -G grp_adm $u_adm
    done

    for u_ven in ${usuarios_ven[@]} 
    do
        usermod -a -G grp_ven $u_ven
    done

    for u_sec in ${usuarios_sec[@]} 
    do
        usermod -a -G grp_sec $u_sec
    done
    
    # O dono de todos os diretórios criados será o usuário root
    # Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório
    # Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertecem;
    for d in ${diretorios[@]} 
    do
        chown root $d
        chmod g+rwx $d
        chmod o-rwx $d
        if [ $d == "/adm" ]; then
            chgrp grp_adm $d
        elif [ $d == "/ven" ]; then
            chgrp grp_ven $d
        elif [ $d == "/sec" ]; then
            chgrp grp_sec $d
        fi        
    done
   
    # Todos os usuários terão permissão total dentro do diretório publico;
    chmod 777 /publico  
}

printf "Removendo diretórios, arquivos, grupos e usuários criados anteriormente\n"
excluir

printf "Criando diretórios, arquivos, grupos e usuários\n"
criar

printf "Definindo as permissões de acesso dos usuários e grupos aos diretórios e arquivos\n"
definir_permissoes

exit 0