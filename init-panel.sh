#!

# 配置 Nginx
ufw allow http
ufw allow https
rm /etc/nginx/sites-enabled/default

# 安装PHP源
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt update

# 安装PHP8.3
apt install php8.3 php8.3-{bcmath,bz2,cli,common,curl,fpm,gd,igbinary,mbstring,mysql,opcache,readline,redis,xml,yaml,zip} -y

## 部署SSPanel
git clone --depth 1 https://github.com/Anankke/SSPanel-Uim.git /srv/sspanel
# 改权限
chown www-data /srv/sspanel -R
chmod o-rwx /srv/sspanel -R
chmod 750 /srv/sspanel/update.sh /srv/sspanel/xcat

# 安装依赖
cd /srv/sspanel
wget https://getcomposer.org/installer -O /srv/sspanel/composer.phar
php composer.phar
sudo -u www-data /usr/bin/php composer.phar install --no-dev
