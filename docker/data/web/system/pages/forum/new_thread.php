<?php
/**
 * New forum thread
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

if(Forum::canPost($account_logged))
{
	$players_from_account = $db->query('SELECT `players`.`name`, `players`.`id` FROM `players` WHERE `players`.`account_id` = '.(int) $account_logged->getId())->fetchAll();
	$section_id = isset($_REQUEST['section_id']) ? $_REQUEST['section_id'] : null;
	if($section_id !== null) {
		echo '<a href="' . getLink('forum') . '">Boards</a> >> <a href="' . getForumBoardLink($section_id) . '">' . $sections[$section_id]['name'] . '</a> >> <b>Post new thread</b><br />';
		if(isset($sections[$section_id]['name']) && Forum::hasAccess($section_id)) {
			if ($sections[$section_id]['closed'] && !Forum::isModerator())
				$errors[] = 'You cannot create topic on this board.';

			$quote = (int)(isset($_REQUEST['quote']) ? $_REQUEST['quote'] : 0);
			$text = isset($_REQUEST['text']) ? stripslashes($_REQUEST['text']) : '';
			$char_id = (int)(isset($_REQUEST['char_id']) ? $_REQUEST['char_id'] : 0);
			$post_topic = isset($_REQUEST['topic']) ? stripslashes($_REQUEST['topic']) : '';
			$smile = (isset($_REQUEST['smile']) ? (int)$_REQUEST['smile'] : 0);
			$html = (isset($_REQUEST['html']) ? (int)$_REQUEST['html'] : 0);
			$saved = false;
			if (isset($_REQUEST['save'])) {
				$errors = array();

				$lenght = 0;
				for ($i = 0; $i < strlen($post_topic); $i++) {
					if (ord($post_topic[$i]) >= 33 && ord($post_topic[$i]) <= 126)
						$lenght++;
				}
				if ($lenght < 1 || strlen($post_topic) > 60)
					$errors[] = 'Too short or too long topic (short: ' . $lenght . ' long: ' . strlen($post_topic) . ' letters). Minimum 1 letter, maximum 60 letters.';
				$lenght = 0;
				for ($i = 0; $i < strlen($text); $i++) {
					if (ord($text[$i]) >= 33 && ord($text[$i]) <= 126)
						$lenght++;
				}
				if ($lenght < 1 || strlen($text) > 15000)
					$errors[] = 'Too short or too long post (short: ' . $lenght . ' long: ' . strlen($text) . ' letters). Minimum 1 letter, maximum 15000 letters.';

				if ($char_id == 0)
					$errors[] = 'Please select a character.';
				$player_on_account = false;

				if (count($errors) == 0) {
					foreach ($players_from_account as $player)
						if ($char_id == $player['id'])
							$player_on_account = true;
					if (!$player_on_account)
						$errors[] = 'Player with selected ID ' . $char_id . ' doesn\'t exist or isn\'t on your account';
				}

				if (count($errors) == 0) {
					$last_post = 0;
					$query = $db->query('SELECT `post_date` FROM `' . FORUM_TABLE_PREFIX . 'forum` ORDER BY `post_date` DESC LIMIT 1');
					if ($query->rowCount() > 0) {
						$query = $query->fetch();
						$last_post = $query['post_date'];
					}
					if ($last_post + $config['forum_post_interval'] - time() > 0 && !Forum::isModerator())
						$errors[] = 'You can post one time per ' . $config['forum_post_interval'] . ' seconds. Next post after ' . ($last_post + $config['forum_post_interval'] - time()) . ' second(s).';
				}
				if (count($errors) == 0) {
					$saved = true;
					$db->query("INSERT INTO `" . FORUM_TABLE_PREFIX . "forum` (`first_post` ,`last_post` ,`section` ,`replies` ,`views` ,`author_aid` ,`author_guid` ,`post_text` ,`post_topic` ,`post_smile`, `post_html` ,`post_date` ,`last_edit_aid` ,`edit_date`, `post_ip`) VALUES ('0', '" . time() . "', '" . (int)$section_id . "', '0', '0', '" . $account_logged->getId() . "', '" . (int)$char_id . "', " . $db->quote($text) . ", " . $db->quote($post_topic) . ", '" . (int)$smile . "', '" . (int)$html . "', '" . time() . "', '0', '0', '" . $_SERVER['REMOTE_ADDR'] . "')");
					$thread_id = $db->lastInsertId();
					$db->query("UPDATE `" . FORUM_TABLE_PREFIX . "forum` SET `first_post`=" . (int)$thread_id . " WHERE `id` = " . (int)$thread_id);
					header('Location: ' . getForumThreadLink($thread_id));
					echo '<br />Thank you for posting.<br /><a href="' . getForumThreadLink($thread_id) . '">GO BACK TO LAST THREAD</a>';
				}
			}

			if (!$saved) {
				if (!empty($errors))
					$twig->display('error_box.html.twig', array('errors' => $errors));

				$twig->display('forum.new_thread.html.twig', array(
					'section_id' => $section_id,
					'players' => $players_from_account,
					'post_player_id' => $char_id,
					'post_thread' => $post_topic,
					'post_text' => $text,
					'post_smile' => $smile > 0,
					'post_html' => $html > 0,
					'canEdit' => $canEdit
				));
			}
		}
		else
			echo 'Board with ID ' . $board_id . ' doesn\'t exist.';
	}
	else
		echo 'Please enter section_id.';
}
else
	echo 'Your account is banned, deleted or you don\'t have any player with level '.$config['forum_level_required'].' on your account. You can\'t post.';

?>