## CHANGELOG
### Project Name: OTServBR - Global 

## Credits for TFS Developers/Contributors
[The Forgotten Server](https://github.com/otland/forgottenserver)

Thanks OTXServer/Mattyx for new protocol

### Version
Based On TFS 1.3 

### License
[GNU GPLv3](http://gplv3.fsf.org/)

### Foruns
* [Forum OTServ Brasil](https://forums.otserv.com.br/)
  

* [Forum OTLand](https://otland.net/)

## File changes:
Added: (A)<br>
Deleted: (D)<br>
Modified: (M)<br>

#### src/
#### .cpp archives
* (A) - New Autoloot System for Modal (tag "//Autoloot" at the source)
  * How to use: say !add monstername
  * Add loot to the list (if added you can see * before item name)

* (A) New anti-wipe exhaust functions:
   * game.cpp - Can't move item very fast
   * game.cpp - Can't look very fast (on look and battle)
   * game.cpp - Can't speak very fast
   * game.cpp - Can't trade very fast
   * game.cpp - Can't create/delete offer market very fast
   
   
 * (A) revscriptsys [#2558](https://github.com/otland/forgottenserver/pull/2558) [#2584](https://github.com/otland/forgottenserver/pull/2584) [#2571](https://github.com/otland/forgottenserver/pull/2571), currently it supports:
  * Actions
  * TalkActions
  * CreatureEvents
  * GlobalEvents
  * MoveEvents
  * Spells
  * Weapons
  
* (A) - actions.cpp - New rewardchest feature

* (A) actions.cpp - Reward Chest

* (A) container.cpp - News Function getTopParentContainer and getContainerHoldingCount

* (A) game.cpp - News Function searchForItem (from TFS)

* (A) game.cpp - News Function playerEquipItem (from TFS)

* (A) inbox.cpp - News Function 
   * setMaxInboxItem (prevent crash from mail)

   * getTopParent (prevent crash from mail)

* (A) items.cpp - News Function builInventoryList(from TFS)

* (A) - luascript.cpp - News Functions

  * New Function getPreyMonsters

  * New Function getRespawnType
  
  * Fix in Function luaCombatExecute (From TFS): [#2591](https://github.com/otland/forgottenserver/pull/2592)
  
* (A) monster.cpp: Update spells.cpp | fix very rare crash bug. [#2582](https://github.com/otland/forgottenserver/pull/2582)

* (A) monsters.cpp - Random step every 1s without a target (From TFS) [#2559](https://github.com/otland/forgottenserver/pull/2559)

* (A) protocolgame.cpp - Cannot login using OTC (because can use OTC for inject bytes and generate crashs)

* (A) protocolgamebase.cpp - ProtocolGame::sendAddCreature: simplify sendInventoryItems (From TFS) [#2574](https://github.com/otland/forgottenserver/pull/2574)

* (A) rewardchest.cpp - New rewardchest from sources

* (A) spells.cpp:
  - New function that prevents crash
  
  - Fix very rare crash bug [#2582](https://github.com/otland/forgottenserver/pull/2582/files)

* (A) tile.cpp - New Function getWeight (prevent to drag items too heavy)

* (M) - optization in the getWorldLight function (from TFS)

* (M) map.cpp - Optimizations

* (M) vocations.cpp - Mana calcule revision (from TFS)

* (D) groups.cpp - Moved flags to groups.xml

* (D) luascript.cpp - Moved getCreatureCondition and getPlayerFlagValue to compat.lua

* (D) party.cpp - broadcastPartyLoot

#### .h archives
* (A) const.h - News Effects

* (A) rewardchest.h - New rewardchest

* (D) - broadcastPartyLoot

#### actions/
#### .xml archives
* (D) Moved spellbooks to new lua system from TFS: data/scripts/actions/spellbook.lua


#### .lua archives
* (A) New spellbook.lua in data/scripts/actions/spellbook.lua

* (M) Fix mana skill multiplier (From TFS) [#2593](https://github.com/otland/forgottenserver/pull/2593)
  - Do not pass product of skills rate by mana/skill tries when calling addSkillTries/addManaSpent

### creaturescripts/
#### .xml archives
* 

#### .lua archives
* 

#### events/
#### .xml archives
* (A) - function onStorageUpdate 
* (A) - function onUseWeapon 
* (A) - function onCombatSpell 
* (A) - function onRemoveCount
 
### .lua archives

#### globalevents/
#### .xml archives
* 

#### .lua archives
* 

#### lib/
#### .lua archives
* (A) 
  * Party moved to .lua core (Feature from TFS)

  * Added a new function to party class called broadcastPartyLoot (based on sources)

  * Moved quests.xml to lua core lib/core/quests.lua

Archives: core/core.lua and core/party.lua

* (A) - News functions to the system for lua added in compat.lua

* (A) - getCreatureCondition and getPlayerFlagValue moved to compat.lua

#### monsters/
#### .xml archives
* (M) - Moved monsters of Ferumbras Ascendant Quest to "monsters/quests/ferumbras ascendant/"

#### .lua archives
* (A) - New system monster in lua at "data/scripts/monsters/example.lua"

* (A) - New system monster event in lua at "data/scripts/monsters/events/example.lua"

* (A) - News monsters of Pertch Queen Quest

* (M) - Moved monsters of Ferumbras Ascendant Quest to "monsters/quests/ferumbras ascendant/"

#### movements/
#### .xml archives
* 

#### .lua archives
* 

#### npc/
#### .xml archives
* 

#### .lua archives
* 
#### 
spells/
#### .xml archives
* (A) - News monsters spells

#### .lua archives
* (A) - News nonsters spells 

  * arachnophobicawavedice

  * arachnophobicawaveenergy

  * pixie skill reducer

#### talkactions/
#### .xml archives
* (D) - Deleted script from talkaction: position.lua (moved for new lua system)

#### .lua archives
* (A) - New system talkaction in lua at data/scripts/talkaction/position.lua

#### weapons/
#### .xml archives
* 

#### .lua archives
* (A) - New system weapons in lua at data/scripts/weapons/example.lua

#### XML/
#### .xml archives
* (M) - groups.xml - Flags moved to groups.xml

* (M) - mounts.xml - [News Mounts](https://github.com/opentibiabr/OTServBR-Global/commit/c897c33c799d2ec9d5bbc6ee473736bc7f37f7f2)

* (M) - outfits.xml - [News Outfits](https://github.com/opentibiabr/OTServBR-Global/commit/9106640793f69011a45577885774399238c91449)

* (D) - quests.xml - Moved to [LUA](https://github.com/opentibiabr/OTServBR-Global/blob/master/data/lib/core/quests.lua)

