<?php
/**
 * Delete character
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

$player_name = isset($_POST['delete_name']) ? stripslashes($_POST['delete_name']) : NULL;
$password_verify = isset($_POST['delete_password']) ? $_POST['delete_password'] : NULL;
$password_verify = encrypt(($config_salt_enabled ? $account_logged->getCustomField('salt') : '') . $password_verify);
if(isset($_POST['deletecharactersave']) && $_POST['deletecharactersave'] == 1) {
	if(!empty($player_name) && !empty($password_verify)) {
		if(Validator::characterName($player_name)) {
			$player = new OTS_Player();
			$player->find($player_name);
			if($player->isLoaded()) {
				$player_account = $player->getAccount();
				if($account_logged->getId() == $player_account->getId()) {
					if($password_verify == $account_logged->getPassword()) {
						if(!$player->isOnline())
						{
							//dont show table "delete character" again
							$show_form = false;
							//delete player
							if($db->hasColumn('players', 'deletion'))
								$player->setCustomField('deletion', 1);
							else
								$player->setCustomField('deleted', 1);
							$account_logged->logAction('Deleted character <b>' . $player->getName() . '</b>.');
							$twig->display('success.html.twig', array(
								'title' => 'Character Deleted',
								'description' => 'The character <b>' . $player_name . '</b> has been deleted.'
							));
						}
						else
							$errors[] = 'This character is online.';
					}
					else {
						$errors[] = 'Wrong password to account.';
					}
				}
				else {
					$errors[] = 'Character <b>'.$player_name.'</b> is not on your account.';
				}
			}
			else {
				$errors[] = 'Character with this name doesn\'t exist.';
			}
		}
		else {
			$errors[] = 'Name contain illegal characters.';
		}
	}
	else {
		$errors[] = 'Character name or/and password is empty. Please fill in form.';
	}
}
if($show_form) {
	if(!empty($errors)) {
		$twig->display('error_box.html.twig', array('errors' => $errors));
	}
	$twig->display('account.delete_character.html.twig');
}
?>