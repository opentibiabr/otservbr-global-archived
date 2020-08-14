<?php

if ($db->hasColumn('accounts', 'coins')) {
	$coins = $db->query('SELECT `coins`, `' . (USE_ACCOUNT_NAME ? 'name' : 'id') . '` as `name` FROM `accounts` ORDER BY `coins` DESC LIMIT 10;');
} else {
	$coins = 0;
}

$twig->display('coins.html.twig', array(
	'coins' => $coins
));