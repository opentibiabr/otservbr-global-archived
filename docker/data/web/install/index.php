<?php

use Twig\Environment as Twig_Environment;
use Twig\Loader\FilesystemLoader as Twig_FilesystemLoader;

require '../common.php';

define('MYAAC_INSTALL', true);

// includes
require SYSTEM . 'functions.php';
require BASE . 'install/includes/functions.php';
require BASE . 'install/includes/locale.php';
require SYSTEM . 'clients.conf.php';

if(file_exists(BASE . 'config.local.php'))
	require BASE . 'config.local.php';

// ignore undefined index from Twig autoloader
$config['env'] = 'prod';

$twig_loader = new Twig_FilesystemLoader(SYSTEM . 'templates');
$twig = new Twig_Environment($twig_loader, array(
	'cache' => CACHE . 'twig/',
	'auto_reload' => true
));

// load installation status
$step = isset($_POST['step']) ? $_POST['step'] : 'welcome';

$install_status = array();
if(file_exists(CACHE . 'install.txt')) {
	$install_status = unserialize(file_get_contents(CACHE . 'install.txt'));

	if(!isset($_POST['step'])) {
		$step = isset($install_status['step']) ? $install_status['step'] : '';
	}
}

if(isset($_POST['vars']))
{
	foreach($_POST['vars'] as $key => $value) {
		$_SESSION['var_' . $key] = $value;
		$install_status[$key] = $value;
	}
}
else {
	foreach($install_status as $key => $value) {
		$_SESSION['var_' . $key] = $value;
	}
}

if($step == 'finish' && (!isset($config['installed']) || !$config['installed'])) {
	$step = 'welcome';
}

// step verify
$steps = array(1 => 'welcome', 2 => 'license', 3 => 'requirements', 4 => 'config', 5 => 'database', 6 => 'admin', 7 => 'finish');
if(!in_array($step, $steps)) // check if step is valid
	throw new RuntimeException('ERROR: Unknown step.');

$install_status['step'] = $step;
$errors = array();

if($step == 'database') {
	foreach($_SESSION as $key => $value) {
		if(strpos($key, 'var_') === false) {
			continue;
		}

		$key = str_replace('var_', '', $key);

		if(in_array($key, array('account', 'password', 'email', 'player_name'))) {
			continue;
		}

		if($key != 'usage' && empty($value)) {
			$errors[] = $locale['please_fill_all'];
			break;
		}
		else if($key == 'server_path') {
			$config['server_path'] = $value;

			// take care of trailing slash at the end
			if($config['server_path'][strlen($config['server_path']) - 1] != '/') {
				$config['server_path'] .= '/';
			}

			if(!file_exists($config['server_path'] . 'config.lua')) {
				$errors[] = $locale['step_database_error_config'];
				break;
			}
		}
		else if($key == 'mail_admin' && !Validator::email($value)) {
			$errors[] = $locale['step_config_mail_admin_error'];
			break;
		}
		else if($key == 'mail_address' && !Validator::email($value)) {
			$errors[] = $locale['step_config_mail_address_error'];
			break;
		}
		else if($key == 'timezone' && !in_array($value, DateTimeZone::listIdentifiers())) {
			$errors[] = $locale['step_config_timezone_error'];
			break;
		}
		else if($key == 'client' && !in_array($value, $config['clients'])) {
			$errors[] = $locale['step_config_client_error'];
			break;
		}
	}

	if(!empty($errors)) {
		$step = 'config';
	}
}
else if($step == 'admin') {
	$config_failed = true;
	if(file_exists(BASE . 'config.local.php') && isset($config['installed']) && $config['installed'] && isset($_SESSION['saved'])) {
		$config_failed = false;
	}

	if($config_failed) {
		$step = 'database';
	}
}
else if($step == 'finish') {
	$email = $_SESSION['var_email'];
	$password = $_SESSION['var_password'];
	$player_name = $_SESSION['var_player_name'];

	// email check
	if(empty($email)) {
		$errors[] = $locale['step_admin_email_error_empty'];
	}
	else if(!Validator::email($email)) {
		$errors[] = $locale['step_admin_email_error_format'];
	}

	// account check
	if(isset($_SESSION['var_account'])) {
		if(empty($_SESSION['var_account'])) {
			$errors[] = $locale['step_admin_account_error_empty'];
		}
		else if(!Validator::accountName($_SESSION['var_account'])) {
			$errors[] = $locale['step_admin_account_error_format'];
		}
		else if(strtoupper($_SESSION['var_account']) == strtoupper($password)) {
			$errors[] = $locale['step_admin_account_error_same'];
		}
	}
	else if(isset($_SESSION['var_account_id'])) {
		if(empty($_SESSION['var_account_id'])) {
			$errors[] = $locale['step_admin_account_id_error_empty'];
		}
		else if(!Validator::accountId($_SESSION['var_account_id'])) {
			$errors[] = $locale['step_admin_account_id_error_format'];
		}
		else if($_SESSION['var_account_id'] == $password) {
			$errors[] = $locale['step_admin_account_id_error_same'];
		}
	}

	// password check
	if(empty($password)) {
		$errors[] = $locale['step_admin_password_error_empty'];
	}
	else if(!Validator::password($password)) {
		$errors[] = $locale['step_admin_password_error_format'];
	}

	// player name check
	if(empty($player_name)) {
		$errors[] = $locale['step_admin_player_name_error_empty'];
	}
	else if(!Validator::characterName($player_name)) {
		$errors[] = $locale['step_admin_player_name_error_format'];
	}

	if(!empty($errors)) {
		$step = 'admin';
	}
}

if(empty($errors)) {
	file_put_contents(CACHE . 'install.txt', serialize($install_status));
}

$error = false;

clearstatcache();
if(is_writable(CACHE) && (MYAAC_OS != 'WINDOWS' || win_is_writable(CACHE))) {
	if(!file_exists(BASE . 'install/ip.txt')) {
		$content = warning('AAC installation is disabled. To enable it make file <b>ip.txt</b> in install/ directory and put there your IP.<br/>
		Your IP is:<br /><b>' . $_SERVER['REMOTE_ADDR'] . '</b>', true);
	}
	else {
		$file_content = trim(file_get_contents(BASE . 'install/ip.txt'));
		$allow = false;
		$listIP = preg_split('/\s+/', $file_content);
		foreach($listIP as $ip) {
			if($_SERVER['REMOTE_ADDR'] == $ip) {
				$allow = true;
			}
		}

		if(!$allow)
		{
			$content = warning('In file <b>install/ip.txt</b> must be your IP!<br/>
			In file is:<br /><b>' . nl2br($file_content) . '</b><br/>
			Your IP is:<br /><b>' . $_SERVER['REMOTE_ADDR'] . '</b>', true);
		}
		else {
			ob_start();

			$step_id = array_search($step, $steps);
			require 'steps/' . $step_id . '-' . $step . '.php';
			$content = ob_get_contents();
			ob_end_clean();
		}
	}
}
else {
	$content = error(file_get_contents(BASE . 'install/includes/twig_error.html'), true);
}

// render
require 'template/template.php';
//$_SESSION['laststep'] = $step;
