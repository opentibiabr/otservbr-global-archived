<?php
/**
 * Spells class
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

class Spells {
	private static $spellsList = null;
	private static $lastError = '';

	// 1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support
	public static function loadGroup($tGroup) {
		switch ($tGroup) {
			case "attack":
				return 1;
			case "healing":
				return 2;
			case "summon":
				return 3;
			case "supply":
				return 4;
			case "support":
				return 5;
		}
	}

		public static function loadFromXML($show = false) {
		global $config, $db;

		try { $db->exec('DELETE FROM `' . TABLE_PREFIX . 'spells`;'); } catch(PDOException $error) {}

		if($show) {
			echo '<h2>Reload spells.</h2>';
			echo '<h2>All records deleted from table <b>' . TABLE_PREFIX . 'spells</b> in database.</h2>';
		}

		try {
			self::$spellsList = new OTS_SpellsList($config['data_path'].'spells/spells.xml');
		}
		catch(Exception $e) {
			self::$lastError = $e->getMessage();
			return false;
		}

		//add conjure spells
		$conjurelist = self::$spellsList->getConjuresList();
		if($show) {
			echo "<h3>Conjure:</h3>";
		}

		foreach($conjurelist as $spellname) {
			$spell = self::$spellsList->getConjure($spellname);
			$name = $spell->getName();

			$words = $spell->getWords();
			if(strpos($words, '#') !== false)
				continue;

			try {
				$db->insert(TABLE_PREFIX . 'spells', array(
					'name' => $name,
					'words' => $words,
					'type' => 2,
					'mana' => $spell->getMana(),
					'level' => $spell->getLevel(),
					'maglevel' => $spell->getMagicLevel(),
					'soul' => $spell->getSoul(),
					'premium' => $spell->isPremium() ? 1 : 0,
					'vocations' => json_encode($spell->getVocations()),
					'conjure_count' => $spell->getConjureCount(),
					'conjure_id' => $spell->getConjureId(),
					'reagent' => $spell->getReagentId(),
					'hidden' => $spell->isEnabled() ? 0 : 1
				));

				if($show) {
					success('Added: ' . $name . '<br/>');
				}
			}
			catch(PDOException $error) {
				if($show) {
					warning('Error while adding spell (' . $name . '): ' . $error->getMessage());
				}
			}
		}

		// add instant spells
		$instantlist = self::$spellsList->getInstantsList();
		if($show) {
			echo "<h3>Instant:</h3>";
		}

		foreach($instantlist as $spellname) {
			$spell = self::$spellsList->getInstant($spellname);
			$name = $spell->getName();

			$words = $spell->getWords();
			if(strpos($words, '#') !== false)
				continue;

			try {
				$db->insert(TABLE_PREFIX . 'spells', array(
					'name' => $name,
					'words' => $words,
					'type' => 1,
					'mana' => $spell->getMana(),
					'level' => $spell->getLevel(),
					'maglevel' => $spell->getMagicLevel(),
					'soul' => $spell->getSoul(),
					'premium' => $spell->isPremium() ? 1 : 0,
					'vocations' => json_encode($spell->getVocations()),
					'conjure_count' => 0,
					'hidden' => $spell->isEnabled() ? 0 : 1
				));

				if($show) {
					success('Added: ' . $name . '<br/>');
				}
			}
			catch(PDOException $error) {
				if($show) {
					warning('Error while adding spell (' . $name . '): ' . $error->getMessage());
				}
			}
		}

		// add runes
		$runeslist = self::$spellsList->getRunesList();
		if($show) {
			echo "<h3>Runes:</h3>";
		}

		foreach($runeslist as $spellname) {
			$spell = self::$spellsList->getRune($spellname);

			$name = $spell->getName() . ' Rune';

			try {
				$db->insert(TABLE_PREFIX . 'spells', array(
					'name' => $name,
					'words' => $spell->getWords(),
					'type' => 3,
					'mana' => $spell->getMana(),
					'level' => $spell->getLevel(),
					'maglevel' => $spell->getMagicLevel(),
					'soul' => $spell->getSoul(),
					'premium' => $spell->isPremium() ? 1 : 0,
					'vocations' => json_encode($spell->getVocations()),
					'conjure_count' => 0,
					'item_id' => $spell->getID(),
					'hidden' => $spell->isEnabled() ? 0 : 1
				));

				if($show) {
					success('Added: ' . $name . '<br/>');
				}
			}
			catch(PDOException $error) {
				if($show) {
					warning('Error while adding spell (' . $name . '): ' . $error->getMessage());
				}
			}
		}

		return true;
	}

	public static function getSpellsList() {
		return self::$spellsList;
	}

	public static function getLastError() {
		return self::$lastError;
	}
}