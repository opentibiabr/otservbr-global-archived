<?php
/**
 * Dashboard
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');
$title = 'Dashboard';

if (isset($_GET['clear_cache'])) {
	if (clearCache()) {
		success('Cache cleared.');
	} else {
		error('Error while clearing cache.');
	}
}

if (isset($_GET['maintenance'])) {
	$_status = (int)$_POST['status'];
	$message = $_POST['message'];
	if (empty($message)) {
		error('Message cannot be empty.');
	} else if (strlen($message) > 255) {
		error('Message is too long. Maximum length allowed is 255 chars.');
	} else {
		$tmp = '';
		if (fetchDatabaseConfig('site_closed', $tmp))
			updateDatabaseConfig('site_closed', $_status);
		else
			registerDatabaseConfig('site_closed', $_status);

		if (fetchDatabaseConfig('site_closed_message', $tmp))
			updateDatabaseConfig('site_closed_message', $message);
		else
			registerDatabaseConfig('site_closed_message', $message);
	}
}
$is_closed = getDatabaseConfig('site_closed') == '1';

$closed_message = 'Server is under maintenance, please visit later.';
$tmp = '';
if (fetchDatabaseConfig('site_closed_message', $tmp))
	$closed_message = $tmp;

$query = $db->query('SELECT count(*) as `how_much` FROM `accounts`;');
$query = $query->fetch();
$total_accounts = $query['how_much'];

$query = $db->query('SELECT count(*) as `how_much` FROM `players`;');
$query = $query->fetch();
$total_players = $query['how_much'];

$query = $db->query('SELECT count(*) as `how_much` FROM `guilds`;');
$query = $query->fetch();
$total_guilds = $query['how_much'];

$query = $db->query('SELECT count(*) as `how_much` FROM `houses`;');
$query = $query->fetch();
$total_houses = $query['how_much'];

$twig->display('admin.statistics.html.twig', array(
	'total_accounts' => $total_accounts,
	'total_players' => $total_players,
	'total_guilds' => $total_guilds,
	'total_houses' => $total_houses
));

$twig->display('admin.dashboard.html.twig', array(
	'is_closed' => $is_closed,
	'closed_message' => $closed_message,
	'status' => $status,
	'account_type' => USE_ACCOUNT_NAME ? 'name' : 'number'
));

echo '<div class="row">';

$configAdminPanelModules = config('admin_panel_modules');
if(isset($configAdminPanelModules))
	$configAdminPanelModules = explode(',', $configAdminPanelModules);

$twig_loader->prependPath(__DIR__ . '/modules/templates');
foreach($configAdminPanelModules as $box) {
	$file = __DIR__ . '/modules/' . $box . '.php';
	if(file_exists($file)) {
		include($file);
	}
}
echo '</div>';
