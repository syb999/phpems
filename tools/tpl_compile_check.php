<?php
class StubFiles
{
    public function readFile($f)
    {
        return file_get_contents($f);
    }

    public function mdir($d)
    {
        @mkdir($d, 0777, true);

        return true;
    }
}

class StubEv
{
    public function get($k)
    {
        return null;
    }

    public function stripSlashes($s)
    {
        return $s;
    }
}

class FG
{
    public $app = 'content';
    public $module = 'app';
    public $defaultApp = 'content';

    public function make($x)
    {
        return 0 === strpos($x, 'file') ? new StubFiles() : new StubEv();
    }
}

require '/home/oem/888/phpems/lib/tpl.cls.php';

$out = $argv[1];
@mkdir($out, 0777, true);
$t = new tpl(new FG());
$map = [];
$n = 0;
$it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator('/home/oem/888/phpems/app'));
foreach ($it as $f) {
    $f = (string) $f;
    if ('.tpl' !== substr($f, -4)) {
        continue;
    }
    $code = $t->compileTpl($f);
    $h = md5($f);
    file_put_contents($out.'/'.$h.'.php', $code);
    $map[$h] = $f;
    ++$n;
}
file_put_contents($out.'/map.json', json_encode($map, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));
echo $n, " templates compiled into ", $out, "\n";
