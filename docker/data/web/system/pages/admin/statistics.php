<?php
/**
 * Statistics
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');
$title = 'Statistics';

$query = $db->query('SELECT count(*) as `how_much` FROM `accounts`;');
$query = $query->fetch();
$total_accounts = $query['how_much'];

$query = $db->query('SELECT count(*) as `how_much` FROM `players`;');
$query = $query->fetch();
$total_players = $query['how_much'];

$query = $db->query('SELECT count(*) as `how_much` FROM `guilds`;');
$query = $query->fetch();
$total_guilds = $query['how_much'];

$query = $db->query('SELECT count(*) as `how_much` FROM `houses`;');
$query = $query->fetch();
$total_houses = $query['how_much'];

$points = $db->query('SELECT `premium_points`, `' . (USE_ACCOUNT_NAME ? 'name' : 'id') . '` as `name` FROM `accounts` ORDER BY `premium_points` DESC LIMIT 10;');

$twig->display('admin.statistics.html.twig', array(
	'total_accounts' => $total_accounts,
	'total_players' => $total_players,
	'total_guilds' => $total_guilds,
	'total_houses' => $total_houses,
	'account_type' => (USE_ACCOUNT_NAME ? 'name' : 'number'),
	'points' => $points
));
?>