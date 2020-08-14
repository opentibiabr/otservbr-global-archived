<?php
/**
 * Register Account
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

$_POST['reg_password'] = isset($_POST['reg_password']) ? $_POST['reg_password'] : '';
$reg_password = encrypt(($config_salt_enabled ? $account_logged->getCustomField('salt') : '') . $_POST['reg_password']);
$old_key = $account_logged->getCustomField("key");

if(isset($_POST['registeraccountsave']) && $_POST['registeraccountsave'] == "1") {
	if($reg_password == $account_logged->getPassword()) {
		if(empty($old_key)) {
			$show_form = false;
			$new_rec_key = generateRandomString(10, false, true, true);

			$account_logged->setCustomField("key", $new_rec_key);
			$account_logged->logAction('Generated recovery key.');

			if($config['mail_enabled'] && $config['send_mail_when_generate_reckey'])
			{
				$mailBody = $twig->render('mail.account.register.html.twig', array(
					'recovery_key' => $new_rec_key
				));
				if(_mail($account_logged->getEMail(), $config['lua']['serverName']." - Recovery Key", $mailBody))
					$message = '<br /><small>Your recovery key were send on email address <b>'.$account_logged->getEMail().'</b>.</small>';
				else
					$message = '<br /><p class="error">An error occurred while sending email. For Admin: More info can be found in system/logs/mailer-error.log</p>';
			}
			$twig->display('success.html.twig', array(
				'title' => 'Account Registered',
				'description' => 'Thank you for registering your account! You can now recover your account if you have lost access to the assigned email address by using the following<br/><br/><span style="font-size: 24px">&nbsp;&nbsp;&nbsp;<b>Recovery Key: '.$new_rec_key.'</b></span><br/><br/><br/><b>Important:</b><ul><li>Write down this recovery key carefully.</li><li>Store it at a safe place!</li>' . $message . '</ul>'
			));
		}
		else
			$errors[] = 'Your account is already registered.';
	}
	else
		$errors[] = 'Wrong password to account.';
}

if($show_form) {
	if(!empty($errors)) {
		//show errors
		$twig->display('error_box.html.twig', array('errors' => $errors));
	}

	//show form
	$twig->display('account.generate_recovery_key.html.twig');
}

?>