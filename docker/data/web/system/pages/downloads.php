<?php
/**
 * Downloads page looking more Tibish for MyAAC
 *
 * @name      better-downloads-page
 * @author    Slawkens <slawkens@gmail.com>
 * @version   1.0
 */
defined('MYAAC') or die('Direct access not allowed!');
$title = 'Download Client';

if(!isset($config['downloads']))
{
	$config['downloads'] = array(
		'clients' => array(
			// name => link to download
			'Client 11.47' => 'http://www.mediafire.com/file/9232w30it5982b2/Malvera_Global_-_11.46.rar',
			'Client 10' => 'http://www.mediafire.com/file/2q215ur471uq2tf/MalveraGlobal_-_10.rar'
		),
		'ip_changer' => 'https://static.otland.net/ipchanger.exe', // remove to disable ip changer link
		'minimap' => true // display link to download minimap from https://tibiamaps.io/downloads?
	);
}

if(isset($_REQUEST['step']) && $_REQUEST['step'] == "download") {
	echo $twig->render('downloads.html.twig', array('downloads_config' => $config['downloads']));
	$template_place_holders['body_end'][] = '<div id="HelperDivContainer" style="background-image: url(images/global/content/scroll.gif);">
  		<div class="HelperDivArrow" style="background-image: url(images/global/content/helper-div-arrow.png);"></div>
		<div id="HelperDivHeadline"></div>
		<div id="HelperDivText"></div>
		<center><img class="Ornament" src="images/global/content/ornament.gif"></center><br>
   </div>';
} else {
	echo $twig->render('downloads.agreement.html.twig');
}