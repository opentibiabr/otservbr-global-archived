<?php
if ($db->hasColumn('accounts', 'premium_points')) {
	$points = $db->query('SELECT `premium_points`, `' . (USE_ACCOUNT_NAME ? 'name' : 'id') . '` as `name` FROM `accounts` ORDER BY `premium_points` DESC LIMIT 10;');
} else {
	$points = 0;
}

$twig->display('points.html.twig', array(
	'points' => $points,
));