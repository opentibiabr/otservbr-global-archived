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
	'email' => 'john@doe.com',
	'environment' => 'production', // production, sandbox
	'token' => array(
		'production' => 'yourtokenhere',
		'sandbox' => 'yourtokenhere',
	),
	'urlRedirect' => '?subtopic=points&action=final', // default should be good
	'productName' => 'Premium Points', // or Coins
	'productValue' => 1.00,
	'doublePoints' => false, // should points be doubled? for example: for 5 points donated you become 10.
	'donationType' => 'points', // what should be added to player account? points/coins
	'options' => array( // cost => points/coins
		'5,00' => 5,
		'10,00' => 10,
		'20,00' => 20,
		'40,00' => 40,
		'60,00' => 60,
	)
);
?>