# NuCypher-Helper

NuCypher 测试网 Staker + Worker 搭建一键包，综合了 [NuStart](https://github.com/Achi101/NuStart) 和 [Nucypher_node](https://gitee.com/beny1234/nucypher_node)。

其中 NuStart 没有 bond 脚本，Nucypher_node 使用的是 GETH，本地测试机都无法使用，替换成了 Infura，时间有限，仅测试了 Ubuntu 20.04 x64。

此外，对于大数据群群友，提供托管服务。

## 准备

- 服务器，内存大于 2G，建议配置 3C/4G/80GSSD
- [Infura](https://infura.io/) 账号，并获取 WSS 地址，目前主网尚未上线，RINKEBY 测试网地址形如 `wss://rinkeby.infura.io/ws/v3/5612d613d0877439731238d358`

## 安装

[NuCypher-Helper 一键包使用教程](https://nufans.club/2020/nucypher-helper-yi-jian-bao-shi-yong-jiao-cheng-7830028c)
