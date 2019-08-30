# phpems
源码取自 https://github.com/oiuv/phpems  感谢分享。

# 由于安装phpems需要用到的composer依赖时，会自动安装到/root/.composer目录内，需要用掉151M的存储空间,如果使用硬路由openwrt安装phpems，请用软链接挂载的U盘/移动硬盘目录来解决空间不足的问题。如: ln -s /opt/.composer /root

下面是s905机顶盒使用armbian/openwrt系统，安装onmp环境后，搭建phpems在线考试系统的方法：


由于搭建phpems需要用到composer,但是openwrt安装php后，初始情况下并没有php命令，导致composer运行失败。 解决方法：找到文件php7-cli，复制该文件至同目录中，并改名为php。

# 安装composer:

curl -sS https://getcomposer.org/installer | php
php composer.phar
cp /opt/bin/composer.phar /opt/bin/composer


# 现在可以下载phpems5的源码:

git clone https://github.com/syb999/phpems.git


# 进入phpems目录:

cd phpems

# 配置composer源并安装phpems相关依赖，安装耗时很久(可以用composer config -gl 查看配置):
composer config -g repo.packagist composer https://packagist.phpcomposer.com
composer install -vvv

# 复制packages.json文件至目录/opt/.composer/cache/repo/https---packagist.laravel-china.org/
  内，不然会安装会失败，因为packagist.laravel-china.org站点已经关闭了。
  (或者/root/.cache/composer/repo/https---packagist.laravel-china.org/目录)


# 使用下面命令安装即可：

composer create-project --prefer-dist phpems/phpems phpems

# 安装完成后会提示：项目安装完成，请导入数据库 phpems.sql 并配置 lib/config.inc.php 文件

# 开始导入数据库：

mysql -u root -p

create database phpems;

use phpems;

source /phpems/phpems/examples/phpems.sql;

exit;

# 最后修改/phpems/phpems/lib/config.inc.php文件: 按照数据库相关的配置修改即可。
按照数据库相关的配置修改即可。

在lib/config.inc.php文件中设置数据库参数，注意都要保存为utf8无bom形式。

设置data目录、files/attach目录为可读写（777权限）

然后就成功搭建了phpems在线考试系统

前台地址：域名/index.php

后台地址：域名/index.php?core-master

默认管理员：用户名：peadmin  密码：peadmin
可以登录到后台页面->用户模块->用户管理，来修改peadmin的密码。
