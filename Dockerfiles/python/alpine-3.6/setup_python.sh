#!/usr/bin/env sh
# 添加国内镜像源
sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories;
#echo http://mirrors.ustc.edu.cn/alpine/v3.6/main > /etc/apk/repositories
#echo http://mirrors.ustc.edu.cn/alpine/v3.6/community >> /etc/apk/repositories

# 安装必要的工具
apk update;
apk add build-base linux-headers libffi-dev openssh;

# 添加pip国内镜像源
mkdir ~/.pip;
touch ~/.pip/pip.conf;
echo [global] >> ~/.pip/pip.conf;
echo trusted-host =  pypi.tuna.tsinghua.edu.cn >> ~/.pip/pip.conf;
echo index-url = https://pypi.tuna.tsinghua.edu.cn/simple >> ~/.pip/pip.conf;

# 升级pip并安装需要的python包
pip install --no-cache-dir --upgrade pip;
pip install --no-cache-dir uWSGI>=2.0.15;
pip install --no-cache-dir pipenv;

# 清理缓存
rm -rf /var/cache/apk/*;
rm -rf /root/.cache;
rm -rf /tmp/*;