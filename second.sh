#!/bin/bash
echo -n "请输入 Infura WSS 链接"
read infura
echo -n "请输入 keystore 文件名，形如UTC--1970-01-01T13-16-00.690221616Z--eb2762dba37b1d98f45d73892af8216c37c3badd"
read keystore
nucypher ursula init --signer keystore:///$HOME/.ethereum/keystore --provider $infura
nucypher ursula run
geth attach ipc:/root/ethereum/geth.ipc
cd /root/nucypher_node && bash worker_bound.sh
echo -e "[Unit]\nDescription="NuCypher Node"\n[Service]\nUser=$USER\nType=simple\nEnvironment="NUCYPHER_WORKER_ETH_PASSWORD=$keystorepassw"\nEnvironment="NUCYPHER_KEYRING_PASSWORD=$keyring"\nExecStart=$HOME/nucypher-venv/bin/nucypher ursula run\nRestart=always\nRestartSec=3\n[Install]\nWantedBy=multi-user.target" > nucypher.txt
sudo mv nucypher.txt /etc/systemd/system/nucypher.service
sudo systemctl daemon-reload
sudo systemctl enable nucypher
sudo systemctl start nucypher
