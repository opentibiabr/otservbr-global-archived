<?php

if ($db->hasColumn('players', 'lastlogin')) {
	$players = $db->query('SELECT name, level, lastlogin FROM players ORDER BY lastlogin DESC LIMIT 10;');
} else {
	$players = 0;
}

$twig->display('lastlogin.html.twig', array(
	'players' => $players,
));