<?php
/**
 * account-create index.php
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2020 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

global $twig_loader;
$twig_loader->prependPath(BASE . 'plugins/account-create-hint');

$twig->display('hint.html.twig');
