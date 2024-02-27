#!

# 安装PHP源
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt update

# 安装PHP8.3
apt install php8.3 php8.3-{bcmath,bz2,cli,common,curl,fpm,gd,igbinary,mbstring,mysql,opcache,readline,redis,xml,yaml,zip} -y

## 部署SSPanel
git clone --depth 1 -b 2023.7 https://github.com/Anankke/SSPanel-Uim.git /srv/sspanel
# 改权限
chmod 755 /srv/sspanel -R
chown www-data /srv/sspanel -R

cd /srv/sspanel
wget https://getcomposer.org/installer -O composer.phar
sudo -u www-data php composer.phar
sudo -u www-data php composer.phar install --no-dev

# 改配置
cp config/.config.example.php config/.config.php
cp config/appprofile.example.php config/appprofile.php
