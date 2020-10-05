#!/bin/bash
cd $HOME
echo -n "NUCYPHER_KEYRING_PASSWORD: "
read NUCYPHER_KEYRING_PASSWORD
source nucypher-venv/bin/activate
export NUCYPHER_KEYRING_PASSWORD=$NUCYPHER_KEYRING_PASSWORD
nucypher stake init-stakeholder --provider ipc:/root/ethereum/geth.ipc --poa --network ibex
echo "发送质押NU交易"
nucypher stake create --provider ipc:/root/ethereum/geth.ipc --poa --network ibex
echo "绑定worker地址"
nucypher stake bond-worker --provider ipc:/root/ethereum/geth.ipc --poa --network ibex
exit 0
