<?php
/**
 * Automatic PagSeguro payment system gateway.
 *
 * @name      myaac-pagseguro
 * @author    Ivens Pontes <ivenscardoso@hotmail.com>
 * @author    Slawkens <slawkens@gmail.com>
 * @website   github.com/slawkens/myaac-pagseguro
 * @website   github.com/ivenspontes/
 * @version   1.1.1
 */
defined('MYAAC') or die('Direct access not allowed!');

if(!tableExist('pagseguro_transactions'))
{
	$db->query("
CREATE TABLE IF NOT EXISTS `pagseguro_transactions` (
	`transaction_code` VARCHAR(36) NOT NULL,
	`name` VARCHAR(200) DEFAULT NULL,
	`payment_method` VARCHAR(50) NOT NULL,
	`status` VARCHAR(50) NOT NULL,
	`item_count` INT(11) NOT NULL,
	`data` DATETIME NOT NULL,
	UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
	KEY `name` (`name`),
	KEY `status` (`status`)
) ENGINE=MyISAM;
		");
	success('Imported pagseguro_transactions table to database.');
}

if(!extension_loaded('curl')) {
	error("cURL php extension is not loaded, please install it with following command (on linux):" . "<br/>" .
	"sudo apt-get install php5-curl" . "<br/>" .
	"sudo service apache2 restart" . "<br/><br/>" .
	"for XAMPP (Windows) you need to uncomment (Remove selicolon - ;) this line in your php.ini:" . "<br/>" .
	";extension=php_curl.dll");
	return;
}

?>