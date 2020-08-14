<?php
/**
 * Register Account New
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

if(isset($_POST['reg_password']))
	$reg_password = encrypt(($config_salt_enabled ? $account_logged->getCustomField('salt') : '') . $_POST['reg_password']);

$reckey = $account_logged->getCustomField('key');
if((!$config['generate_new_reckey'] || !$config['mail_enabled']) || empty($reckey))
	echo 'You cant get new rec key';
else
{
	$points = $account_logged->getCustomField('premium_points');
	if(isset($_POST['registeraccountsave']) && $_POST['registeraccountsave'] == '1')
	{
		if($reg_password == $account_logged->getPassword())
		{
			if($points >= $config['generate_new_reckey_price'])
			{
				$show_form = false;
				$new_rec_key = generateRandomString(10, false, true, true);

				$mailBody = $twig->render('mail.account.register.html.twig', array(
					'recovery_key' => $new_rec_key
				));

				if(_mail($account_logged->getEMail(), $config['lua']['serverName']." - new recovery key", $mailBody))
				{
					$account_logged->setCustomField("key", $new_rec_key);
					$account_logged->setCustomField("premium_points", $account_logged->getCustomField("premium_points") - $config['generate_new_reckey_price']);
					$account_logged->logAction('Generated new recovery key for ' . $config['generate_new_reckey_price'] . ' premium points.');
					$message = '<br />Your recovery key were send on email address <b>'.$account_logged->getEMail().'</b> for '.$config['generate_new_reckey_price'].' premium points.';
				}
				else
					$message = '<br /><p class="error">An error occorred while sending email ( <b>'.$account_logged->getEMail().'</b> ) with recovery key! Recovery key not changed. Try again later. For Admin: More info can be found in system/logs/mailer-error.log</p>';

				$twig->display('success.html.twig', array(
					'title' => 'Account Registered',
					'description' => '<ul>' . $message . '</ul>'
				));
			}
			else
				$errors[] = 'You need '.$config['generate_new_reckey_price'].' premium points to generate new recovery key. You have <b>'.$points.'<b> premium points.';
		}
		else
			$errors[] = 'Wrong password to account.';
	}

	//show errors if not empty
	if(!empty($errors)) {
		$twig->display('error_box.html.twig', array('errors' => $errors));
	}

	if($show_form)
	{
		//show form
		$twig->display('account.generate_new_recovery_key.html.twig', array(
			'points' => $points
		));
	}
}

?>