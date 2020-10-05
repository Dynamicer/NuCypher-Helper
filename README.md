# NuCypher-Helper

NuCypher 测试网 Staker + Worker 搭建一键包，综合了 [NuStart](https://github.com/Achi101/NuStart) 和 [Nucypher_node](https://gitee.com/beny1234/nucypher_node)。

其中 NuStart 没有 bond 脚本，Nucypher_node 使用的是 GETH，本地测试机都无法使用，替换成了 Infura，时间有限，仅测试了 Ubuntu 20.04 x64。

此外，对于大数据群群友，提供托管服务。

## 准备

- 服务器，内存大于 2G
- Infura 账号，并获取 WSS 地址，目前主网尚未上线，RINKEBY 测试网地址形如 wss://rinkeby.infura.io/ws/v3/5612d613d0877439731238d358

## 安装

1. 下载脚本，输入以下命令，设置密码（这里做了简化，`NUCYPHER_KEYRING_PASSWORD` 和 `NUCYPHER_WORKER_ETH_PASSWORD` 使用了同一个）

```bash
git clone https://github.com/Dynamicer/NuCypher-Helper.git && cd NuCypher-Helper && bash first.sh
```

2. 等待脚本运行结束，输入以下命令，记得替换 `密码` （前面会看到形如 `ValueError: {'code': -32000, 'message': 'unknown block'}` 的报错，不要紧，It's a feature, not a bug）

```
personal.newAccount('密码')
```

3. 复制新建的地址，然后向上翻，找到 `Your new key was generated` 这样一段，复制到本地，**然后 Control + C 回到普通命令行**

```
> personal.newAccount('BOqWIndHVm!*U18R')
"0x0000000003aa39dfc04794020884167874869b501523"

Your new key was generated

Public address of the key:   0x5612d613D0877439731238dCf434D0e46F289496
Path of the secret key file: /root/ethereum/keystore/UTC--2020-10-05T13-52-05.474741473Z--5612d613d0877439731238dcf434d0e46f289496
```

以上的有效信息有：

两个地址，分别用作 Staker 和 Worker，以及用作 Worker 的 keystore 文件名

- 0x0000000003aa39dfc04794020884167874869b501523 （Staker）
- 0x5612d613D0877439731238dCf434D0e46F289496 （Worker）
- UTC--2020-10-05T13-52-05.474741473Z--5612d613d0877439731238dcf434d0e46f289496 (Worker 的 keystore 文件名)

4. 复制以下命令，按提示输入 WSS 链接、Worker 的 keystore 文件名，选择网络（目前测试网选 1），选择 worker 帐户，各种确认，到提示 `    ✓ Worker is funded with 0.1 ETH!` 时， **Control + C 退出一层（因为这时候还没有 bond）**，继续输入密码，各种确认，绑定 Worker 地址和 Staker 地址

```bash
bash second.sh
```
