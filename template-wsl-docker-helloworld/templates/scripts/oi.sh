#/bin/bash
PS4='LINENO:'


export script_dir=$(dirname "$0")
source $script_dir/../envs

#echo $debugmode


if [ $debugmode = "False" ]
then
    sudo service docker start >/dev/null
    sudo service docker status >/dev/null
    sudo docker run hello-world >/dev/null
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida" >/dev/null
    else
        echo -e "\nsudo docker run hello-world" >/dev/null
        echo "sucesso" >/dev/null
        exit 0    
    fi

    echo -e "\nsudoers" >/dev/null
    export login=`whoami` ; echo "$login  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$login
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo apt-get update -y" >/dev/null
    sudo apt-get update -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo apt-get install ca-certificates curl gnupg lsb-relea" >/dev/null
    sudo apt-get install ca-certificates curl gnupg lsb-release -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo mkdir -p /etc/apt/keyrings" >/dev/null
    sudo mkdir -p /etc/apt/keyrings >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo rm -Rf /etc/apt/keyrings/docker.gpg" >/dev/null
    sudo rm -Rf /etc/apt/keyrings/docker.gpg >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nAdicionando a chave do repo docker" >/dev/null
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nAdicionando o repo do docker ao apt" >/dev/null
    sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo apt-get update" >/dev/null
    sudo apt-get update -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin" >/dev/null
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo service docker start" >/dev/null
    sudo service docker stop >/dev/null 2>&1
    sudo service docker start >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar" >/dev/null
        exit 2
    fi

    echo -e "\nsudo docker run hello-world" >/dev/null
    sudo service docker status >/dev/null
    sudo docker run hello-world >/dev/null
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida" >/dev/null
        exit 2
    fi
else
    sudo service docker start
    sudo service docker status
    sudo docker run hello-world
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida"
    else
        echo -e "\nsudo docker run hello-world"
        echo "sucesso"
        exit 0    
    fi

    echo -e "\nsudoers"
    export login=`whoami` ; echo "$login  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$login
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo apt-get update -y"
    sudo apt-get update -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo apt-get install ca-certificates curl gnupg lsb-relea"
    sudo apt-get install ca-certificates curl gnupg lsb-release -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo mkdir -p /etc/apt/keyrings"
    sudo mkdir -p /etc/apt/keyrings
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo rm -Rf /etc/apt/keyrings/docker.gpg"
    sudo rm -Rf /etc/apt/keyrings/docker.gpg
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nAdicionando a chave do repo docker"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nAdicionando o repo do docker ao apt"
    sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo apt-get update"
    sudo apt-get update -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin"
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo service docker start"
    sudo service docker stop >/dev/null 2>&1
    sudo service docker start >/dev/null
    if [ $? -ne 0 ]
    then
        echo "problema no script. Verificar"
        exit 2
    fi

    echo -e "\nsudo docker run hello-world"
    sudo service docker status
    sudo docker run hello-world
    saida=$?
    if [ $saida -ne 0 ]
    then
        echo "problema no script. Verificar. $saida"
        exit 2
    fi
fi