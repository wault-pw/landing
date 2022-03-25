---
title: "源代码"
hero: "img/docker.png"
aux: "在密码学的世界里，开源被认为是安全的关键：公共安全总是比私人安全更可靠。"
---

基础[推论](https://zh.wikipedia.org/wiki/柯克霍夫原則)加密分析最早由奥古斯特·克霍夫（August Kerkhoff）在19世纪提出，即保密必须完全由加密密钥组成。Kerkhoffs假设密码分析员对加密算法及其实现有完整的信息。
克劳德·香农(claude shannon)将其重新表述为“敌人知道的系统”。

## 技术程序存储器

密码管理器“Alice”服务应用程序是用go编写的，Web客户端应用程序“eva”是用Nuxt和VueJS编写的。
客户端和服务器之间的通信是通过谷歌Protocol Buffers的REST API协议进行的。应用程序使用PostgreSQL数据库。

应用程序和所有库的源代码都可以访问[GitHub](https://github.com/wault-pw)。此外,所有服务器是可以在本地或在自己的服务器上的独立存储器运行[Docker](https://github.com/orgs/wault-pw/packages)。
