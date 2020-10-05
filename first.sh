#!/bin/bash
sudo apt-get update && sudo apt upgrade -y
sudo apt install git
echo -n "请输入密码"
read NUCYPHER_KEYRING_PASSWORD
echo -n "请再次输入密码"
read accountpassword
cd $HOME
sudo apt update
sudo apt upgrade -y
sudo apt install python3-dev build-essential libffi-dev python3-pip python3-venv -y
python3 -m venv ./nucypher-venv
source nucypher-venv/bin/activate
pip3 install -U wheel
pip3 install -U nucypher
sudo apt-get update && sudo apt update
sudo apt-get install software-properties-common -y
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get install ethereum -y
cd /root/ && mkdir ethereum
nohup geth --rinkeby --syncmode "light" --datadir "/root/ethereum/" --cache=512 >/dev/null 2>&1 &
echo -e "$accountpassword\n$accountpassword" | geth --datadir /root/ethereum/ account new
source nucypher-venv/bin/activate
export NUCYPHER_KEYRING_PASSWORD=$NUCYPHER_KEYRING_PASSWORD && export NUCYPHER_WORKER_ETH_PASSWORD=$accountpassword
echo -e '0\ny\n' | nucypher ursula init --provider ipc:/root/ethereum/geth.ipc --poa --network ibex
nohup nucypher ursula run --provider ipc:/root/ethereum/geth.ipc --poa --network ibex > ursula_worker.log 2>&1 &
exit 0
