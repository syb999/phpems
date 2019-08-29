<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

class ginkgo
{
    public $G = [];
    public $L = [];
    public $I = ['app' => [], 'core' => []];
    public $app;
    public $defaultApp = 'exam';

    public function __construct()
    {
    }

    //对象工厂
    public function make($G, $app = null)
    {
        if ($app) {
            return $this->load($G, $app);
        }

        if (!isset($this->G[$G])) {
            if (file_exists('../lib/'.$G.'.cls.php')) {
                include '../lib/'.$G.'.cls.php';
            } else {
                return false;
            }
            $this->G[$G] = new $G($this);
            if (method_exists($this->G[$G], '_init')) {
                $this->G[$G]->_init();
            }
        }

        return $this->G[$G];
    }

    //加载对象类文件并生成对象
    public function load($G, $app)
    {
        if (!$app) {
            return false;
        }
        $o = $G.'_'.$app;
        if (!isset($this->L[$app][$o])) {
            $fl = '../app/'.$app.'/cls/'.$G.'.cls.php';
            if (file_exists($fl)) {
                include $fl;
            } else {
                return false;
            }
            //die('Unknown class to init!The class is '.$app.'::'.$G);
            $this->L[$app][$o] = new $o($this);
            if (method_exists($this->L[$app][$o], '_init')) {
                $this->L[$app][$o]->_init();
            }
        }

        return $this->L[$app][$o];
    }

    //执行页面
    public function run()
    {
        $ev = $this->make('ev');
        include '../lib/config.inc.php';
        header('P3P: CP=CAO PSA OUR');
        header('Content-Type: text/html; charset='.HE);
        ini_set('date.timezone', 'Asia/Shanghai');
        date_default_timezone_set('Etc/GMT-8');
        error_reporting(0);
        $app = new app($this);
        $app->run();
    }
}
