<?php
/**
 * Ajax validator
 * Returns json with result
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */

// we need some functions
require '../common.php';
require SYSTEM . 'functions.php';
require SYSTEM . 'init.php';

$error = '';
if(isset($_GET['account']))
{
	$account = $_GET['account'];
	if(USE_ACCOUNT_NAME) {
		if(!Validator::accountName($account))
			error_(Validator::getLastError());
	}
	else if(!Validator::accountId($account))
		error_(Validator::getLastError());

	$_account = new OTS_Account();
	if(USE_ACCOUNT_NAME)
		$_account->find($account);
	else
		$_account->load($account);

	if($_account->isLoaded())
		error_('Account with this name already exist.');

	success_('Good account' . (USE_ACCOUNT_NAME ? ' name' : '') . ' ( ' . $account . ' ).');
}
else if(isset($_GET['email']))
{
	$email = $_GET['email'];
	if(!Validator::email($email))
		error_(Validator::getLastError());

	if($config['account_mail_unique'])
	{
		$account = new OTS_Account();
		$account->findByEMail($email);
		if($account->isLoaded())
			error_('Account with this e-mail already exist.');
	}

	success_(1);
}
else if(isset($_GET['name']))
{
	$name = strtolower(stripslashes($_GET['name']));
	if(!Validator::characterName($name))
		error_(Validator::getLastError());

	if(!Validator::newCharacterName($name))
		error_(Validator::getLastError());

	success_('Good. Your name will be:<br /><b>' . ucwords($name) . '</b>');
}
else if(isset($_GET['password']) && isset($_GET['password2'])) {
	$password = $_GET['password'];
	$password2 = $_GET['password2'];

	if(!isset($password[0])) {
		error_('Please enter the password for your new account.');
	}

	if(!Validator::password($password))
		error_(Validator::getLastError());

	if($password != $password2)
		error_('Passwords are not the same.');

	success_(1);
}
else
	error_('Error: no input specified.');

/**
 * Output message & exit.
 *
 * @param string $desc Description
 */
function success_($desc) {
	echo json_encode(array(
		'success' => $desc
	));
	exit();
}
function error_($desc) {
	echo json_encode(array(
		'error' => $desc
	));
	exit();
}
