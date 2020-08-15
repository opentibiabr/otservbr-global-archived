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
		'production' => 'c2602468-980b-418b-b71d-3277658c9a278a25fb4a4f9796519e03b0901b493b087d5f-5321-4f5a-9b70-ed701f6dc0a7',
		'sandbox' => 'c2602468-980b-418b-b71d-3277658c9a278a25fb4a4f9796519e03b0901b493b087d5f-5321-4f5a-9b70-ed701f6dc0a7',
	),
	'urlRedirect' => '?subtopic=points&action=final', // default should be good
	'productName' => 'Endless Coins', // or Coins
	'productValue' => 1.00,
	'doublePoints' => date('yyyymmdd') <= 20200820 ? true : false, // should points be doubled? for example: for 5 points donated you become 10.
	'donationType' => 'coins', // what should be added to player account? points/coins
	'options' => array( // cost => points/coins
		'5,00' => 50,
		'10,00' => 120,
		'20,00' => 280,
		'40,00' => 640,
		'60,00' => 1080,
		'100,00' => 2000,
		'200,00' => 4400
		'500,00' => 12000
	)
);
?>
