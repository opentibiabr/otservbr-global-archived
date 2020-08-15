<?php
/**
 * Project: MyAAC
 *     Automatic Account Creator for Open Tibia Servers
 * File: common.php
 *
 * This is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
if (version_compare(phpversion(), '5.5', '<')) die('PHP version 5.5 or higher is required.');
session_start();

define('MYAAC', true);
define('MYAAC_VERSION', '0.8.3-dev');
define('DATABASE_VERSION', 30);
define('TABLE_PREFIX', 'myaac_');
define('START_TIME', microtime(true));
define('MYAAC_OS', stripos(PHP_OS, 'WIN') === 0 ? 'WINDOWS' : (strtoupper(PHP_OS) === 'DARWIN' ? 'MAC' : 'LINUX'));
define('IS_CLI', in_array(php_sapi_name(), ['cli', 'phpdb']));

// account flags
define('FLAG_ADMIN', 1);
define('FLAG_SUPER_ADMIN', 2);
define('FLAG_CONTENT_PAGES', 4);
define('FLAG_CONTENT_MAILER', 8);
define('FLAG_CONTENT_NEWS', 16);
define('FLAG_CONTENT_FORUM', 32);
define('FLAG_CONTENT_COMMANDS', 64);
define('FLAG_CONTENT_SPELLS', 128);
define('FLAG_CONTENT_MONSTERS', 256);
define('FLAG_CONTENT_GALLERY', 512);
define('FLAG_CONTENT_VIDEOS', 1024);
define('FLAG_CONTENT_FAQ', 2048);
define('FLAG_CONTENT_MENUS', 4096);
define('FLAG_CONTENT_PLAYERS', 8192);

// news
define('NEWS', 1);
define('TICKER', 2);
define('ARTICLE', 3);

// directories
define('BASE', __DIR__ . '/');
define('ADMIN', BASE . 'admin/');
define('SYSTEM', BASE . 'system/');
define('CACHE', SYSTEM . 'cache/');
define('LOCALE', SYSTEM . 'locale/');
define('LIBS', SYSTEM . 'libs/');
define('LOGS', SYSTEM . 'logs/');
define('PAGES', SYSTEM . 'pages/');
define('PLUGINS', BASE . 'plugins/');
define('TEMPLATES', BASE . 'templates/');
define('TOOLS', BASE . 'tools/');

// menu categories
define('MENU_CATEGORY_NEWS', 1);
define('MENU_CATEGORY_ACCOUNT', 2);
define('MENU_CATEGORY_COMMUNITY', 3);
define('MENU_CATEGORY_FORUM', 4);
define('MENU_CATEGORY_LIBRARY', 5);
define('MENU_CATEGORY_SHOP', 6);

// otserv versions
define('OTSERV', 1);
define('OTSERV_06', 2);
define('OTSERV_FIRST', OTSERV);
define('OTSERV_LAST', OTSERV_06);
define('TFS_02', 3);
define('TFS_03', 4);
define('TFS_FIRST', TFS_02);
define('TFS_LAST', TFS_03);

// basedir
$basedir = '';
$tmp = explode('/', $_SERVER['SCRIPT_NAME']);
$size = count($tmp) - 1;
for($i = 1; $i < $size; $i++)
	$basedir .= '/' . $tmp[$i];

$basedir = str_replace(array('/admin', '/install'), '', $basedir);
define('BASE_DIR', $basedir);

if(!IS_CLI) {
	if (isset($_SERVER['HTTP_HOST'][0])) {
		$baseHost = $_SERVER['HTTP_HOST'];
	} else {
		if (isset($_SERVER['SERVER_NAME'][0])) {
			$baseHost = $_SERVER['SERVER_NAME'];
		} else {
			$baseHost = $_SERVER['SERVER_ADDR'];
		}
	}

	define('SERVER_URL', 'http' . (isset($_SERVER['HTTPS'][0]) && strtolower($_SERVER['HTTPS']) === 'on' ? 's' : '') . '://' . $baseHost);
	define('BASE_URL', '//' . $baseHost . BASE_DIR . '/');
	define('ADMIN_URL', SERVER_URL . BASE_DIR . '/admin/');

	//define('CURRENT_URL', BASE_URL . $_SERVER['REQUEST_URI']);

	require SYSTEM . 'exception.php';
}
require SYSTEM . 'autoload.php';
