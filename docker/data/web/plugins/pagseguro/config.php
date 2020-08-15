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

$config['pagSeguro'] = array(
	'email' => 'bruno@midukan.com.br',
	'environment' => 'production', // production, sandbox
	'token' => array(
		'production' => 'yourtokenhere',
		'sandbox' => 'yourtokenhere',
	),
	'urlRedirect' => '?subtopic=points&action=final', // default should be good
	'productName' => 'Endless Coins', // or Coins
	'productValue' => 1.00,
	'doublePoints' => date('yyyymmdd') <= 20200820 ? true : false , // should points be doubled? for example: for 5 points donated you become 10.
	'donationType' => 'coins', // what should be added to player account? points/coins
	'options' => array( // cost => points/coins
		'5,00' => 5,
		'10,00' => 12,
		'20,00' => 28,
		'40,00' => 64,
		'60,00' => 102,
		'100,00' => 200,
		'200,00' => 450,
		'500,00' => 1300,
	)
);
?>
