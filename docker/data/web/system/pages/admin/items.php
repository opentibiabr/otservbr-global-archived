<?php
/**
 * Load items.xml
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');
$title = 'Load items.xml';

require LIBS . 'items.php';
require LIBS . 'weapons.php';

$twig->display('admin.items.html.twig');

$reload = isset($_REQUEST['reload']) && (int)$_REQUEST['reload'] === 1;
if ($reload) {
	$items_start_time = microtime(true);
	if (Items::loadFromXML(true)) {
		success('Successfully loaded items (in ' . round(microtime(true) - $items_start_time, 4) . ' seconds).');
	}
	else {
		error(Items::getError());
	}

	$weapons_start_time = microtime(true);
	if (Weapons::loadFromXML(true)) {
		success('Successfully loaded weapons (in ' . round(microtime(true) - $weapons_start_time, 4) . ' seconds).');
	}
	else {
		error(Weapons::getError());
	}
}
