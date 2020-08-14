<?php
/**
 * Events system
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

define('HOOK_STARTUP', 1);
define('HOOK_BEFORE_PAGE', 2);
define('HOOK_AFTER_PAGE', 3);
define('HOOK_FINISH', 4);
define('HOOK_TIBIACOM_ARTICLE', 5);
define('HOOK_TIBIACOM_BORDER_3', 6);
define('HOOK_CHARACTERS_BEFORE_INFORMATIONS', 7);
define('HOOK_CHARACTERS_AFTER_INFORMATIONS', 8);
define('HOOK_CHARACTERS_BEFORE_SIGNATURE', 9);
define('HOOK_CHARACTERS_AFTER_SIGNATURE', 10);
define('HOOK_CHARACTERS_AFTER_ACCOUNT', 11);
define('HOOK_CHARACTERS_AFTER_CHARACTERS', 12);
define('HOOK_LOGIN', 13);
define('HOOK_LOGIN_ATTEMPT', 14);
define('HOOK_LOGOUT', 15);
define('HOOK_ACCOUNT_CREATE_BEFORE_FORM', 16);
define('HOOK_ACCOUNT_CREATE_BEFORE_BOXES', 17);
define('HOOK_ACCOUNT_CREATE_BETWEEN_BOXES_1', 18);
define('HOOK_ACCOUNT_CREATE_BETWEEN_BOXES_2', 19);
define('HOOK_ACCOUNT_CREATE_AFTER_BOXES', 20);
define('HOOK_ACCOUNT_CREATE_BEFORE_ACCOUNT', 21);
define('HOOK_ACCOUNT_CREATE_AFTER_ACCOUNT', 22);
define('HOOK_ACCOUNT_CREATE_AFTER_EMAIL', 23);
define('HOOK_ACCOUNT_CREATE_AFTER_COUNTRY', 24);
define('HOOK_ACCOUNT_CREATE_AFTER_PASSWORDS', 25);
define('HOOK_ACCOUNT_CREATE_AFTER_RECAPTCHA', 26);
define('HOOK_ACCOUNT_CREATE_BEFORE_CHARACTER_NAME', 27);
define('HOOK_ACCOUNT_CREATE_AFTER_CHARACTER_NAME', 28);
define('HOOK_ACCOUNT_CREATE_AFTER_SEX', 29);
define('HOOK_ACCOUNT_CREATE_AFTER_VOCATION', 30);
define('HOOK_ACCOUNT_CREATE_AFTER_TOWNS', 31);
define('HOOK_ACCOUNT_CREATE_BEFORE_SUBMIT_BUTTON', 32);
define('HOOK_ACCOUNT_CREATE_AFTER_FORM', 33);
define('HOOK_ACCOUNT_CREATE_AFTER_SUBMIT', 34);
define('HOOK_FIRST', HOOK_STARTUP);
define('HOOK_LAST', HOOK_ACCOUNT_CREATE_AFTER_SUBMIT);

require_once LIBS . 'plugins.php';
class Hook
{
	private $_name, $_type, $_file;

	public function __construct($name, $type, $file) {
		$this->_name = $name;
		$this->_type = $type;
		$this->_file = $file;
	}

	public function execute($params)
	{
		extract($params);
		/*if(is_callable($this->_callback))
		{
			$tmp = $this->_callback;
			$ret = $tmp($params);
		}*/

		global $db, $config, $template_path, $ots, $content, $twig;
		if(file_exists(BASE . $this->_file)) {
			$ret = require BASE . $this->_file;
		}

		return !isset($ret) || $ret == 1 || $ret;
	}

	public function name() {return $this->_name;}
	public function type() {return $this->_type;}
}

class Hooks
{
	private static $_hooks = array();

	public function register($hook, $type = '', $file = null) {
		if(!($hook instanceof Hook))
			$hook = new Hook($hook, $type, $file);

		self::$_hooks[$hook->type()][] = $hook;
	}

	public function trigger($type, $params = array())
	{
		$ret = true;
		if(isset(self::$_hooks[$type]))
		{
			foreach(self::$_hooks[$type] as $name => $hook) {
				/** @var $hook Hook */
				if (!$hook->execute($params)) {
					$ret = false;
				}
			}
		}

		return $ret;
	}

	public function exist($type) {
		return isset(self::$_hooks[$type]);
	}

	public function load()
	{
		foreach(Plugins::getHooks() as $hook) {
			$this->register($hook['name'], $hook['type'], $hook['file']);
		}
	}
}
