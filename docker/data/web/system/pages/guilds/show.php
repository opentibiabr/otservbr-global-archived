<?php
/**
 * Show guild
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @author    whiteblXK
 * @copyright 2019 MyAAC
 * @link      https://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

$title = 'Guilds';
$guild_name = isset($_REQUEST['guild']) ? urldecode($_REQUEST['guild']) : null;
if(!Validator::guildName($guild_name))
	$errors[] = Validator::getLastError();

if(empty($errors))
{
	$guild = new OTS_Guild();
	$guild->find($guild_name);
	if(!$guild->isLoaded())
		$errors[] = 'Guild with name <b>'.$guild_name.'</b> doesn\'t exist.';
}

if(!empty($errors))
{
	$twig->display('error_box.html.twig', array('errors' => $errors));
	$twig->display('guilds.back_button.html.twig');
	return;
}

$guild_name = $guild->getName();
$title = $guild_name . ' - ' . $title;

$guild_owner = $guild->getOwner();
$rank_list = $guild->getGuildRanksList();
$rank_list->orderBy('level', POT::ORDER_DESC);

$guild_leader = false;
$guild_vice = false;
$level_in_guild = 0;

$players_from_account_in_guild = array();
$players_from_account_ids = array();
if($logged)
{
    $account_players = $account_logged->getPlayers();
    foreach($account_players as $player)
    {
        $players_from_account_ids[] = $player->getId();
        $player_rank = $player->getRank();
        if($player_rank->isLoaded())
        {
            foreach($rank_list as $rank_in_guild)
            {
                if($guild_owner->isLoaded() && $rank_in_guild->isLoaded() && $player_rank->isLoaded() &&
                    $rank_in_guild->getId() == $player_rank->getId())
                {
                    $players_from_account_in_guild[] = $player->getName();
                    if($guild_owner->getId() == $player->getId())
                    {
                        $guild_vice = true;
                        $guild_leader = true;
                    }
                    else if($player_rank->getLevel() > 1)
                    {
                        $guild_vice = true;
                        $level_in_guild = $player_rank->getLevel();
                    }
                }
            }
        }
    }
}

//show guild page
$guild_logo = $guild->getCustomField('logo_name');
if(empty($guild_logo) || !file_exists('images/guilds/' . $guild_logo))
    $guild_logo = "default.gif";

$description = $guild->getCustomField('description');
$description_with_lines = str_replace(array("\r\n", "\n", "\r"), '<br />', $description, $count);
if($count < $config['guild_description_lines_limit'])
    $description = wordwrap(nl2br($description), 60, "<br />", true);
//$description = $description_with_lines;

$guild_owner = $guild->getOwner();
if($guild_owner->isLoaded())
    $guild_owner_name = $guild_owner->getName();

$guild_members = array();
foreach($rank_list as $rank)
{
    if($db->hasTable(GUILD_MEMBERS_TABLE))
        $players_with_rank = $db->query('SELECT `players`.`id` as `id`, `' . GUILD_MEMBERS_TABLE . '`.`rank_id` as `rank_id` FROM `players`, `' . GUILD_MEMBERS_TABLE . '` WHERE `' . GUILD_MEMBERS_TABLE . '`.`rank_id` = ' . $rank->getId() . ' AND `players`.`id` = `' . GUILD_MEMBERS_TABLE . '`.`player_id` ORDER BY `name`;');
    else if($db->hasColumn('players', 'rank_id'))
        $players_with_rank = $db->query('SELECT `id`, `rank_id` FROM `players` WHERE `rank_id` = ' . $rank->getId() . ' AND `deleted` = 0;');

    $players_with_rank_number = $players_with_rank->rowCount();
    if($players_with_rank_number > 0)
    {
        $members = array();
        foreach($players_with_rank as $result)
        {
            $player = new OTS_Player();
            $player->load($result['id']);
            if(!$player->isLoaded())
                continue;

            $members[] = $player;
        }

        $guild_members[] = array(
            'rank_name' => $rank->getName(),
            'rank_level' => $rank->getLevel(),
            'members' => $members
        );
    }
}

include(SYSTEM . 'libs/pot/InvitesDriver.php');
new InvitesDriver($guild);
$invited_list = $guild->listInvites();
$show_accept_invite = 0;
if($logged && count($invited_list) > 0)
{
    foreach($invited_list as $invited_player)
    {
        if(count($account_players) > 0)
        {
            foreach($account_players as $player_from_acc)
            {
                if($player_from_acc->isLoaded() && $invited_player->isLoaded() && $player_from_acc->getName() == $invited_player->getName())
                    $show_accept_invite++;
            }
        }
    }
}

$useGuildNick = false;
if($db->hasColumn('players', 'guildnick'))
    $useGuildNick = true;

$twig->display('guilds.view.html.twig', array(
    'logo' => $guild_logo,
    'guild_name' => $guild_name,
    'description' => $description,
    'guild_owner' => $guild_owner->isLoaded() ? $guild_owner : null,
    'guild_creation_date' => $guild->getCreationData(),
    'guild_members' => $guild_members,
    'players_from_account_ids' => $players_from_account_ids,
    'players_from_account_in_guild' => $players_from_account_in_guild,
    'level_in_guild' => $level_in_guild,
    'isLeader' => $guild_leader,
    'isVice' => $guild_vice,
    'logged' => $logged,
    'invited_list' => $invited_list,
    'show_accept_invite' => $show_accept_invite,
    'useGuildNick' => $useGuildNick
));