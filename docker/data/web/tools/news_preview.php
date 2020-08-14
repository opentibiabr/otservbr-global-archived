<?php
/**
 * News preview
 * Returns news preview in json format
 *
 * @package   MyAAC
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */

// we need some functions
require '../common.php';
require_once SYSTEM . 'functions.php';
require_once SYSTEM . 'init.php';
require_once SYSTEM . 'template.php';

$error = '';
if(isset($_GET['title'], $_GET['body'], $_GET['player_id'], $_GET['category'], $_GET['forum_section'], $_GET['template_path'], $_GET['type']))
{
	$categories = array();
	foreach($db->query(
		'SELECT id, name, icon_id FROM ' . TABLE_PREFIX . 'news_categories WHERE hidden != 1') as $cat)
	{
		$categories[$cat['id']] = array(
			'name' => $cat['name'],
			'icon_id' => $cat['icon_id']
		);
	}

	$twig->addGlobal('config', $config);

	$player = new OTS_Player();
	$player->load($_GET['player_id']);

	$author = '';
	if($player->isLoaded()) {
		$author = $player->getName();
	}

	if($_GET['type'] == 3) { // ARTICLE
		if(!isset($_GET['article_text'], $_GET['article_image'])) {
			error_('Error: please fill all inputs.');
		}

		$featured_article = '';
		if($twig->getLoader()->exists('news.featured_article.html.twig')) {
			$featured_article = $twig->render('news.featured_article.html.twig', array(
				'article' => array(
					'id' => 1,
					'title' => $_GET['title'],
					'text' => $_GET['article_text'],
					'image' => $_GET['article_image'],
					'hidden' => 0,
					'read_more'=> '#'
				),
				'canEdit' => false
			));
		}

		success_($featured_article);
	}
	else if($_GET['type'] == 2) { // TICKER
		$tickers = array(
			array('id' => 1, 'date' => time(), 'body' => $_GET['body'], 'category' => $_GET['category'])
		);

		foreach($tickers as &$ticker) {
			$ticker['icon'] = $categories[$ticker['category']]['icon_id'];
			$ticker['body_short'] = short_text(strip_tags($ticker['body']), 100);
		}

		$tickers_content = $twig->render('news.tickers.html.twig', array(
			'tickers' => $tickers,
			'canEdit' => false,
			'i' => -1
		));

		success_($tickers_content);
	}
	else {
		success_($twig->render('news.html.twig', array(
				'id' => 1,
				'title' => $_GET['title'],
				'content' => $_GET['body'],
				'date' => time(),
				'icon' => $categories[$_GET['category']]['icon_id'],
				'author' => $config['news_author'] ? $author : '',
				'comments' => null,
				'news_date_format' => $config['news_date_format'],
				'hidden'=> 0
			)));
	}
}
else
	error_('Error: please fill all inputs.');

/**
 * Output message & exit.
 *
 * @param string $desc Description
 */
function success_($desc) {
	echo json_encode(array(
		'success' => $desc
	));
	exit();
}
function error_($desc) {
	echo json_encode(array(
		'error' => $desc
	));
	exit();
}

?>