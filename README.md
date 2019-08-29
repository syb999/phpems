# phpems
源码取自 https://github.com/oiuv/phpems  感谢分享。

下面是s905机顶盒使用armbian/openwrt系统，安装onmp环境后，搭建phpems在线考试系统的方法：

由于搭建phpems需要用到composer,但是openwrt安装php后，初始情况下并没有php命令，导致composer运行失败。
解决方法：找到文件php7-cli，复制该文件至同目录中，并改名为php。

下载composer：
wget http://getcomposer.org/composer.phar

php composer-setup.php

php -r "unlink('composer-setup.php');"

然后把当前目录的composer.phar文件复制到/bin目录内，并改名为composer且赋予可执行权限。


配置composer下载点：

composer config -g repo.packagist composer https://packagist.phpcomposer.com

然后可以用composer config -gl 查看配置

composer install -vvv

复制packages.json文件至目录/root/.cache/composer/repo/https---packagist.laravel-china.org/
内，不然会安装会失败，因为packagist.laravel-china.org站点已经关闭了。


现在可以下载phpems5的源码:

git clone https://github.com/syb999/phpems.git


进入phpems目录，使用下面命令安装即可：

composer create-project --prefer-dist phpems/phpems phpems

安装完成后会提示：项目安装完成，请导入数据库 phpems.sql 并配置 lib/config.inc.php 文件

开始导入数据库：

mysql -u root -p

create database phpems;

use phpems;

source /phpems/phpems/examples/phpems.sql;

exit;


最后修改/phpems/phpems/lib/config.inc.php文件:
按照数据库相关的配置修改即可。

在lib/config.inc.php文件中设置数据库参数，注意都要保存为utf8无bom形式。

设置data目录、files/attach目录为可读写（777权限）

然后就成功搭建了phpems在线考试系统

前台地址：域名/index.php

后台地址：域名/index.php?core-master

默认管理员：用户名：peadmin  密码：peadmin
可以登录到后台页面->用户模块->用户管理，来修改peadmin的密码。
