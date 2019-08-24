<?php

require 'config/config.php';

// comment to show E_NOTICE [undefinied variable etc.], comment if you want make script and see all errors
error_reporting(E_ALL ^ E_STRICT ^ E_NOTICE);

// true = show sent queries and SQL queries status/status code/error message
define('DEBUG_DATABASE', false);
define('INITIALIZED', true);

if (!defined('ONLY_PAGE'))
    define('ONLY_PAGE', true);

// check if site is disabled/requires installation
include_once('./system/load.loadCheck.php');

// fix user data, load config, enable class auto loader
include_once('./system/load.init.php');

// DATABASE
include_once('./system/load.database.php');
if (DEBUG_DATABASE)
    Website::getDBHandle()->setPrintQueries(true);

// DATABASE END



$input = json_decode(file_get_contents("php://input"));
switch ($input->type ? $input->type : '') {

    case "cacheinfo":
                $playersonline = $SQL->query("SELECT * FROM `players_online`")->fetchAll();
        $statistics = [
                                                'playersonline' => (count($playersonline[0])),
                                                'twitchstreams' => 456,
                                                'twitchviewer' => 678,
                                                'gamingyoutubestreams' => 910,
                                                'gamingyoutubeviewer' => 112
                                        ];
        echo json_encode($statistics);
    break;

    case "eventschedule":


$startdate1 = new DateTime("2019-08-21 00:00:00", new DateTimeZone("Europe/Berlin"));
$FinalDate1 = new DateTime("2019-08-23 00:00:00", new DateTimeZone("Europe/Berlin"));



        
                $campaign = [
        [
                'startdate' => $startdate1 ->getTimestamp(),
                'enddate' => $FinalDate1 ->getTimestamp(),
                'colorlight' => '#64162b',
                'colordark' => '#7a1b34',
                'name' => 'OpenTibia-P',
                'description' => 'OpenTibia-P',
                'isseasonal' => false
                ], [
                'startdate' => time(),
                'enddate' => time() + 36600 * 20,
                'colorlight' => '#617a49',
                'colordark' => '#4f633c',
                'name' => 'OpenTibia-P',
                'description' => 'OpenTibia-P',
                'isseasonal' => false
                ], [
                'startdate' => time(),
                'enddate' => time() + 36600 * 20,
                'colorlight' => '#527b53',
                'colordark' => '#436343',
                'name' => 'OpenTibia-P',
                'description' => 'OpenTibia-P',
                'isseasonal' => false
                ], [
                'startdate' => time() - 36000,
                'enddate' => time() + 36600 * 30,
                'colorlight' => '#64162b',
                'colordark' => '#7a1b34',
                'name' => 'OpenTibia-P',
                'description' => 'OpenTibia-P',
                'isseasonal' => false
                ], [
                'startdate' => time() - 36000,
                'enddate' => time() + 36600 * 30,
                'colorlight' => '#24657b',
                'colordark' => '#1d5263',
                'name' => 'OpenTibia-P',
                'description' => 'OpenTibia-P',
                'isseasonal' => false
                ], [
                'startdate' => time() - 36000,
                'enddate' => time() + 36600 * 30,
                'colorlight' => '#8B6D05',
                'colordark' => '#735D10',
                'name' => 'OpenTibia-P',
                'description' => 'OpenTibia-P',
                'isseasonal' => false
                ]        ];
                $schedule['lastupdatetimestamp'] = time();
                 $schedule['eventlist'] = $campaign;
        echo json_encode($schedule);
        break;


    case "categorycounts":
        
                $gamenews = [
        [
                'campaignid' => 0,
                'category' => 'MAJOR UPDATES',
                'headline' => '<p>Summer Update 2019</p>',
                'id' => '56',
                'index' => '0',
                'message' => '<center>\n<table style=\"height: 88px;\" width=\"406\">\n<tbody>\n<tr>\n<td style=\"width: 396px; vertical-align: top;\"><center>&nbsp;<img src=\"https://static.tibia.com/images/news/summer2019.jpg\" width=\"479\" height=\"379\" />\n<p>If you would like to find out more, check the <a href=\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=5141\">release news</a> on our website.</p>\n</center></td>\n</tr>\n</tbody>\n</table>\n</center>',
                'publishdate' => 1564387200,
                'type' => 'REGULAR'
                ]];
                $schedule['idOfNewestReadEntry'] = 56;
                $schedule['isreturner'] = false;
                $schedule['maxeditdate'] = 1564416295;
                 $schedule['showrewardnews'] = true;
        echo json_encode($schedule);
        break;



    case "categorycounts":
        
                $gamenews = [
        [
                'campaignid' => 0,
                'category' => 'MAJOR UPDATES',
                'headline' => '<p>Summer Update 2019</p>',
                'id' => '56',
                'index' => '0',
                'message' => '<center>\n<table style=\"height: 88px;\" width=\"406\">\n<tbody>\n<tr>\n<td style=\"width: 396px; vertical-align: top;\"><center>&nbsp;<img src=\"https://static.tibia.com/images/news/summer2019.jpg\" width=\"479\" height=\"379\" />\n<p>If you would like to find out more, check the <a href=\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=5141\">release news</a> on our website.</p>\n</center></td>\n</tr>\n</tbody>\n</table>\n</center>',
                'publishdate' => 1564387200,
                'type' => 'REGULAR'
                ]];
                $schedule['idOfNewestReadEntry'] = 56;
                $schedule['isreturner'] = false;
                $schedule['maxeditdate'] = 1564416295;
                 $schedule['showrewardnews'] = true;
        echo json_encode($schedule);
        break;

    case "boostedcreature":
        
        //youburromen? EU NAO SEI ISSO  TESTE AI  EPA tinha um errinho ali kkk vê agr
        
		$result = $SQL->prepare("SELECT `value` FROM `global_storage` WHERE `key` = '56541'");
		$result->execute([]);

		$raceid = $result->fetchAll();
        
        $boostedcreature["boostedcreature"] = true;
        $boostedcreature["raceid"] = (int)$raceid[0]['value'];
        

       /// EU JA DISSE QUE VOCE É GOSTOSO?
        echo json_encode($boostedcreature);
        break;
                
        case "login":


# Declare variables with array structure
$characters = array();
$playerData = array();
$data = array();
$isCasting = false;

# error function
function sendError($msg){
    $ret = array();
    $ret["errorCode"] = 3;
    $ret["errorMessage"] = $msg;
    
    die(json_encode($ret));
}

# getting infos
        $request = file_get_contents('php://input');
        $result = json_decode($request, true);

# account infos
        $accountName = $result["accountname"];
        $password = $result["password"];
# game port
        $port = 7172;

# check if player wanna see cast list
if (strtolower($accountName) == "cast")
        $isCasting = true;
if ($isCasting) {
        $casts = $SQL->query("SELECT `player_id` FROM `live_casts`")->fetchAll();
        if (count($casts[0]) == 0)
                sendError("There is no live casts right now!");
        foreach($casts as $cast) {
                $character = new Player();
                $character->load($cast['player_id']);
                
                if ($character->isLoaded()) {
                $level = $character->getLevel();
                $outfitid = $character->getLookType();
                $headcolor = $character->getLookHead();
                $torsocolor = $character->getLookBody();
                $legscolor = $character->getLookLegs();
                $detailcolor = $character->getLookFeet();
                $addonflags = $character->getLookAddons();
                settype($level, "int");
                settype($outfitid, "int");
                settype($headcolor, "int"); 
                settype($torsocolor, "int"); 
                settype($legscolor, "int"); 
                settype($detailcolor, "int"); 
                settype($addonflags, "int"); 
                $char = array("worldid" => 0, 
                                                "name" => $character->getName(), 
                                                "ismale" => (($character->getSex() == 1) ? true : false), 
                                                "tutorial" => false, 
                                                "outfitid" => $outfitid, 
                                                "level" => $level,
                                                "headcolor" => $headcolor,
                                                "torsocolor" => $torsocolor,
                                                "legscolor" => $legscolor,
                                                "detailcolor" => $detailcolor,
                                                "addonflags" => $addonflags,
                                                "vocation" => $character->getVocationName(),
                                                "ishidden" => (($character->isHidden() == 1) ? true : false));
                        $characters[] = $char;
                }                        
        }
        $port = 7173;
        $lastLogin = 0;
        $premiumAccount = true;
        $timePremium = 0;
} else {
        $account = new Account();
        $account->find($accountName);
        
        if (!$account->isLoaded())
                sendError("Failed to get account. Try again!");
        if ($account->getPassword() != Website::encryptPassword($password))
                sendError("The password for this account is wrong. Try again!");
        
        foreach($account->getPlayersList() as $character) {
                $level = $character->getLevel();
                $outfitid = $character->getLookType();
                $headcolor = $character->getLookHead();
                $torsocolor = $character->getLookBody();
                $legscolor = $character->getLookLegs();
                $detailcolor = $character->getLookFeet();
                $addonflags = $character->getLookAddons();
                settype($level, "int");
                settype($outfitid, "int");
                settype($headcolor, "int"); 
                settype($torsocolor, "int"); 
                settype($legscolor, "int"); 
                settype($detailcolor, "int"); 
                settype($addonflags, "int"); 
                $char = array("worldid" => 0, 
                                                "name" => $character->getName(), 
                                                "ismale" => (($character->getSex() == 1) ? true : false), 
                                                "tutorial" => false, 
                                                "outfitid" => $outfitid, 
                                                "level" => $level,
                                                "headcolor" => $headcolor,
                                                "torsocolor" => $torsocolor,
                                                "legscolor" => $legscolor,
                                                "detailcolor" => $detailcolor,
                                                "addonflags" => $addonflags,
                                                "vocation" => $character->getVocation(),
                                                "ishidden" => (($character->isHidden() == 1) ? true : false));
                $characters[] = $char;
        }
        
        $lastLogin = $account->getLastLogin();
        $premiumAccount = ($account->isPremium()) ? true : false;
        $timePremium = time() + ($account->getPremDays() * 86400);
}
$session = array(
        "fpstracking" => false,
        "optiontracking" => false,
        "isreturner" => true,
        "returnernotification" => false,
        "showrewardnews" => false,
        "sessionkey" => $accountName . "\n" . $password,
        "lastlogintime" => $lastLogin,
    "ispremium" => $premiumAccount,
    "premiumuntil" => $timePremium,
    "status" => "active",        
        "stayloggedin" => true
);

        if ($config['server']['worldType'] == "pvp") {
                $pvptype = 0;
        }
                else if ($config['server']['worldType'] == "no-pvp") {
                        $pvptype = 1;
                }
                else if ($config['server']['worldType'] == "pvp-enforced") {
                        $pvptype = 2;
                }
                else {
                        $pvptype = 0; //default value
                }

$world = array(
        "id" => 0,
        "name" => $config['server']['serverName'],
        "externaladdress" => $config['server']['ip'],
        "externalport" => $port,
        "previewstate" => 0,
    "location" => "BRA",
        "externaladdressunprotected" => $config['server']['ip'],
        "externaladdressprotected" => $config['server']['ip'],
        "externalportunprotected" => $port,
        "externalportprotected" => $port,
        "pvptype" => $pvptype,
        "anticheatprotection" => false
);



$worlds = array($world);
$data["session"] = $session;
$playerData["worlds"] = $worlds;
$playerData["characters"] = $characters;
$data["playdata"] = $playerData;
$data["survey"] = $survey;

echo json_encode($data);
}