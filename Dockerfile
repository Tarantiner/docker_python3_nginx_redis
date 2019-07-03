FROM ubuntu:18.04
ADD resolv.conf /etc/
ADD sources.list /etc/apt/
ADD python_37 /home/python_37/
RUN apt update; \
apt -y install git; \
apt -y install ufw; \
apt -y install lsof; \
apt -y install tmux; \
apt -y install redis-server; \
mv /etc/redis/redis.conf /etc/redis/redis.bak; \
apt -y install nginx; \
mv /etc/nginx/nginx.conf /etc/nginx/nginx.bak; \
apt -y install language-pack-zh-hans; \
locale-gen en_US.UTF-8; \
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc; \
apt -y install vim; \
apt -y install lsof; \
apt -y install net-tools; \
apt -y install iputils-ping; \
apt -y install curl elinks; \
rm -f /lib/systemd/system/redis-server.service; \
rm -f /lib/systemd/system/nginx.service; \
apt -y install build-essential; \
apt -y install libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev; \
apt -y install zlib1g-dev; \
cd /home/python_37; \
./configure --enable-optimizations; \
make && make install; \
pip3 install --upgrade pip; \
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple; \
pip install virtualenv; \
rm -rf /home/python_37
ADD .gitconfig /root/
ADD nginx.conf /etc/nginx/
ADD redis.conf /etc/redis/
ADD redis-server.service /lib/systemd/system/
ADD nginx.service /lib/systemd/system/
ADD vimrc /etc/vim/