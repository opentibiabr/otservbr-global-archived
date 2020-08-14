<?php

use Twig\Environment as Twig_Environment;
use Twig\Extension\DebugExtension as Twig_DebugExtension;
use Twig\Loader\FilesystemLoader as Twig_FilesystemLoader;
use Twig\TwigFilter;
use Twig\TwigFunction;

$dev_mode = (config('env') === 'dev');
$twig_loader = new Twig_FilesystemLoader(SYSTEM . 'templates');
$twig = new Twig_Environment($twig_loader, array(
	'cache' => CACHE . 'twig/',
	'auto_reload' => $dev_mode,
	'debug' => $dev_mode
));

if($dev_mode) {
	$twig->addExtension(new Twig_DebugExtension());
}
unset($dev_mode);

$function = new TwigFunction('getStyle', function ($i) {
	return getStyle($i);
});
$twig->addFunction($function);

$function = new TwigFunction('getLink', function ($s) {
	return getLink($s);
});
$twig->addFunction($function);

$function = new TwigFunction('getPlayerLink', function ($s, $p) {
	return getPlayerLink($s, $p);
});
$twig->addFunction($function);

$function = new TwigFunction('getGuildLink', function ($s, $p) {
    return getGuildLink($s, $p);
});
$twig->addFunction($function);

$function = new TwigFunction('hook', function ($hook) {
	global $hooks;

	if(is_string($hook)) {
		$hook = constant($hook);
	}

	$hooks->trigger($hook);
});
$twig->addFunction($function);

$function = new TwigFunction('config', function ($key) {
	return config($key);
});
$twig->addFunction($function);

$function = new TwigFunction('getCustomPage', function ($name) {
	$success = false;
	return getCustomPage($name, $success);
});
$twig->addFunction($function);

$filter = new TwigFilter('urlencode', function ($s) {
	return urlencode($s);
});

$twig->addFilter($filter);
unset($function, $filter);
