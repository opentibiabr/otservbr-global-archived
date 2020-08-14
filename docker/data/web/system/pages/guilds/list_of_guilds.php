<?php
/**
 * List of guilds
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @author    whiteblXK
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

$guilds_list = new OTS_Guilds_List();
$guilds_list->orderBy("name");

$guilds = array();
if(count($guilds_list) > 0)
{
    foreach ($guilds_list as $guild) {
        $guild_logo = $guild->getCustomField('logo_name');
        if (empty($guild_logo) || !file_exists('images/guilds/' . $guild_logo))
            $guild_logo = "default.gif";

        $description = $guild->getCustomField('description');
        $description_with_lines = str_replace(array("\r\n", "\n", "\r"), '<br />', $description, $count);
        if ($count < $config['guild_description_lines_limit'])
            $description = wordwrap(nl2br($description), 60, "<br />", true);

        $guildName = $guild->getName();
        $guilds[] = array('name' => $guildName, 'logo' => $guild_logo, 'link' => getGuildLink($guildName, false), 'description' => $description);
    }
};

$twig->display('guilds.list.html.twig', array(
    'guilds' => $guilds,
    'logged' => isset($logged) ? $logged : false,
    'isAdmin' => admin(),
));