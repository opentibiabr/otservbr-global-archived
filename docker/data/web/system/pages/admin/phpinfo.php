<?php
/**
 * PHP Info
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');
$title = 'PHP Info';

if (!function_exists('phpinfo')) { ?>
	<b>phpinfo()</b> function is disabled in your webserver config.<br/>
	You can enable it by editing <b>php.ini</b> file.
	<?php return;
}
?>
<iframe src="<?php echo BASE_URL; ?>admin/tools/phpinfo.php" width="1024" height="550"/>
