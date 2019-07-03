### 此Dockerfile做了什么？
* 该文件包为ubuntu18.04 + python3.7.3 + nginx + redis的配置文件包
* 使用了阿里源，更新好了apt
* 安装了中文支持
* git(版本控制软件)
* ufw(防火墙工具)
* lsof
* tmux(分屏工具)
* ifconfig
* redis(ps:修改配置文件，留有原备份，设置了配置文件启动)
* nginx(ps:修改配置文件，留有原备份，设置了配置文件启动)
* vim(ps:修改了配置文件)
* pip(升级了pip，使用了清华源)
* 默认python是python37版本，默认pip指向python37
* 预装了virtualenv

### 如何构建？
* 命令行模式下，进入当前文件目录
* docker load -i ubuntu18_04.tar（当存在本地18.04镜像情况下）
* 查看Dockerfile，如果部分内容需要修改，提前修改好
* 确认修改好后：
* docker build -t repo:tag .
* 等待执行完毕 ...

启动容器：
* docker images 查看本地镜像
* docker run -it --name img_name --dns 8.8.8.8 --dns 8.8.4.4 --privileged repo:tag /bin/bash
> 若修改/etc/resolv.conf每次启动会重置，所以在命令行修改
privileged防止ufw防火墙命令失效，使用该命令就不要用端口映射方式了