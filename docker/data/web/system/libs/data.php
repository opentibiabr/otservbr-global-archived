<?php
/**
 * Data class
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

class Data
{
	private $table = '';

	public function __construct($table) {
		$this->table = $table;
	}

	public function get($where)
	{
		global $db;
		return $db->select($this->table, $where);
	}

	public function add($data)
	{
		global $db;
		return $db->insert($this->table, $data);
	}

	public function delete($data, $where)
	{
		global $db;
		return $db->delete($this->table, $data, $where);
	}

	public function update($data, $where)
	{
		global $db;
		return $db->update($this->table, $data, $where);
	}
}
?>
