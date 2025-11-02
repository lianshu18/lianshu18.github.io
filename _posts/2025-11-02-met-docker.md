---
layout: post
title: "meet Docker"
date: 2023-11-02 00:00:00 +0800
categories: [docker, update] # 这里是分类，可以有多个，用逗号分隔
# 可以添加其他元数据，如 tags, author, permalink 等
---

<!-- 这里是你文章的实际内容 -->
# Docker 相关

## Docker 介绍

...

目前其实是基于b站up技术爬爬虾（讲了很多docker的内容）的视频的简要笔记，实际使用命令问ai更加全面（百科全书式的东西）。
以后可能进行补充

原理 利用了linux内核的两大原生功能，一个特殊的进程（linux内核）
cgroups限制和隔离进程的资源使用（cpu，内存..)
namespaces隔离进程的资源视图
#定义
==与虚拟机的区别==
1，所有程序在同一个系统上，而虚拟机有完整操作系统内核
2，更轻更小
#镜像
容器的模板，类似软件安装包，而容器是安装出来的软件。

> [!NOTE]
> eg，镜像和容器的关系像膜具和糕点（可分享，可重复）

#ubuntu和win系统安装
ub 安装命令示例

win安装命令示例
启用或关闭win功能——>勾选
1。virtual machine platform
2。wsl(适用于linux的win子系统)
3。重启电脑   安装wsl
{我装了，省略后面的一些操作}

**docker命令**
docker pull docker.io（仓库地址）/library(名字)/nginx:latest （版本号）用来下载镜像
```
#简化后 docker pull nginx
```
表示  官方仓库的官方命名空间下载最新版的nginx docker镜像
dockerhub官方镜像网站
==运行容器==

> [!NOTE]
> sudo docker images查看下载的镜像
> sudo docker rm -f（名字或id）删除镜像
> docker pull (--platform=xxxxxx拉取特定cpu架构的镜像 eg linux/amd64)nginx
> sudo docker run -d（防止阻塞当前窗口）/nginx（名字）启动容器，可以自动拉取/-p 80：80端口映射（绑定端口访问容器内部）
> 图解![[3f1ac500ee01422ca97d38d777cb9326.jpeg~tplv-a9rns2rl98-image.jpg]]![[5ee799d04f994e0bbf37ebe402232817.jpeg~tplv-a9rns2rl98-image.jpg]]![[7552168912b04e1ba810f48a76229b77.jpeg~tplv-a9rns2rl98-image.jpg]]
> sudo docker ps（查看正在运行的容器）

==挂载卷==
>[!NOTE]
>1.绑定挂载
>docker run -v(宿主机目录：容器内目录)
>图解![[44f8561a946a4e4390bcc16b4083f2f2.jpeg~tplv-a9rns2rl98-image.jpg]]
>作用 数据的持久化保存（删除容器时，宿主机仍旧保存数据）
>使用绑定挂载时，宿主机的目录会暂时覆盖容器的目录
>2.命名卷挂载
>创建一个存储空间-v 卷名字：容器内名字
>sudo docker volume create nginx
>直接使用名字回车sudo docker run -v 
>进入目录，切换为root用户sudo -i
图解![[c452f0f516864660a8869aa086f7fc8b.jpeg~tplv-a9rns2rl98-image.jpg]]

==其他参数==
-e 用来传递环境变量
--name自定义唯一的名字
-it 容器进入控制台进行交互
--rm删除停止容器
图解![[51e8234c20eb405099ec7f408ce1baf9.jpeg~tplv-a9rns2rl98-image 1.jpg]]

--restart always容器停止后重启        /unless-stopped手动停止的容器不在重启

==调试容器==
run是重新创建容器
docker stop 停止容器的运行
docker ps -a查看所有容器
docker start 重新启动
docker inspect查看容器参数
docker create如名
docker logs id查看日志
docker exec 在容器的内部执行linux命令
docker exec -it id /bin/sh进入一个正在运行的docker容器内部，获得一个交互式的命令行环境
需要自己搭建容器的环境，安装软件（很多系统工具缺失）
cat/etc/os-release 查看发行版，再找到对应软件

==dockerfile==
图纸，详细列出镜像文件是如何制作的
docker打包实际就是构建一个镜像
容器是镜像的 ![[e40efd50b0574b99af9a06f663065240.jpeg~tplv-a9rns2rl98-image.jpg]]“动态实例”，是实际运行应用的进程环境

==docker网络==
bridge桥接网络
子网：docker network create 创建，可以指定容器加入不同子网，同一个子网容器可以相互通信，使用容器的名字互相访问，不必使用内部ip地址
host网络模式
docker容器直接共享宿主机的网络和IP，不用映射，直接运行在端口上（我打包的方式）
删除子网 rm
==docker compose==（n个docker run命令，n>=1）
目前做了解作用
功能
使用yml文件管理多个容器
自定义容器的启动顺序

简化：把想要执行的命令告诉ai，生成等价的docker compose文件
命令：compose up 启动运行容器/down 删除容器/stop 停止容器
识别：sudo docker compose -f   目录/文件名  up

其他总结
