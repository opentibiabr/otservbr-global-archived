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
* [Forum](https://forums.otserv.com.br) OTBR Project 

* [Forum](https://otland.net/) TFS Project 

## File changes:
Added: (A)<br>
Deleted: (D)<br>
Modified: (M)<br>

#### src/
#### .cpp archives
* (A) - New Autoloot System for Modal (tag "//Autoloot" at the source)

* (A) - Two new values to enums MESSAGE_LOOT and MAX_LOOTCHANCE

* (A) New anti-wipe exhaust functions:
game.cpp - Can't move item very fast
game.cpp - Can't look very fast
game.cpp - Can't speak very fast

* (A) News lua system from TFS
- [2558](https://github.com/otland/forgottenserver/commit/62dac47c01610f652a5d792d4c9e06f4f0febefa)
- [2571](https://github.com/otland/forgottenserver/commit/38bfbb2624ae2ed347791a0b3e955bad35c22d4a)

* (A) spells.cpp - New function that prevents crash

* (A) actions.cpp - Reward Chest

* (A) container.cpp - News Function getTopParentContainer and getContainerHoldingCount

* (A) game.cpp - News Function searchForItem (from TFS)

* (A) game.cpp - News Function playerEquipItem (from TFS)

* (A) inbox.cpp 
- News Function setMaxInboxItem (prevent crash from mail)
- getTopParent (prevent crash from mail)

* (A) items.cpp - News Function builInventoryList(from TFS)


* (A) luascript.cpp - News Function getPreyMonsters

* (A) protocolgame.cpp - Cannot login using OTC (because can use OTC for inject bytes and generate crashs)

* (A) tile.cpp - New Function getWeight (prevent to drag items too heavy)

* (M) - optization in the getWorldLight function (from TFS)

* (M) map.cpp - Optimizations

* (M) vocations.cpp - Mana calcule revision (from TFS)

* (D) groups.cpp - Moved flags to groups.xml

* (D) luascript.cpp - Moved getCreatureCondition and getPlayerFlagValue to compat.lua

* (D) party.cpp - broadcastPartyLoot

#### .h archives
* (A) - luaContainerGetContentDescription
* (A) - luaContainerGetCorpseOwner

* (A) const.h - News Effects

* (D) - broadcastPartyLoot

#### actions/
#### .xml archives
* (D) Moved spellbooks to new lua system from TFS: data/scripts/actions/spellbook.lua

* (A) New spellbook.lua in data/scripts/actions/spellbook.lua

#### .lua archives
* Example

#### creaturescripts/
#### .xml archives
* Example

#### .lua archives
* Example

#### events/
#### .xml archives
* (A) - function onStorageUpdate 
* (A) - function onUseWeapon 
* (A) - function onCombatSpell 

#### .lua archives

#### globalevents/
#### .xml archives
* Example

#### .lua archives
* Example

#### lib/
#### .lua archives
* (A) 
- Party moved to .lua core (Feature from TFS)
- Added a new function to party class called broadcastPartyLoot (based on sources)
Archives: core/core.lua and core/party.lua

* (A) - News functions to the system for lua added in compat.lua

* (A) - getCreatureCondition and getPlayerFlagValue moved to compat.lua

#### monsters/
#### .xml archives



#### .lua archives
* (A) - New system monster in lua at "data/scripts/monsters/example.lua"

* (A) - New system monster event in lua at "data/scripts/monsters/events/example.lua"

* (M) - Moved monsters of Ferumbras Ascendant Quest to "monsters/quests/ferumbras ascendant/"

#### movements/
#### .xml archives
* Example

#### .lua archives
* Example

#### npc/
#### .xml archives
* Example

#### .lua archives
* Example
#### 
spells/
#### .xml archives
* Example

#### .lua archives
* Example

#### talkactions/
#### .xml archives
* (D) - Deleted script from talkaction: position.lua (moved for new lua system)

#### .lua archives
* (A) - New system talkaction in lua at data/scripts/talkaction/position.lua

#### weapons/
#### .xml archives
* Example

#### .lua archives
* (A) - New system weapons in lua at data/scripts/weapons/example.lua

#### XML/
#### .xml archives
* Example
