<?php
/**
 * Version check
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');
$title = 'Version check';

// fetch version
//$file = @fopen('https://my-aac.org/VERSION', 'r') or die('Error while fetching version.');
//$myaac_version = fgets($file);
$myaac_version = @file_get_contents('https://my-aac.org/VERSION');
if (!$myaac_version) {
	warning('Error while fetching version info from https://my-aac.org<br/>
	Please try again later.');
	return;
}

// compare them
$version_compare = version_compare($myaac_version, MYAAC_VERSION);
if ($version_compare == 0) {
	success('MyAAC latest version is ' . $myaac_version . '. You\'re using the latest version.
	<br/>View CHANGELOG ' . generateLink(ADMIN_URL . '?p=changelog', 'here'));
} else if ($version_compare < 0) {
	success('Woah, seems you\'re using newer version as latest released one! MyAAC latest released version is ' . $myaac_version . ', and you\'re using version ' . MYAAC_VERSION . '.
	<br/>View CHANGELOG ' . generateLink(ADMIN_URL . '?p=changelog', 'here'));
} else {
	warning('You\'re using outdated version.<br/>
		Your version: <b>' . MYAAC_VERSION . '</b><br/>
		Latest version: <b>' . $myaac_version . '</b><br/>
		Download available at: <a href="https://my-aac.org" target="_blank">www.my-aac.org</a>');
}

/*
function version_revert($version)
{
	$major = floor($version / 10000);
	$version -= $major * 10000;

	$minor = floor($version / 100);
	$version -= $minor * 100;

	$release = $version;
	return $major . '.' . $minor . '.' . $release;
}*/
?>
