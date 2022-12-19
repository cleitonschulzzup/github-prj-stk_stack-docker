#/bin/bash
#PS4='LINENO:'

export script_dir=$(dirname "$0")
source $script_dir/../envs

echo $debugmode


if [ $debugmode = "False" ]
then
    sudo docker stop container-$projectname >/dev/null 2>&1
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida"
        #exit 2
    fi

    sudo docker rm container-$projectname >/dev/null 2>&1
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida"
        #exit 2
    fi
else
    echo "docker stop container-$projectname"
    sudo docker stop container-$projectname
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida"
        #exit 2
    fi

    echo "sudo docker rm container-$projectname"
    sudo docker rm container-$projectname
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida"
        #exit 2
    fi    
fi