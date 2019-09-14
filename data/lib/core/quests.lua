if not Quests then
	Quests = {
		[1] = {
			name = "The Explorer Society", startstorageid = Storage.ExplorerSociety.QuestLine, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Joining the Explorers", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 1, endvalue = 4,
					states = {
						[1] = "The mission should be simple to fulfil. You have to seek out Uzgod in Kazordoon and get the pickaxe for us. Or just find dwarven pickaxe on your own...",
						[2] = "Get into Dwacatra and bring family brooch back to Uzgod.",
						[3] = "Bring the pickaxe back to the Explorer Society representative.",
					},

				},

				[2] = {
					name = "The Ice Delivery", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 5, endvalue = 7,
					states = {
						[5] = "Take this ice pick and use it on a block of ice in the caves beneath Folda. Get some ice and bring it here as fast as you can. If the ice melt away, report on your ice delivery mission anyway.",
						[6] = "You have 10 minutes before the icicle defrosts. Run back to the Explorer Society representative!",
					},

				},

				[3] = {
					name = "The Butterfly Hunt", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 8, endvalue = 16,
					states = {
						[8] = "This preparation kit will allow you to collect a PURPLE butterfly you have killed. Just use it on the fresh corpse of a PURPLE butterfly.",
						[9] = "Return the prepared butterfly to Explorer Society representative.",
						[10] = "Ask for another butterfly hunt.",
						[11] = "This preparation kit will allow you to collect a BLUE butterfly you have killed. Just use it on the fresh corpse of a BLUE butterfly.",
						[12] = "Return the prepared butterfly to Explorer Society representative.",
						[13] = "Ask for another butterfly hunt.",
						[14] = "This preparation kit will allow you to collect a RED butterfly you have killed. Just use it on the fresh corpse of a RED butterfly.",
						[15] = "Return the prepared butterfly to Explorer Society representative.",
					},

				},

				[4] = {
					name = "The Plant Collection", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 17, endvalue = 26,
					states = {
						[17] = "Take botanist's container. Use it on a jungle bells plant to collect a sample.",
						[18] = "Report about your plant collection to Explorer Society representative.",
						[19] = "Ask for plant collection when you are ready to continue.",
						[20] = "Use botanist's container on a witches cauldron to collect a sample.",
						[21] = "Report about your plant collection to Explorer Society representative.",
						[22] = "Ask for plant collection when you are ready to continue.",
						[23] = "Use this botanist's container on a giant jungle rose to obtain a sample.",
						[24] = "Report about your plant collection to Explorer Society representative.",
					},

				},

				[5] = {
					name = "The Lizard Urn", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 27, endvalue = 29,
					states = {
						[27] = "In the south-east of Tiquanda is a small settlement of the lizard people. Beneath the newly constructed temple there, the lizards hide the urn. Acquire an ancient urn which is some sort of relic to the lizard people of Tiquanda.",
						[28] = "Bring the Funeral Urn back to the Explorer Society.",
					},

				},

				[6] = {
					name = "The Bonelord Secret", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 30, endvalue = 32,
					states = {
						[30] = "Travel to the city of Darashia and then head north-east for the pyramid. If any documents are left, you probably find them in the catacombs beneath.",
						[31] = "Bring the Wrinkled Parchment back to the Explorer Society representative.",
					},

				},

				[7] = {
					name = "The Orc Powder", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 33, endvalue = 35,
					states = {
						[33] = "As far as we can tell, the orcs maintain some sort of training facility in some hill in the north-east of their city. There you should find lots of their war wolves and hopefully also some of the orcish powder.",
						[34] = "Bring the Strange Powder to the Explorer Society representative to complete your mission.",
					},

				},

				[8] = {
					name = "The Elven Poetry", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 36, endvalue = 38,
					states = {
						[36] = "This mission is easy but nonetheless vital. Travel Hellgate beneath Ab'Dendriel and get the book.",
						[37] = "Bring back an elven poetry book to the Explorer Society representative.",
					},

				},

				[9] = {
					name = "The Memory Stone", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 39, endvalue = 41,
					states = {
						[39] = "In the ruins of north-western Edron you should be able to find a memory stone. ",
						[40] = "Bring back a memory stone to the Explorer Society representative.",
					},

				},

				[10] = {
					name = "The Rune Writings", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 42, endvalue = 47,
					states = {
						[42] = "Somewhere under the ape infested city of Banuta, one can find dungeons that were once inhabited by lizards. Look there for an atypical structure that would rather fit to Ankrahmun and its Ankrahmun Tombs. Copy the runes you will find on this structure.",
						[43] = "Report back to the Explorer Society representative.",
					},

				},

				[11] = {
					name = "The Ectoplasm", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 45, endvalue = 47,
					states = {
						[45] = "Take ectoplasm container and use it on a ghost that was recently slain.",
						[46] = "Return back to the Explorer Society representative with the collected ectoplasm.",
					},

				},

				[12] = {
					name = "The Spectral Dress", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 48, endvalue = 50,
					states = {
						[48] = "The queen of the banshees lives in the so called Ghostlands, south west of Carlin. Try to get a spectral dress from her.",
						[49] = "Report to the Explorer Society with the spectral dress.",
					},

				},

				[13] = {
					name = "The Spectral Stone", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 51, endvalue = 55,
					states = {
						[51] = "Please travel to our second base and ask them to mail us their latest research reports. Then return here and ask about new missions.",
						[52] = "Tell our fellow explorer that the papers are in the mail already.",
						[53] = "Take the spectral essence and use it on the strange carving in this building as well as on the corresponding tile in our second base.",
						[54] = "Good! Now use the spectral essence on the strange carving in our second base.",
					},

				},

				[14] = {
					name = "The Astral Portals", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 56, endvalue = 56,
					states = {
						[56] = "Both carvings are now charged and harmonised. You are able to travel in zero time from one base to the other, but you need to have an orichalcum pearl in your possession to use it as power source.",
					},

				},

				[15] = {
					name = "The Island of Dragons", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 57, endvalue = 58,
					states = {
						[57] = "Travel to Okolnir and try to find a proof for the existence of dragon lords there in the old times. I think old Buddel might be able to bring you there.",
						[58] = "Report back to Lurik with the dragon scale.",
					},

				},

				[16] = {
					name = "The Ice Music", storageid = Storage.ExplorerSociety.QuestLine, startvalue = 60, endvalue = 61,
					states = {
						[60] = "There is a cave on Hrodmir, north of the southernmost barbarian camp Krimhorn. In this cave, there are a waterfall and a lot of stalagmites. Take the resonance crystal and use it on the stalagmites in the cave to record the sound of the wind.",
						[61] = "Report back to Lurik.",
						[62] = "Now you may use the Astral Bridge from Liberty Bay to Svargrond.",
					},

				},

				[17] = {
					name = "The Undersea Kingdom", storageid = Storage.ExplorerSociety.CalassaQuest, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Captain Max will bring you to Calassa whenever you are ready. Please try to retrieve the missing logbook which must be in one of the sunken shipwrecks.",
						[2] = "Report about your Calassa mission to Berenice in Liberty Bay.",
					},

				},

			},
		},

		[2] = {
			name = "Spirithunters Quest", startstorageid = Storage.spiritHuntersQuest.missionUm, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Method", storageid = Storage.spiritHuntersQuest.missionUm, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Use the item on the tombstones.",
						[2] = "You have used these item in the tombstones.",
					},

				},

				[2] = {
					name = "First Mission", storageid = Storage.spiritHuntersQuest.missionUm, startvalue = 2, endvalue = 4,
					states = {
						[3] = "Talk to Sinclair and take the ghost residue.",
						[4] = "You got the ghost waste.",
					},

				},

				[3] = {
					name = "Second Mission", storageid = Storage.spiritHuntersQuest.missionUm, startvalue = 4, endvalue = 6,
					states = {
						[5] = "You need to get more samples of ghosts.",
						[6] = "You got all the ghost scraps.",
					},

				},

			},
		},

		[3] = {
			name = "Spike Task", startstorageid = Storage.SpikeTaskQuest.QuestLine, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "First Task", storageid = Storage.SpikeTaskQuest.Gnomilly, startvalue = 0, endvalue = 100, description = function(player)return string.format("You have %d points of task. You need 100 points to take Cave Explorer outfit.", (math.max(player:getStorageValue(Storage.SpikeTaskQuest.Gnomilly), 0))) end,
				},

				[2] = {
					name = "Second Task", storageid = Storage.SpikeTaskQuest.Gnombold.Points, startvalue = 0, endvalue = 100, description = function(player)return string.format("You have %d points of task. You need 100 points to take first addon.", (math.max(player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Points), 0))) end,
				},

				[3] = {
					name = "Third Task", storageid = Storage.SpikeTaskQuest.Gnomargery.Points, startvalue = 0, endvalue = 100, description = function(player)return string.format("You have %d points of task. You need 100 points to take second addon.", (math.max(player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Points), 0))) end,
				},

			},
		},

		[4] = {
			name = "A Father's Burden", startstorageid = Storage.FathersBurdenQuest.QuestLog, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "The Birthday Presents", storageid = Storage.FathersBurdenQuest.Status, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Gather the material Tereban listed. Talk to him about your mission when you have given him everything he was looking for.",
						[2] = "You brought all the required materials to Tereban and guaranteed his sons a great birthday party.",
					},

				},

				[2] = {
					name = "The Magic Bow - Sinew", storageid = Storage.FathersBurdenQuest.Sinew, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find the wyvern Heoni in the Edron mountains and take his sinew to Tereban.",
						[2] = "You delivered Heoni's sinew to Tereban.",
					},

				},

				[3] = {
					name = "The Magic Bow - Wood", storageid = Storage.FathersBurdenQuest.Wood, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find the special wood in the barbarian camps of Hrodmir and bring it to Tereban. It might be a good idea to start looking in the northernmost camp.",
						[2] = "You delivered the Wood to Tereban.",
					},

				},

				[4] = {
					name = "The Magic Robe - Cloth", storageid = Storage.FathersBurdenQuest.Cloth, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find the spectral cloth hidden deep in the crypts of the isle of the kings and bring it to Tereban. You might have to look for a secret entrance.",
						[2] = "You delivered the spectral cloth to Tereban.",
					},

				},

				[5] = {
					name = "The Magic Robe - Silk", storageid = Storage.FathersBurdenQuest.Silk, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find exquisite silk in the spider caves of southern Zao and deliver it to Tereban.",
						[2] = "You brought Tereban the required silk.",
					},

				},

				[6] = {
					name = "The Magic Rod - Crystal", storageid = Storage.FathersBurdenQuest.Crystal, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find a magic crystal in the tomb buried under the sand east of Ankrahmun and bring it to Tereban.",
						[2] = "Tereban received the magic crystal he was looking for.",
					},

				},

				[7] = {
					name = "The Magic Rod - Root", storageid = Storage.FathersBurdenQuest.Root, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find the mystic root under the city of Banuta and bring it to Tereban.",
						[2] = "The magic root was delievered to Tereban.",
					},

				},

				[8] = {
					name = "The Magic Shield - Iron", storageid = Storage.FathersBurdenQuest.Iron, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find some old iron in the mines of Kazordoon for Tereban. Don't get lost - start searching close to the city.",
						[2] = "Tereban got the old iron he required.",
					},

				},

				[9] = {
					name = "The Magic Shield - Scale", storageid = Storage.FathersBurdenQuest.Scale, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find the dragon Glitterscale in the caves north of Thais and take its scale to Tereban.",
						[2] = "You handed the looted scale to Tereban.",
					},

				},

			},
		},

		[5] = {
			name = "Bigfoot's Burden", startstorageid = Storage.BigfootBurden.QuestLine, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Looking for Gnomerik", storageid = Storage.BigfootBurden.QuestLine, startvalue = 1, endvalue = 2, description = "The dwarf Xelvar has sent you to meet the gnome Gnomerik. He can recruit you to the Bigfoot Company. Use the teleporter near Xelvar to enter the gnomish base and start looking for Gnomerik.",
				},

				[2] = {
					name = "A New Recruit", storageid = Storage.BigfootBurden.QuestLine, startvalue = 3, endvalue = 4, description = "You have found the gnomish recruiter and are ready to become a Bigfoot.",
				},

				[3] = {
					name = "Recruitment: A Test in Gnomology", storageid = Storage.BigfootBurden.QuestLine, startvalue = 5, endvalue = 7,
					states = {
						[5] = "Pass Gnomerik's test by answering his questions. If you fail to get a high enough score drink a mushroom beer and start again.",
						[6] = "You have passed the gnomish psychology test and can proceed to the medical exam. Talk to Gnomespector about your next examination.",
					},

				},

				[4] = {
					name = "Recruitment: Medical Examination", storageid = Storage.BigfootBurden.QuestLine, startvalue = 8, endvalue = 9, description = "Walk through the g-ray apparatus for your g-raying.",
				},

				[5] = {
					name = "Recruitment: Ear Examination", storageid = Storage.BigfootBurden.QuestLine, startvalue = 10, endvalue = 12,
					states = {
						[10] = "You have been g-rayed. It has been an ... unexpected experience. Now you are ready for your ear examination. Walk up to doctor Gnomedix and wait for him to finish your ear examination.",
						[11] = "You passed the ear examination. Well, at least most of you did. Now talk to Gnomaticus about your next test. ",
					},

				},

				[6] = {
					name = "Recruitment: Gnomish Warfare", storageid = Storage.BigfootBurden.Shooting, startvalue = 0, endvalue = 5, description = function(player)return string.format("Hit five targets in a row. Don't hit an innocent target as it will reset your hit counter. %d / 5", (math.max(player:getStorageValue(Storage.BigfootBurden.Shooting), 0))) end,
				},

				[7] = {
					name = "Recruitment: Gnomish Warfare", storageid = Storage.BigfootBurden.QuestLine, startvalue = 15, endvalue = 16, description = "You are now ready for your endurance test. Talk to Gnomewart about it.",
				},

				[8] = {
					name = "Recruitment: Endurance Test", storageid = Storage.BigfootBurden.QuestLine, startvalue = 17, endvalue = 20,
					states = {
						[17] = "Enter the lower chamber for your endurance test. Reach the teleporter north of the hall.",
						[18] = "You have passed the endurance test. Report back to Gnomewart.",
						[19] = "You passed the endurance test and are ready to talk to Gnomelvis about your soul melody.",
					},

				},

				[9] = {
					name = "Recruitment: Soul Melody", storageid = Storage.BigfootBurden.QuestLine, startvalue = 21, endvalue = 23,
					states = {
						[21] = "Find your personal soul melody by trial and error. Create the complete soul melody of seven notes and then report to Gnomelvis. Red notes indicate a failure.",
						[22] = "You found your very own soul melody. You should talk to Gnomelvis about it!",
					},

				},

				[10] = {
					name = "Recruitment", storageid = Storage.BigfootBurden.QuestLineComplete, startvalue = 1, endvalue = 2, description = "You are now a true member of the Bigfoot company.",
				},

				[11] = {
					name = "Gnome Reputation", storageid = Storage.BigfootBurden.Rank, startvalue = 0, endvalue = 999999, description = function(player)return string.format("Your reputation in the eyes of gnomekind is %d.\nYour standing rises at: \nReputation   30 - I \nReputation  120 - II \nReputation  480 - III \nReputation 1440 - IV \n", (math.max(player:getStorageValue(Storage.BigfootBurden.Rank), 0))) end,
				},

				[12] = {
					name = "Daily Minor: Crystal Keeper", storageid = Storage.BigfootBurden.RepairedCrystalCount, startvalue = 0, endvalue = 5, description = function(player)return string.format("Use the repair crystal to repair five damaged blue crystals in the crystal caves. Damaged crystals will not glow.\n%d / 5", (math.max(player:getStorageValue(Storage.BigfootBurden.RepairedCrystalCount), 0))) end,
				},

				[13] = {
					name = "Daily Minor: Raiders of the Lost Spark", storageid = Storage.BigfootBurden.ExtractedCount, startvalue = 0, endvalue = 7, description = function(player)return string.format("Kill crystal crushers and use the discharger item on the corpse to collect their charges. Gather 7 charges and report back. %d / 7", (math.max(player:getStorageValue(Storage.BigfootBurden.ExtractedCount), 0 ))) end,
				},

				[14] = {
					name = "Daily Minor Plus: Exterminators", storageid = Storage.BigfootBurden.ExterminatedCount, startvalue = 0, endvalue = 10, description = function(player)return string.format("Kill 10 of the wigglers for the gnomes. Then report back. %d / 10", (math.max(player:getStorageValue(Storage.BigfootBurden.ExterminatedCount), 0))) end,
				},

				[15] = {
					name = "Daily Minor Plus: Mushroom Digger", storageid = Storage.BigfootBurden.MushroomCount, startvalue = 0, endvalue = 3, description = function(player)return string.format("Find a truffle sniffing pig and lure it around. Occasionally it will unearth some truffles. Use the baby pig on the truffles to feed it 3 times. Then report back to the gnomes. %d / 3", (math.max(player:getStorageValue(Storage.BigfootBurden.MushroomCount), 0))) end,
				},

				[16] = {
					name = "Daily Major: Matchmaker", storageid = Storage.BigfootBurden.MatchmakerStatus, startvalue = 0, endvalue = 1,
					states = {
						[0] = "You have to enter the crystal caves and find a crystal that is fitting the crystal you got from the gnomes. Use the crystal on one of the bigger red crystals in the caves to bond them.",
						[1] = "You have finished this quest for now.",
					},

				},

				[17] = {
					name = "Daily Major: The Tinker's Bell", storageid = Storage.BigfootBurden.GolemCount, startvalue = 0, endvalue = 4, description = function(player)return string.format("Use the harmonic bell on the mad golems in the golem workshop so that they will automatically be teleported to the gnomish workshops. Then report back to the gnomes. %d / 4", (math.max(player:getStorageValue(Storage.BigfootBurden.GolemCount), 0))) end,
				},

				[18] = {
					name = "Daily Major Advanced: Spores", storageid = Storage.BigfootBurden.SporeCount, startvalue = 0, endvalue = 4, description = "Gather spores in the correct order. Your spore gathering list will display the next color you have to look for.",
				},

				[19] = {
					name = "Daily Major Advanced: Yet Another Grinding", storageid = Storage.BigfootBurden.GrindstoneStatus, startvalue = 0, endvalue = 2, description = "Gather a grindstone from the lava area en report back.",
				},

				[20] = {
					name = "Gnomish War Hero (Warzone 1)", storageid = Storage.BigfootBurden.Warzone1Access, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Deliver the Deathstrike's snippet to gnomission to enter the first warzone for free.",
						[2] = "You may enter the first warzone without using a mission crystal.",
					},

				},

				[21] = {
					name = "Gnomish War Hero (Warzone 2)", storageid = Storage.BigfootBurden.Warzone2Access, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Deliver the Gnomevil's hat to gnomission to enter the second warzone for free.",
						[2] = "You may enter the second warzone without using a mission crystal.",
					},

				},

				[22] = {
					name = "Gnomish War Hero (Warzone 3)", storageid = Storage.BigfootBurden.Warzone3Access, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Deliver the Abyssador's lash to gnomission to enter the third warzone for free.",
						[2] = "You may enter the third warzone without using a mission crystal.",
					},

				},

			},
		},

		[6] = {
			name = "Barbarian Test Quest", startstorageid = Storage.BarbarianTest.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Barbarian Test 1: Barbarian Booze", storageid = Storage.BarbarianTest.Mission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Talk to Sven about mead and give him a honeycomb. For each honeycomb you will be allowed 20 sips.",
						[2] = "Now drink from the bucket until you drink 10 sips in a row without passing out",
						[3] = "You have completed this Test! Talk to Sven about the mead.",
					},

				},

				[2] = {
					name = "Barbarian Test 2: The Bear Hugging", storageid = Storage.BarbarianTest.Mission02, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Sven gave you a Mead Horn. Fill it with mead from the bucket behind Sven (brown contents) and then proceed to the sleeping bear. The bear is inside a small ice cave in the north. Use the full mead horn on the bear so it becomes unconscious, then use the bear to hug it.",
						[2] = "You hugging the bear! Go tell Sven that you hugged the bear!",
						[3] = "You have completed this Test!",
					},

				},

				[3] = {
					name = "Barbarian Test 3: The Mammoth Pushing", storageid = Storage.BarbarianTest.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Go to the north-west of Svargrond and find the Mammoth. Drink your three mugs of mead, stand in front of the Mammoth and push it. Just use it...",
						[2] = "You pushed the Mammoth! Go tell Sven that you pushed the Mammoth!",
						[3] = "You have completed this Test! You can now be a citizen of Svargrond!",
					},

				},

			},
		},

		[7] = {
			name = "Children of the Revolution", startstorageid = Storage.ChildrenoftheRevolution.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Prove Your Worzz!", storageid = Storage.ChildrenoftheRevolution.Mission00, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your Mission is to go to a little camp of lizards at north-east of the Dragonblaze Peaks. You have to find and deliver the Tactical map complete the mission.",
						[2] = "You delivered the Tactical map to Zalamon.",
					},

				},

				[2] = {
					name = "Mission 1: Corruption", storageid = Storage.ChildrenoftheRevolution.Mission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Go to the Temple of Equilibrium (it's marked on your map) and find out what happened there.",
						[2] = "The temple has been corrupted and is lost. Zalamon should be informed about this as soon as possible.",
						[3] = "You already reported Zalamon about the Temple! Ask him for new mission!",
					},

				},

				[3] = {
					name = "Mission 2: Imperial Zzecret Weaponzz", storageid = Storage.ChildrenoftheRevolution.Mission02, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Go into the small camp Chaochai to the north of the Dragonblaze Peaks (Zalamon marks the entrance on your map). There are 3 buildings which you have to spy",
						[2] = "You spied 1 of 3 buildings of the camp.",
						[3] = "You spied 2 of 3 buildings of the camp.",
						[4] = "You spied 3 of 3 buildings of the camp. Zalamon should be informed about this as soon as possible.",
						[5] = "You already reported Zalamon about the camp! Ask him for new mission!",
					},

				},

				[4] = {
					name = "Mission 3: Zee Killing Fieldzz", storageid = Storage.ChildrenoftheRevolution.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Get the poison from Zalamon's storage room. Then go to the teleporter to the Muggy Plains and head east from there to the rice fields. Go to the very top rice field and use the poison anywhere on the water.",
						[2] = "The rice has been poisoned. This will weaken the Emperor's army significantly. Return and tell Zalamon about your success.",
						[3] = "You already reported Zalamon about your success! Ask him for new mission!",
					},

				},

				[5] = {
					name = "Mission 4: Zze Way of Zztonezz", storageid = Storage.ChildrenoftheRevolution.Mission04, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Your mission is to find a way to enter the north of the valley and find a passage to the great gate itself. Search any temples or settlements you come across for hidden passages.",
						[2] = "Report Zalamon about the strange symbols that you found.",
						[3] = "Get the greasy oil from Zalamon's storage room and put them on the levers that you found.",
						[4] = "Due to being extra greasy, the leavers can now be moved.",
						[5] = "You found the right combination for the puzzle in the mountains and triggered some kind of mechanism. You should head back to Zalamon to report your success.",
						[6] = "You already reported Zalamon about your success! You got a Tome of Knowledge as reward! Ask him for new mission!",
					},

				},

				[6] = {
					name = "Mission 5: Phantom Army", storageid = Storage.ChildrenoftheRevolution.Mission05, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your mission is to use the portal in the chamber beyond the mechanism. It will lead you to the great gate.",
						[2] = "Eternal guardians and lizard chosen has been awaken. Survive them and report it to Zalamon!",
						[3] = "You Survived the Waves and reported Zalamon about your success! You got a Serpent Crest as reward!",
					},

				},

			},
		},

		[8] = {
			name = "Factions", startstorageid = Storage.Factions, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "The Marid and the Efreet - Djinn Greeting", storageid = Storage.DjinnWar.Faction.Greeting, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Melchior told you the word &quot;Djanni'hah&quot; which can be used to talk to Djinns. Be aware that once you become an ally of one Djinn race, you cannot switch sides anymore.",
						[2] = "",
					},

				},

				[2] = {
					name = "The Marid and the Efreet - Marid Faction", storageid = Storage.DjinnWar.Faction.Marid, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You have joined the Marid. These friendly, blue Djinns are honest and fair allies. You have pledged eternal loyalty to King Gabel and may enter Asha'daramai freely. Djanni'hah!",
						[2] = "",
					},

				},

				[3] = {
					name = "The Efreet and the Efreet - Efreet Faction", storageid = Storage.DjinnWar.Faction.Efreet, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You have joined the Efreet. These evil, green Djinns are always up to mischievous pranks. You have pledged eternal loyalty to King Malor and may enter Mal'ouquah freely. Djanni'hah!",
						[2] = "",
					},

				},

			},
		},

		[9] = {
			name = "Friends and Traders", startstorageid = Storage.FriendsandTraders.DefaultStart, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "The Sweaty Cyclops", storageid = Storage.FriendsandTraders.TheSweatyCyclops, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Big Ben, the cyclops in Ab'Dendriel sends you to bring him 3 bast skirts for his woman. After this he will help you to forge different steel.",
						[2] = "Big Ben, the cyclops in Ab'Dendriel will help you to forge different steel now. Just ask him if you need something.",
					},

				},

				[2] = {
					name = "The Mermaid Marina", storageid = Storage.FriendsandTraders.TheMermaidMarina, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Marina, the mermaid north of Sabrehaven sends you to bring her 50 honeycombs. After this she will help you create spool of yarn.",
						[2] = "Marina, the mermaid north of Sabrehaven will help you to create a spool of yarn from 10 pieces of spider silk. Just ask her if you need something.",
					},

				},

				[3] = {
					name = "The Blessed Stake", storageid = Storage.FriendsandTraders.TheBlessedStake, startvalue = 1, endvalue = 12,
					states = {
						[1] = "Quentin told you about an old prayer which can bind holy energy to an object. Each of its ten lines has to be recited by a different priest though. Bring Quentin a wooden stake from Gamon to start.",
						[2] = "You received Quentin's prayer: &quot;Light shall be near - and darkness afar&quot;. Now, bring your stake to Tibra in the Carlin church for the next line of the prayer.",
						[3] = "You received Tibra's prayer: &quot;Hope may fill your heart - doubt shall be banned&quot;. Now, bring your stake to Maealil in the Elven settlement for the next line of the prayer.",
						[4] = "You received Maealil's prayer: &quot;Peace may fill your soul - evil shall be cleansed&quot;. Now, bring your stake to Yberius in the Venore temple for the next line of the prayer.",
						[5] = "You received Yberius' prayer: &quot;Protection will be granted - from dangers at hand&quot;. Now, bring your stake to Isimov in the dwarven settlement for the next line of the prayer.",
						[6] = "You received Isimov's prayer: &quot;Unclean spirits shall be repelled&quot;. Now, bring your stake to Amanda in Edron for the next line of the prayer.",
						[7] = "You received Amanda's prayer: &quot;Wicked curses shall be broken&quot;. Now, bring your stake to Kasmir in Darashia for the next line of the prayer.",
						[8] = "You received Kasmir's prayer: &quot;Let there be honour and humility&quot;. Now, bring your stake to Rahkem in Ankrahmun for the next line of the prayer.",
						[9] = "You received Rahkem's prayer: &quot;Let there be power and compassion&quot;. Now, bring your stake to Brewster in Port Hope for the next line of the prayer.",
						[10] = "You received Brewster's prayer: &quot;Your hand shall be guided - your feet shall walk in harmony&quot;. Now, bring your stake to Tyrias in Liberty Bay for the next line of the prayer.",
						[11] = "You received Tyrias' prayer: &quot;Your mind shall be a vessel for joy, light and wisdom&quot;. He wasn't exactly happy though and said that if you need some mumbo jumbo again, you should rather go to Chondur.",
						[12] = "Chondur was surprised to hear that you had to travel through all of Tibia to have your wooden stake blessed. He offered you help with the blessing if you should need one again in the future.",
					},

				},

			},
		},

		[10] = {
			name = "Hot Cuisine", startstorageid = Storage.HotCuisineQuest.QuestStart, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Hot Cuisine", storageid = Storage.HotCuisineQuest.QuestLog, startvalue = 1, endvalue = 16,
					states = {
						[1] = "You've become the apprentice of Maltre Jean Pierre. The first dish he will teach you to prepare is Rotworm Stew. Bring him the ingredients he told you.",
						[2] = "You have completed the first dish, the second dish he will teach you to prepare is Hydra Tongue Salad. Bring him the ingredients he told you.",
						[3] = "You have completed the second dish, the third dish he will teach you to prepare is Roasted Dragon Wings. Bring him the ingredients he told you.",
						[4] = "You have completed the third dish, the fourth dish he will teach you to prepare is Tropical Fried Terrorbird. Bring him the ingredients he told you.",
						[5] = "You have completed the fourth dish, the fifth dish he will teach you to prepare is Banana Chocolate Shake. Bring him the ingredients he told you.",
						[6] = "You have completed the fifth dish, the sixth dish he will teach you to prepare is Veggie Casserole. Bring him the ingredients he told you.",
						[7] = "You have completed the sixth dish, the seventh dish he will teach you to prepare is Filled Jalapeno Peppers. Bring him the ingredients he told you.",
						[8] = "You have completed the seventh dish, the eight dish he will teach you to prepare is Blessed Steak. Bring him the ingredients he told you.",
						[9] = "You have completed the eight dish, the ninth dish he will teach you to prepare is Northern Fishburger. Bring him the ingredients he told you.",
						[10] = "You have completed the ninth dish, the tenth dish he will teach you to prepare is Carrot Cake. Bring him the ingredients he told you.",
						[11] = "You have completed the tenth dish. You are now able to obtain the cookbook from Jean Pierre's room upstairs.",
						[12] = "The eleventh dish he will teach you to prepare is Coconut Shrimp Bake. Bring him the ingredients he told you.",
						[13] = "You have completed the eleventh dish, the twelfth dish he will teach you to prepare is Blackjack. Bring him the ingredients he told you.",
						[14] = "You have completed the twelfth dish, the thirteenth dish he will teach you to prepare is Demonic Candy Balls. Bring him the ingredients he told you.",
						[15] = "You have completed the thirteenth dish, the fourteenth dish he will teach you to prepare is Sweet Mangonaise Elixir. Bring him the ingredients he told you.",
						[16] = "You have completed all the dishes. You are now able to make all the dishes in any order you want.",
					},

				},

			},
		},

		[11] = {
			name = "In Service of Yalahar", startstorageid = Storage.InServiceofYalahar.Questline, startstoragevalue = 5,
			missions = {
				[1] = {
					name = "Mission 01: Something Rotten", storageid = Storage.InServiceofYalahar.Mission01, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Palimuth asked you to help with some sewer malfunctions. You will need a Crowbar, there are 4 places where you need to go marked with an X on your map.",
						[2] = "You cleaned 1 pipe of 4 from the garbage.",
						[3] = "You cleaned 2 pipes of 4 from the garbage.",
						[4] = "You cleaned 3 pipes of 4 from the garbage.",
						[5] = "You cleaned 4 pipes of 4 from the garbage. Go back to Palimuth and report your mission",
						[6] = "You cleaned all pipes from the garbage! Go back to Palimuth and ask for mission.",
					},

				},

				[2] = {
					name = "Mission 02: Watching the Watchmen", storageid = Storage.InServiceofYalahar.Mission02, startvalue = 1, endvalue = 8,
					states = {
						[1] = "You have to find all 7 guards and give a report to them. You should start by Foreign Quarter or by Trade Quarter and follow the order of the path..",
						[2] = "You reported to 1 of 7 guards",
						[3] = "You reported to 2 of 7 guards",
						[4] = "You reported to 3 of 7 guards",
						[5] = "You reported to 4 of 7 guards",
						[6] = "You reported to 5 of 7 guards",
						[7] = "You reported to 6 of 7 guards",
						[8] = "You reported to 7 of 7 guards! Go back to Palimuth and ask for mission.",
					},

				},

				[3] = {
					name = "Mission 03: Death to the Deathbringer", storageid = Storage.InServiceofYalahar.Mission03, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Get the notes in Palimuths room and read them. Talk to Palimuth again when you've read the notes.",
						[2] = "Talk to Azerus the Yalahari in the city centre to get your next mission.",
						[3] = "Get the notes behind the Yalahari and read them. Talk to Azerus again and ask him for mission when you've read the notes.",
						[4] = "Ask Palimuth for mission.",
						[5] = "First you will need to kill the three plague bearers and then get The Alchemists' Formulas. When this have been done head back to either Palimuth (good side) or Yalahari (Azerus) (bad side).",
						[6] = "Ask Azerus the Yalahari for a mission.",
					},

				},

				[4] = {
					name = "Mission 04: Good to be Kingpin", storageid = Storage.InServiceofYalahar.Mission04, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Ask Palimuth for mission.",
						[2] = "For this mission you are asked to go to the Trade Quarter and negotiate or threaten Mr. West. Once again you will gain access to the mechanism although if you choose to help Palimuth you should go through the sewers.",
						[3] = "You decided to help Palimuth, report him your mission.",
						[4] = "You decided to help Azerus, report him your mission. ",
						[5] = "Get back to Azerus and report him your mission.",
						[6] = "Ask Azerus for a mission.",
					},

				},

				[5] = {
					name = "Mission 05: Food or Fight", storageid = Storage.InServiceofYalahar.Mission05, startvalue = 1, endvalue = 8,
					states = {
						[1] = "Ask Palimuth for mission.",
						[2] = "On this mission you are asked to find a druid by the name of Tamerin, on the Arena Quarter. You now have permission to use the gates mechanism.",
						[3] = "The first is to bring Tamerin a flask of Animal Cure, you can buy this from Siflind on Nibelor (northeast of Svargrond).",
						[4] = "now you have to kill Morik the Gladiator and bring his helmet to Tamerin as proof.",
						[5] = "Report back to Tamerin as he will listen to your request and you can now make your choice: Cattle for Palimuth (good side), Warbeasts for Yalahari (Azerus) (bad side). Then report the one you decided your mission.",
						[6] = "You decided to help Palimuth, report him your mission.",
						[7] = "You decided to help Azerus, report him your mission.",
						[8] = "Ask Azerus for a mission.",
					},

				},

				[6] = {
					name = "Mission 06: Frightening Fuel", storageid = Storage.InServiceofYalahar.Mission06, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Ask Palimuth for mission.",
						[2] = "Yalahari (Azerus) orders you to travel to the Cemetery Quarter and find the Strange Carving. He gives you a Ghost Charm and tells you to charge it with the tormented souls of the ghosts there to be used as an energy source. Palimuth wants the Charged Ghost Charm in order to free those souls. You can new use the Cemetery Quarter mechanism now. Go to the big building in the Cemetery Quarter and use the Ghost Charm on the Strange Carving at the back of the room.",
						[3] = "Good side: Go to Palimuth, ask him about your mission, and hand in the charm. Bad side: Ask about your mission to Yalahari (Azerus) and give it back.",
						[4] = "Get back to Azerus and report him your mission.",
						[5] = "Ask Azerus for a mission.",
					},

				},

				[7] = {
					name = "Mission 07: A Fishy Mission", storageid = Storage.InServiceofYalahar.Mission07, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Ask Palimuth for mission.",
						[2] = "Bad side: Yalahari (Azerus) will send you for a new mission to go to the Sunken Quarter and kill the Quara Leaders, Inky, Splasher and Sharptooth. Good side: Rather than fighting any Quara leaders Palimuth will instead send you to find the cause for the Quaras aggressive behavior. Find Maritima and talk to her about the Quara and she will explain what their problem is.",
						[3] = "Get back to Palimuth and report him your mission.",
						[4] = "You killed the Quarabosses. Ask Azerus for a mission.",
						[5] = "Ask Azerus for a mission.",
					},

				},

				[8] = {
					name = "Mission 08: Dangerous Machinations", storageid = Storage.InServiceofYalahar.Mission08, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Ask Palimuth for mission.",
						[2] = "Bad side: For this mission the Yalahari requests you go to the Factory Quarter and find a pattern crystal, which will be used to supply weapons to help take control of the city. Good side: Palimuth will send you there to use the crystal to supply food for the city.",
						[3] = "Get back to Azerus and report him your mission.",
						[4] = "Ask Azerus for a mission.",
					},

				},

				[9] = {
					name = "Mission 09: Decision", storageid = Storage.InServiceofYalahar.Mission09, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You now need to decide between supporting Palimuth or the Yalahari's goal. To choose Palimuth's good side go to him, and simply ask him for a mission mission. Likewise, to join the Yalahari (Azerus) (bad side) go to him and say the same.",
						[2] = "you already decided!",
					},

				},

				[10] = {
					name = "Mission 10: The Final Battle", storageid = Storage.InServiceofYalahar.Mission10, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Palimuth told you that a circle of Yalahari is planning some kind of ritual. They plan to create a portal for some powerful demons and to unleash them in the city to 'purge' it once and for all.",
						[2] = "The entrance to their inner sanctum has been opened for you. Be prepared for a HARD battle! Better gather some friends to assist you.",
						[3] = "Report back to whichever principal you have chosen to help and you will receive Yalaharian Outfits.",
						[4] = "You got the access to the reward room. Choose carefully which reward you pick as you can only take one item.",
						[5] = "You have completed the Quest!",
					},

				},

			},
		},

		[12] = {
			name = "Killing in the Name of...", startstorageid = 100157, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Paw and Fur: Member", storageid = 2500, startvalue = 0, endvalue = 10, description = function(player)return string.format("You are member of the Paw and Fur hunting elite. You currently have %d Paw and Fur points.", (math.max(player:getStorageValue(2500), 0))) end,
				},

				[2] = {
					name = "Paw and Fur: Ranger", storageid = 2500, startvalue = 11, endvalue = 40, description = function(player)return string.format("You are Ranger of the Paw and Fur hunting elite. You currently have %d Paw and Fur points.", (math.max(player:getStorageValue(2500), 0))) end,
				},

				[3] = {
					name = "Paw and Fur: Big Game Hunter", storageid = 2500, startvalue = 41, endvalue = 69, description = function(player)return string.format("You are Big Game Hunter in the Paw and Fur hunting elite. You currently have %d Paw and Fur points.", (math.max(player:getStorageValue(2500), 0))) end,
				},

				[4] = {
					name = "Paw and Fur: Trophy Hunter", storageid = 2500, startvalue = 70, endvalue = 99, description = function(player)return string.format("You are Trophy Hunter in the Paw and Fur hunting elite. You currently have %d Paw and Fur points. Ask Grizzly Adams for 'special task' he might have something for you.", (math.max(player:getStorageValue(2500), 0))) end,
				},

				[5] = {
					name = "Paw and Fur: Elite Hunter", storageid = 2500, startvalue = 100, endvalue = 9999, description = function(player)return string.format("You have obtained the highest possible rank in the Paw and Fur hunting elite, you are Elite Hunter. You currently have %d Paw and Fur points. Ask Grizzly Adams for 'special task' he might have something for you.", (math.max(player:getStorageValue(2500), 0))) end,
				},

				[6] = {
					name = "Paw and Fur: Tiquandas Revenge", storageid = Storage.KillingInTheNameOf.TiquandasRevengeTeleport, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Grizzly Adams told you that there is Tiquandas Revenge hiding somewhere in the jungle of Port Hope. Go find its hideout and kill it.",
						[2] = "You have slained the Tiquandas Revenge.",
					},

				},

				[7] = {
					name = "Paw and Fur: Demodras", storageid = Storage.KillingInTheNameOf.DemodrasTeleport, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Grizzly Adams wanted you to go look for Demodras'  hideout. He also mentioned that it might be somewhere under the Plains of Havoc.",
						[2] = "You have slained the Demodras.",
					},

				},

				[8] = {
					name = "Paw and Fur: The Snapper", storageid = 34100, startvalue = 1, endvalue = 2, description = "Grizzly told you about the Snapper, a crocodile that already killed many citizens of Port Hope. Try find its hideout and kill it.",
				},

				[9] = {
					name = "Paw and Fur: Hide", storageid = 34101, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[10] = {
					name = "Paw and Fur: Deathbine", storageid = 34102, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[11] = {
					name = "Paw and Fur: The Bloodtusk", storageid = 34103, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[12] = {
					name = "Paw and Fur: Shardhead", storageid = 34104, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[13] = {
					name = "Paw and Fur: Esmerelda", storageid = 34105, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[14] = {
					name = "Paw and Fur: Fleshcrawler", storageid = 34106, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[15] = {
					name = "Paw and Fur: Ribstride", storageid = 34107, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[16] = {
					name = "Paw and Fur: Bloodweb", storageid = 34108, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[17] = {
					name = "Paw and Fur: Thul", storageid = 34109, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[18] = {
					name = "Paw and Fur: The Old Widow", storageid = 34110, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[19] = {
					name = "Paw and Fur: Hemming", storageid = 34111, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[20] = {
					name = "Paw and Fur: Tormentor", storageid = 34112, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[21] = {
					name = "Paw and Fur: Flameborn", storageid = 34113, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[22] = {
					name = "Paw and Fur: Fazzrah", storageid = 34114, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[23] = {
					name = "Paw and Fur: Tromphonyte", storageid = 34115, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[24] = {
					name = "Paw and Fur: Sulphur Scuttler", storageid = 34116, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[25] = {
					name = "Paw and Fur: Bruise Payne", storageid = 34117, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},
				
				[26] = {
					name = "Paw and Fur: The Many", storageid = 34118, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[27] = {
					name = "Paw and Fur: The Noxious Spawn", storageid = 34119, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[28] = {
					name = "Paw and Fur: Gorgo", storageid = 34120, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[29] = {
					name = "Paw and Fur: Stonecracker", storageid = 34121, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[30] = {
					name = "Paw and Fur: Leviathan", storageid = 34122, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[31] = {
					name = "Paw and Fur: Kerberos", storageid = 34123, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[32] = {
					name = "Paw and Fur: Ethershreck", storageid = 34124, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[33] = {
					name = "Paw and Fur: Paiz the Pauperizer", storageid = 34125, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[34] = {
					name = "Paw and Fur: Bretzecutioner", storageid = 34126, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[35] = {
					name = "Paw and Fur: Zanakeph", storageid = 34127, startvalue = 1, endvalue = 2, description = "Try find its hideout and kill it.",
				},

				[36] = {
					name = "Edron City - Elite Hunting: Trolls", storageid = 1501, startvalue = 0, endvalue = 100, description = function(player)return string.format("You already hunted %d/100 Trolls.", (math.max(player:getStorageValue(1501), 0))) end,
				},

				[37] = {
					name = "Edron City - Elite Hunting: Goblins", storageid = 1502, startvalue = 0, endvalue = 150, description = function(player)return string.format("You already hunted %d/150 Goblins.", (math.max(player:getStorageValue(1502), 0))) end,
				},

				[38] = {
					name = "Paw and Fur: Minotaurs", storageid = 65002, startvalue = 0, endvalue = 5000, description = function(player)return string.format("You already hunted %d/5000 Minotaurs.", (math.max(player:getStorageValue(65002), 0))) end,
				},

				[39] = {
					name = "Paw and Fur: Necromancers and Priestess", storageid = 65001, startvalue = 0, endvalue = 4000, description = function(player)return string.format("You already hunted %d/4000 Necromancers and Priestess.", (math.max(player:getStorageValue(65001), 0))) end,
				},

				[40] = {
					name = "Paw and Fur: Crocodiles", storageid = 65003, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 crocodiles.", (math.max(player:getStorageValue(65003), 0))) end,
				},

				[41] = {
					name = "Paw and Fur: Badgers", storageid = 65004, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 badgers.", (math.max(player:getStorageValue(65004), 0))) end,
				},

				[42] = {
					name = "Paw and Fur: Tarantulas", storageid = 65005, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 tarantulas.", (math.max(player:getStorageValue(65005), 0))) end,
				},

				[43] = {
					name = "Paw and Fur: Carniphilas", storageid = 65006, startvalue = 0, endvalue = 150, description = function(player)return string.format("You already hunted %d/150 carniphilas.", (math.max(player:getStorageValue(65006), 0))) end,
				},

				[44] = {
					name = "Paw and Fur: Stone Golems", storageid = 65007, startvalue = 0, endvalue = 200, description = function(player)return string.format("You already hunted %d/200 stone golems.", (math.max(player:getStorageValue(65007), 0))) end,
				},

				[45] = {
					name = "Paw and Fur: Mammoths", storageid = 65008, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 mammoths.", (math.max(player:getStorageValue(65008), 0))) end,
				},

				[46] = {
					name = "Paw and Fur: Gnarlhounds", storageid = 65009, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 gnarlhounds.", (math.max(player:getStorageValue(65009), 0))) end,
				},

				[47] = {
					name = "Paw and Fur: Terramites", storageid = 65010, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 terramites.", (math.max(player:getStorageValue(65010), 0))) end,
				},

				[48] = {
					name = "Paw and Fur: Apes", storageid = 65011, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 apes.", (math.max(player:getStorageValue(65011), 0))) end,
				},

				[49] = {
					name = "Paw and Fur: Thornback Tortoises", storageid = 65012, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 thornback tortoises.", (math.max(player:getStorageValue(65012), 0))) end,
				},

				[50] = {
					name = "Paw and Fur: Gargoyles", storageid = 65013, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 gargoyles.", (math.max(player:getStorageValue(65013), 0))) end,
				},

				[51] = {
					name = "Paw and Fur: Ice Golems", storageid = 65014, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 ice golems.", (math.max(player:getStorageValue(65014), 0))) end,
				},

				[52] = {
					name = "Paw and Fur: Quara Scouts", storageid = 65015, startvalue = 0, endvalue = 400, description = function(player)return string.format("You already hunted %d/400 quara scouts.", (math.max(player:getStorageValue(65015), 0))) end,
				},

				[53] = {
					name = "Paw and Fur: Mutated Rats", storageid = 65016, startvalue = 0, endvalue = 400, description = function(player)return string.format("You already hunted %d/400 mutated rats.", (math.max(player:getStorageValue(65016), 0))) end,
				},

				[54] = {
					name = "Paw and Fur: Ancient Scarabs", storageid = 65017, startvalue = 0, endvalue = 250, description = function(player)return string.format("You already hunted %d/250 ancient scarabs.", (math.max(player:getStorageValue(65017), 0))) end,
				},

				[55] = {
					name = "Paw and Fur: Wyverns", storageid = 65018, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 wyverns.", (math.max(player:getStorageValue(65018), 0))) end,
				},

				[56] = {
					name = "Paw and Fur: Lancer Beetles", storageid = 65019, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 lancer beetles.", (math.max(player:getStorageValue(65019), 0))) end,
				},

				[57] = {
					name = "Paw and Fur: Wailing Widows", storageid = 65020, startvalue = 0, endvalue = 400, description = function(player)return string.format("You already hunted %d/400 wailing widows.", (math.max(player:getStorageValue(65020), 0))) end,
				},

				[58] = {
					name = "Paw and Fur: Killer Caimans", storageid = 65021, startvalue = 0, endvalue = 250, description = function(player)return string.format("You already hunted %d/250 killer caimans.", (math.max(player:getStorageValue(65021), 0))) end,
				},

				[59] = {
					name = "Paw and Fur: Bonebeasts", storageid = 65022, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 bonebeasts.", (math.max(player:getStorageValue(65022), 0))) end,
				},

				[60] = {
					name = "Paw and Fur: Crystal Spiders", storageid = 65023, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 crystal spiders.", (math.max(player:getStorageValue(65023), 0))) end,
				},

				[61] = {
					name = "Paw and Fur: Mutated Tigers", storageid = 65024, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 mutated tigers.", (math.max(player:getStorageValue(65024), 0))) end,
				},

				[62] = {
					name = "Paw and Fur: Underwater Quara", storageid = 65025, startvalue = 0, endvalue = 600, description = function(player)return string.format("You already hunted %d/600 underwater quara.", (math.max(player:getStorageValue(65025), 0))) end,
				},

				[63] = {
					name = "Paw and Fur: Giant Spiders", storageid = 65026, startvalue = 0, endvalue = 500, description = function(player)return string.format("You already hunted %d/500 giant spiders.", (math.max(player:getStorageValue(65026), 0))) end,
				},

				[64] = {
					name = "Paw and Fur: Werewolves", storageid = 65027, startvalue = 0, endvalue = 300, description = function(player)return string.format("You already hunted %d/300 werewolves.", (math.max(player:getStorageValue(65027), 0))) end,
				},

				[65] = {
					name = "Paw and Fur: Nightmares", storageid = 65028, startvalue = 0, endvalue = 400, description = function(player)return string.format("You already hunted %d/400 nightmares.", (math.max(player:getStorageValue(65028), 0))) end,
				},

				[66] = {
					name = "Paw and Fur: Hellspawns", storageid = 65029, startvalue = 0, endvalue = 600, description = function(player)return string.format("You already hunted %d/600 hellspawns.", (math.max(player:getStorageValue(65029), 0))) end,
				},

				[67] = {
					name = "Paw and Fur: High Class Lizards", storageid = 65030, startvalue = 0, endvalue = 800, description = function(player)return string.format("You already hunted %d/800 high class lizards.", (math.max(player:getStorageValue(65030), 0))) end,
				},

				[68] = {
					name = "Paw and Fur: Stampors", storageid = 65031, startvalue = 0, endvalue = 600, description = function(player)return string.format("You already hunted %d/600 stampors.", (math.max(player:getStorageValue(65031), 0))) end,
				},

				[69] = {
					name = "Paw and Fur: Brimstone Bugs", storageid = 65032, startvalue = 0, endvalue = 500, description = function(player)return string.format("You already hunted %d/500 brimstone bugs.", (math.max(player:getStorageValue(65032), 0))) end,
				},

				[70] = {
					name = "Paw and Fur: Mutated Bats", storageid = 65033, startvalue = 0, endvalue = 400, description = function(player)return string.format("You already hunted %d/400 mutated bats.", (math.max(player:getStorageValue(65033), 0))) end,
				},

				[71] = {
					name = "Paw and Fur: Hydras", storageid = 65034, startvalue = 0, endvalue = 650, description = function(player)return string.format("You already hunted %d/650 hydras.", (math.max(player:getStorageValue(65034), 0))) end,
				},

				[72] = {
					name = "Paw and Fur: Serpent Spawns", storageid = 65035, startvalue = 0, endvalue = 800, description = function(player)return string.format("You already hunted %d/800 serpent spawns.", (math.max(player:getStorageValue(65035), 0))) end,
				},

				[73] = {
					name = "Paw and Fur: Medusas", storageid = 65036, startvalue = 0, endvalue = 500, description = function(player)return string.format("You already hunted %d/500 medusas.", (math.max(player:getStorageValue(65036), 0))) end,
				},

				[74] = {
					name = "Paw and Fur: Behemoths", storageid = 65037, startvalue = 0, endvalue = 700, description = function(player)return string.format("You already hunted %d/700 behemoths.", (math.max(player:getStorageValue(65037), 0))) end,
				},

				[75] = {
					name = "Paw and Fur: Sea Serpents and Young Sea Serpents", storageid = 65038, startvalue = 0, endvalue = 900, description = function(player)return string.format("You already hunted %d/900 sea serpents and young sea serpents.", (math.max(player:getStorageValue(65038), 0))) end,
				},

				[76] = {
					name = "Paw and Fur: Hellhounds", storageid = 65039, startvalue = 0, endvalue = 250, description = function(player)return string.format("You already hunted %d/250 hellhounds.", (math.max(player:getStorageValue(65039), 0))) end,
				},

				[77] = {
					name = "Paw and Fur: Ghastly Dragons", storageid = 65040, startvalue = 0, endvalue = 500, description = function(player)return string.format("You already hunted %d/500 ghastly dragons.", (math.max(player:getStorageValue(65040), 0))) end,
				},

				[78] = {
					name = "Paw and Fur: Drakens", storageid = 65041, startvalue = 0, endvalue = 900, description = function(player)return string.format("You already hunted %d/900 drakens.", (math.max(player:getStorageValue(65041), 0))) end,
				},

				[79] = {
					name = "Paw and Fur: Destroyers", storageid = 65042, startvalue = 0, endvalue = 650, description = function(player)return string.format("You already hunted %d/650 destroyers.", (math.max(player:getStorageValue(65042), 0))) end,
				},

				[80] = {
					name = "Paw and Fur: Undead Dragons", storageid = 65043, startvalue = 0, endvalue = 400, description = function(player)return string.format("You already hunted %d/400 undead dragons.", (math.max(player:getStorageValue(65043), 0))) end,
				},

				[81] = {
					name = "Paw and Fur: Demons", storageid = 65044, startvalue = 0, endvalue = 6666, description = function(player)return string.format("You already hunted %d/6666 demons.", (math.max(player:getStorageValue(65044), 0))) end,
				},

				[82] = {
					name = "Paw and Fur: Green Djinns or Efreets", storageid = 65045, startvalue = 0, endvalue = 500, description = function(player)return string.format("You already hunted %d/500 green djinns or efreets.", (math.max(player:getStorageValue(65045), 0))) end,
				},

				[83] = {
					name = "Paw and Fur: Blue Djinns or Marids", storageid = 65046, startvalue = 0, endvalue = 500, description = function(player)return string.format("You already hunted %d/500 blue djinns or marids.", (math.max(player:getStorageValue(65046), 0))) end,
				},

				[84] = {
					name = "Paw and Fur: Pirates", storageid = 65047, startvalue = 0, endvalue = 3000, description = function(player)return string.format("You already hunted %d/3000 pirates.", (math.max(player:getStorageValue(65047), 0))) end,
				},

				[85] = {
					name = "Paw and Fur: Pirates Second", storageid = 65048, startvalue = 0, endvalue = 3000, description = function(player)return string.format("You already hunted %d/3000 pirates.", (math.max(player:getStorageValue(65048), 0))) end,
				},

				[86] = {
					name = "Turmoil of War", storageid = 65049, startvalue = 0, endvalue = 5000, description = function(player)return string.format("Budrik asked you to kill 5000 minotaurs for him. You already killed %d minotaurs.", (math.max(player:getStorageValue(65049), 0))) end,
				},

				[87] = {
					name = "Paw and Fur: Necromancers and Priestess", storageid = 65050, startvalue = 0, endvalue = 4000, description = function(player)return string.format("You already hunted %d/4000 necromancers and priestess.", (math.max(player:getStorageValue(65050), 0))) end,
				},

			},
		},

		[13] = {
			name = "Outfit and Addon Quests", startstorageid = Storage.OutfitQuest.DefaultStart, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Assassin Addon: The Red Death", storageid = Storage.OutfitQuest.AssassinSecondAddon, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Atrad wants only two items from you for his old katana: a behemoth claw and a nose ring, both at the same time. He also told you about a &quot;horned fox&quot; who wears such as nose ring",
						[2] = "You have received the second assassin addon.",
					},

				},

				[2] = {
					name = "Citizen Addon: Backpack", storageid = Storage.OutfitQuest.Citizen.MissionBackpack, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Collect 100 pieces of minotaur leather and bring it to either Amber or Lubo to have them make a backpack addon for you.",
						[2] = "You delivered 100 pieces of minotaur leather. Some time is needed to make the backpack for you though. You should check back later and ask either Amber or Lubo for your backpack.",
					},

				},

				[3] = {
					name = "Citizen Addon: Feather Hat", storageid = Storage.OutfitQuest.Citizen.MissionHat, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Collect a legion helmet, 100 chicken feathers and 50 honeycombs and bring them to either Hanna or Norma to have them make a feather hat addon for you.",
					},

				},

				[4] = {
					name = "Barbarian Outfit Quest", storageid = Storage.OutfitQuest.BarbarianAddon, startvalue = 1, endvalue = 17,
					states = {
						[1] = "Bron told you that his brother Ajax in Northport needs to learn that violence is not always the answer. He told you to make his brother angry, then show him that all he needed to do was say 'please' to fix the situation.",
						[2] = "You will need to leave Ajax alone for an hour, then return to him.",
						[3] = "Ajax told you that he has thought about it, and that violence is not always good. Return to Bron now, and tell him that Ajax said fist not always good",
						[4] = "Bron mentioned that he has someone in his house that he doesn't like, and he wants you to get advice from Ajax about how to handle the situation. Go back to Ajax and ask him about Gelagos",
						[5] = "Ajax told you his brother needs Fighting Spirit, and that you should get some from a Djinn and give it to him.",
						[6] = "You brought Bron the Fighting Spirit. He acted a little strange.",
						[7] = "In order to make a shirt as a present for Ajax, Bron wants you to bring him 50 Pieces of Red Cloth and 50 Pieces of Green Cloth.",
						[8] = "Bron wants you to bring him 10 Spider Silk Yarn.",
						[9] = "Bron wants you to bring him the Warrior's Sweat.",
						[10] = "You brought him all required items! accept it!",
						[11] = "You got the Barbarian Wig Addon! Bring now the present from Bron to Ajax!",
						[12] = "Bring Ajax in Northport 100 Iron Ore.",
						[13] = "Bring Ajax 1 Huge Chunk of Crude Iron.",
						[14] = "Bring Ajax 50 Perfect Behemoth Fang",
						[15] = "Bring Ajax 50 Lizard Leather",
						[16] = "Come later in 2 hours and ask Ajax for the axe.",
						[17] = "You got the Axe Addon!",
					},

				},

				[5] = {
					name = "Beggar Outfit: The Newest Fashion", storageid = Storage.OutfitQuest.BeggarOutfit, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Your current task is to bring Hugo 20 pieces of brown cloth, like the worn and ragged ghoul clothing.",
						[2] = "Your current task is to bring 50 pieces of minotaur leather to Hugo. If you don't know how to get leather, you should ask Kalvin.",
						[3] = "Your current task is to bring 10 bat wings to Hugo.",
						[4] = "Your current task is to bring 30 heaven blossoms to Hugo. Elves are said to cultivate these flowers.",
						[5] = "You brought all items required for the &quot;poor man's look&quot; to Hugo. He told you to come back to him after a whole day has passed, then the outfit should be finished.",
						[6] = "You got the outfit!",
					},

				},

				[6] = {
					name = "Druid Outfit Quest", storageid = Storage.OutfitQuest.DruidHatAddon, startvalue = 1, endvalue = 10,
					states = {
						[1] = "Ceiron sends you to collect a sample of the blooming Griffinclaw.",
						[2] = "Ask Ceiron for task.",
						[3] = "take Ceirons waterskin and try to fill it with water from this special trickle. In the mountains between Ankrahmun and Tiquanda are two hydra lairs. It is important that you take the water directly from the trickle, not from the pond",
						[4] = "Ask Ceiron for task.",
						[5] = "Bring Ceiron 100 ounces of demon dust.",
						[6] = "Ask Ceiron for task.",
						[7] = "The last mission is to find and retrieve Ceiron's Wolf Tooth Chain lost inside the Orc Fortress.",
						[8] = "Ask Ceiron for Faolan.",
						[9] = "Head over to Cormaya, find A Majestic Warwolf's Cave and ask her about an addon.",
						[10] = "You got the Outfit!",
					},

				},

				[7] = {
					name = "Hunter Outfit Quest", storageid = Storage.OutfitQuest.HunterHatAddon, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Elane sends you to Liberty Bay to bring her the Crossbow from the Cult.",
						[2] = "Bring Elane 100 pieces of lizard leather and 100 pieces of red dragon leather.",
						[3] = "Bring Elane 5 enchanted chicken wings.",
						[4] = "Bring Elane one piece of royal steel, draconian steel and hell steel each.",
						[5] = "You got the Outfit!",
					},

				},

				[8] = {
					name = "Knight Addon: Helmet", storageid = Storage.OutfitQuest.Knight.MissionHelmet, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Your current task is to bring 100 perfect behemoth fangs to Gregor in Thais.",
						[2] = "Your current task is to retrieve the helmet of Ramsay the Reckless from Banuta. These pesky apes steal everything they can get their dirty hands on.",
						[3] = "Your current task is to obtain a flask of warrior's sweat, which can be magicially extracted from headgear worn by a true warrior, but only in small amounts. Djinns are said to be good at this.",
						[4] = "Your current task is to bring royal steel to Gregor in Thais. Royal steel can only be refined by very skilled smiths.",
						[5] = "You have delivered all items required for the helmet addon. Go talk to Sam and tell him Gregor sent you. He will be glad to refine your helmet.",
						[6] = "Sam is currently creating the helmet for you. Be patient and don't forget to check on it later!",
					},

				},

				[9] = {
					name = "Mage &amp; Summoner Outfit Quest (Wand)", storageid = Storage.OutfitQuest.MageSummoner.AddonWand, startvalue = 1, endvalue = 7,
					states = {
						[1] = "You found Angelina in a Prison. She told you a secret: Lynda in Thais can create a blessed wand. Greet her from Angelina, maybe she will aid you.",
						[2] = "Lynda send you to bring her a sample of all five wands and five rods (Snakebite, Moonlight, Necrotic, Terra, Hailstorm, Vortex, Dragonbreath, Decay, Cosmic Energy and Inferno)",
						[3] = "Bring Lynda 10 ounces of magic sulphur",
						[4] = "Bring Lynda the Necromancer's soul stone",
						[5] = "Bring Lynda 20 ankhs now to complete the ritual.",
						[6] = "You need to wait 3 hours for the ritual to be completed",
						[7] = "You got the Outfit!",
					},

				},

				[10] = {
					name = "Mage &amp; Summoner Outfit Quest (Fluid Belt)", storageid = Storage.OutfitQuest.MageSummoner.AddonBelt, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Now you can get a lottery ticket at Sandra for 100 empty vials.",
						[2] = "You got the Outfit! Now you can get for a lottery prize 50000 gold!",
					},

				},

				[11] = {
					name = "Female Mage and Male Summoner Addon: Headgear", storageid = Storage.OutfitQuest.MageSummoner.MissionHatCloak, startvalue = 1, endvalue = 11,
					states = {
						[1] = "Your current task is to bring 70 bat wings to Myra in Port Hope.",
						[2] = "Your current task is to bring 20 pieces of red cloth to Myra in Port Hope. These are said to make an excellent material for a cape.",
						[3] = "Your current task is to bring 40 pieces of ape fur to Myra in Port Hope.",
						[4] = "Your current task is to bring 35 holy orchids to Myra in Port Hope. Elves are said to cultivate these.",
						[5] = "Your current task is to bring 10 spools of spider silk yarn to Myra in Port Hope. Only very large spiders produce silk which is strong enough to be yarned by mermaids.",
						[6] = "Your current task is to bring 60 lizard scales to Myra in Port Hope. Lizard scales are great for all sort of magical potions.",
						[7] = "Your current task is to bring 40 red dragon scales to Myra in Port Hope.",
						[8] = "Your current task is to bring 15 ounces of magic sulphur to Myra in Port Hope. Djinns are said to be good at extracting magic sulphur.",
						[9] = "Your current task is to bring 30 ounces of vampire dusts to Myra in Port Hope. You might need to ask a priest for a special blessed stake to turn vampires into dust.",
						[10] = "You finally collected all of the items which Myra asked for. Go talk to Zoltan in Edron and tell him that Myra nominated you for an award.",
					},

				},

				[12] = {
					name = "Norseman Outfit Quest", storageid = Storage.OutfitQuest.NorsemanAddon, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Bring Hjaern 5 frostheart shards to get the first Addon. Ask him for shard!",
						[2] = "Bring Hjaern 10 frostheart shards to get the second Addon. Ask him for shard!",
						[3] = "You got the Outfit Addons! You can trade the rest shards to Hjaern for 2000 gold each!",
					},

				},

				[13] = {
					name = "Warrior Addon: Shoulder Spike", storageid = Storage.OutfitQuest.WarriorShoulderAddon, startvalue = 1, endvalue = 7,
					states = {
						[1] = "Your current task is to bring 100 hardened bones to Trisha in Carlin. They can sometimes be extracted from creatures that consist only of - you guessed it, bones. You need an obsidian knife though.",
						[2] = "Your current task is to bring 100 turtle shells to Trisha in Carlin. Turtles can be found on some idyllic islands which have recently been discovered.",
						[3] = "Your current task is to show that you have fighting spirit. Maybe someone grants you a wish...?",
						[4] = "Your current task is to obtain a dragon claw. You cannot get this special claw from any common dragons in Tibia. It requires a special one, a lord among the lords.",
						[5] = "You have delivered all items requried for the shoulder spike addon. Go talk to Cornelia and tell her Trisha sent you. She will be glad to create the should spikes.",
						[6] = "Cornelia is currently creating the should spikes for you. Be patient and don't forget to check on it later!",
						[7] = "You have obtained the shoulder spike addon.",
					},

				},

				[14] = {
					name = "Wizard Outfits Quest", storageid = Storage.OutfitQuest.WizardAddon, startvalue = 1, endvalue = 7,
					states = {
						[1] = "Bring Lugri the Medusa shield!",
						[2] = "Bring Lugri the Dragon Scale Mail!",
						[3] = "Bring Lugri the Crown Legs!",
						[4] = "Bring Lugri the Ring of the Sky!",
						[5] = "You got the first Outfit Addon!",
						[6] = "Bring The Queen Of The Banshees 50 Holy Orchids and she will reward you with the second addon.",
						[7] = "You got the second Outfit Addon!",
					},

				},

				[15] = {
					name = "Pirate Outfit Quest (Sabre)", storageid = Storage.OutfitQuest.PirateSabreAddon, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Bring Duncan 100 Eye Patches from pirates!",
						[2] = "Bring Duncan 100 peg legs from pirates!",
						[3] = "Bring Duncan 100 pirate hooks from pirates!",
						[4] = "Go to Morgan and tell him this codeword: 'firebird' to get the outfit addon!",
						[5] = "You got the Outfit Addon!",
					},

				},

				[16] = {
					name = "Oriental Addon: Hipwear", storageid = Storage.OutfitQuest.firstOrientalAddon, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your current task is to find a mermaid's comb. If you have ever encountered a mermaid, you should ask her. Bring the comb to Habdel if you are male or to Ishina if you are female.",
						[2] = "You have received the first oriental addon.",
					},

				},

				[17] = {
					name = "Oriental Addon: Headgear", storageid = Storage.OutfitQuest.secondOrientalAddon, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Your current task is to bring 100 pieces of ape fur to Razan if you are male, or to Miraia if you are female.",
						[2] = "Your current task is to bring 100 fish fins to Razan if you are male, or to Miraia if you are female.",
						[3] = "Your current task is to bring 2 enchanted chicken wings to Razan if you are male, or to Miraia if you are female.",
						[4] = "Your current task is to bring 100 pieces of blue cloth to Razan if you are male, or to Miraia if you are female.",
						[5] = "You have received the second oriental addon.",
					},

				},

				[18] = {
					name = "Shaman Addon: Staff", storageid = Storage.OutfitQuest.Shaman.MissionStaff, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Try to find a monster which sometimes lurks in the Tiquandian jungle as the revenge of the jungle against mankind. Bring the rare root it carries to Chondur as well as 5 voodoo dolls.",
					},

				},

				[19] = {
					name = "Shaman Addon: Mask", storageid = Storage.OutfitQuest.Shaman.MissionMask, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your current task is to collect 5 tribal masks from the dworcs and 5 banana staves from the apes. Bring them to Chondur to earn your shamanic mask.",
					},

				},

			},
		},

		[14] = {
			name = "Sam's Old Backpack", startstorageid = Storage.SamsOldBackpack, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Dwarven Armor Quest", storageid = Storage.SamsOldBackpack, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Sam sends you to see Kroox in Kazordoon to get a special dwarven armor. Just tell him, his old buddy Sam is sending you.",
						[2] = "You have the permission to retrive a dwarven armor from the mines. The problem is, some giant spiders made the tunnels where the storage is their new home.",
						[3] = "You have completed Dwarven Armor Quest!",
					},

				},

			},
		},

		[15] = {
			name = "Sea of Light", startstorageid = Storage.SeaOfLightQuest.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 1: The Plans", storageid = Storage.SeaOfLightQuest.Mission1, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Spectulus in Edron has sent you on a mission to find out the whereabouts of a certain inventor. A beggar in Edron seems to know more about this topic than he wants to tell.",
						[2] = "The beggar turned out to be the inventor himself. You successfully convinced him to give you the only remaining plans of his creation. You should return to Spectulus in Edron to tell him the news.",
						[3] = "You gave the plans to the astronomer. He began reconstructing the invention as soon as he got ahold of them. It will take a while for him to work out the problem which caused the initial failure.",
						[4] = "You returned to Speculus who finally worked out the failure of the initial construction. He recapitulated the plans and needs only one item before he can start building the magic device.",
					},

				},

				[2] = {
					name = "Mission 2: The Collector", storageid = Storage.SeaOfLightQuest.Mission2, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Spectulus asked you to enter the Lost Mines beneath Edron and recover a rare crystal. In exchange for it you will gain access to the lair of the Collector who guards a vital component of the device.",
						[2] = "Luckily, you survived the horrors of the Lost Mines and recovered a rare crystal. You should visit Spectulus in Edron to seek counsel on what to do next.",
						[3] = "You returned to astronomer Spectulus and gave him the rare crystal.",
					},

				},

				[3] = {
					name = "Mission 3: The Mirror Crystal", storageid = Storage.SeaOfLightQuest.Mission3, startvalue = 1, endvalue = 4,
					states = {
						[1] = "In order to access the lair of the Collector, you will need to find the creature's well on an ice isle near Carlin. To donate the rare crystal overcome your greed and use it at the well's pedestal.",
						[2] = "You offered the rare crystal to the creature and can now enter the Collector's lair. Its crystal chamber cannot be accessed by outsiders. You need to find a way to snatch the Mirror Crystal.",
						[3] = "The Collector has been defeated. You packed the fragile Mirror Crystal into the device Spectulus gave you. All yo have to do now is to return to the astronomer and to present him your acquisition.",
						[4] = "It may have been the excitement or simple nervousness but as soon as Spectulus removed the crystal, it somehow slipped. Unfinishable for all eternity, the device left yet another scholar in despair.",
					},

				},

			},
		},

		[16] = {
			name = "Secret Service", startstorageid = Storage.secretService.Quest, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 1: From Thais with Love", storageid = Storage.secretService.TBIMission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your first mission is to deliver a warning to the Venoreans. Get a fire bug from Liberty Bay and set their shipyard on fire.",
						[2] = "You have set the Venoreans shipyard on fire, report back to Chester!",
						[3] = "You have reported back that you have completed your mission, ask Chester for a new mission!",
					},

				},

				[2] = {
					name = "Mission 1: For Your Eyes Only", storageid = Storage.secretService.AVINMission01, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Your first task is to deliver a letter to Gamel in thais, If he is a bit reluctant, be persuasive.",
						[2] = "Gamel sent his thugs on you, defeat them and deliver the letter to Gamel!",
						[3] = "After defeating Gamel's thugs, he found you to be persuasive enough to accept the letter. Report back to Uncle!",
						[4] = "You have reported back that you have completed your task. Ask Uncle for a new mission!",
					},

				},

				[3] = {
					name = "Mission 1: Borrowed Knowledge", storageid = Storage.secretService.CGBMission01, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Emma has requested that you steal a Nature Magic Spellbook in the Edron academy.",
						[2] = "You have delivered the Nature Magic Spellbook to Emma, ask her for a new mission!",
					},

				},

				[4] = {
					name = "Mission 2: Operation Green Claw", storageid = Storage.secretService.TBIMission02, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your next mission is to find some information about one of their missing agents in The Green Claw Swamp.",
						[2] = "You have delivered the Black Knight's notes to Chester, ask him for a new mission!",
					},

				},

				[5] = {
					name = "Mission 2: A File Between Friends", storageid = Storage.secretService.AVINMission02, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your next task is to retrieve a file named AH-X17L89.",
						[2] = "You have delivered the file named AH-X17L89 to Uncle, ask him for a new mission!",
					},

				},

				[6] = {
					name = "Mission 2: Codename:Lumberjack", storageid = Storage.secretService.CGBMission02, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Emma has requested that you retrieve a Rotten Heart of a Tree from the Black Knight Villa in Greenclaw swamp north-west of Venore.",
						[2] = "You have delivered the Rotten Heart of a Tree to Emma, ask her for a new mission!",
					},

				},

				[7] = {
					name = "Mission 3: Treachery in Port Hope", storageid = Storage.secretService.TBIMission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your next mission is to retrieve some evidence that the traders in Port Hope are up to no good!",
						[2] = "You have found the evidence, report back to Chester!",
						[3] = "You have reported back that you have completed your mission, ask Chester for a new mission!",
					},

				},

				[8] = {
					name = "Mission 3: What Men are Made of", storageid = Storage.secretService.AVINMission03, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Your next task is to bring a barrel of beer to the Secret Tavern in the sewers of Carlin.",
						[2] = "On your way to the Secret Tavern in the sewers you were attacked by amazons trying to stop you! Deliver the barrel of beer to Karl.",
						[3] = "You have delivered the barrel of beer to Karl, report back to Uncle!",
						[4] = "You have reported back that you have completed your task, ask Uncle for a new mission!",
					},

				},

				[9] = {
					name = "Mission 3: Rust in Peace", storageid = Storage.secretService.CGBMission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Emma has requested that you damage the Ironhouse of Venore, use the Case of Rust Bugs on the keyhole in the cellar of the ironhouse.",
						[2] = "The bugs are at work! Report back to Emma.",
						[3] = "You have reported back that you have completed your mission, ask her for a new mission!",
					},

				},

				[10] = {
					name = "Mission 4: Objective Hellgate", storageid = Storage.secretService.TBIMission04, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your next mission is to investigate for some documents in Hellgate.",
						[2] = "You have delivered the documents to Chester, ask him for a new mission!",
					},

				},

				[11] = {
					name = "Mission 4: Pawn Captures Knight", storageid = Storage.secretService.AVINMission04, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your next task is to travel to the Black Knight's Villa and kill the Black Knight!",
						[2] = "You have killed the Black Knight, report back to Uncle!",
						[3] = "You have reported back that you have completed your task, ask Uncle for a new mission!",
					},

				},

				[12] = {
					name = "Mission 4: Plot for A Plan", storageid = Storage.secretService.CGBMission04, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Emma has requested that you retrieve the Building Plans for a ship from the Venore shipyard.",
						[2] = "You have delivered the Building Plans to Emma, ask her for a new mission!",
					},

				},

				[13] = {
					name = "Mission 5: Coldfinger", storageid = Storage.secretService.TBIMission05, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your next mission is to travel to the southern barbarians camp and place false evidence!",
						[2] = "You have placed the false evidence! Report back to Chester.",
						[3] = "You have reported back that you have completed your mission, ask Chester for a new mission!",
					},

				},

				[14] = {
					name = "Mission 5: A Cryptic Mission", storageid = Storage.secretService.AVINMission05, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your next task is to travel to the Isle of the Kings and find a ring.",
						[2] = "You have delivered the ring to Uncle, ask him for a new mission!",
					},

				},

				[15] = {
					name = "Mission 5: No Admittance", storageid = Storage.secretService.CGBMission05, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Emma has requested that you find some hints in the ruins of Dark Cathedral.",
						[2] = "You have delivered the Suspicious Documents to Emma, ask her for a new mission!",
					},

				},

				[16] = {
					name = "Mission 6: The Weakest Spot", storageid = Storage.secretService.TBIMission06, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your next mission is to disguise yourself as an amazon and destroy a beer casket in the north-east corner in the cellar of Svargrond's Tavern.",
						[2] = "You have succesfully destroyed the beer casket disguised as an amazon, report back to Chester!",
						[3] = "You have reported back that you have completed your mission, ask Chester for a new mission!",
					},

				},

				[17] = {
					name = "Mission 6: A Little Bribe Won't Hurt", storageid = Storage.secretService.AVINMission06, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your next task is to bribe a barbarian in the large barbarian camp with a weapons crate.",
						[2] = "You have bribed Freezhild with the weapons create! Report back to Uncle.",
						[3] = "You have reported back that you have completed your task, ask Uncle for a new mission!",
					},

				},

				[18] = {
					name = "Mission 6: News From the Past", storageid = Storage.secretService.CGBMission06, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Emma has requested that you go to the Isle of the Kings and retrieve a book.",
						[2] = "You have delivered the book to Emma, ask her for a new mission!",
					},

				},

				[19] = {
					name = "Mission 7: Licence to Kill", storageid = Storage.secretService.Mission07, startvalue = 1, endvalue = 2,
					states = {
						[1] = "A Mad Technomancer in Kazordoon is trying to blackmail the city! Kill him and bring back his beard as proof.",
						[2] = "You have reported back that you have completed your mission, you are now a Special Agent!",
					},

				},

			},
		},

		[17] = {
			name = "The Ancient Tombs", startstorageid = Storage.TheAncientTombs.DefaultStart, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Omruc's Treasure", storageid = 12101, startvalue = 1, endvalue = 1, description = "You defeated Omruc and received a helmet adornment",
				},

				[2] = {
					name = "Thalas' Treasure", storageid = 12102, startvalue = 1, endvalue = 1, description = "You defeated Thalas and received a Gem Holder",
				},

				[3] = {
					name = "Diphtrah's Treasure", storageid = 12103, startvalue = 1, endvalue = 1, description = "You defeated Dipthrah and received a Damaged Helmet",
				},

				[4] = {
					name = "Mahrdis' Treasure", storageid = 12104, startvalue = 1, endvalue = 1, description = "You defeated Mahrdis and received a Helmet Ornament",
				},

				[5] = {
					name = "Vashresamun's Treasure", storageid = 12105, startvalue = 1, endvalue = 1, description = "You solved the musical riddles of Vashresamun's Tomb and received a left horn.",
				},

				[6] = {
					name = "Morguthis' Treasure", storageid = 12106, startvalue = 1, endvalue = 1, description = "You defeated Morguthis and received a Right Horn",
				},

				[7] = {
					name = "Rahemos' Treasure", storageid = 12107, startvalue = 1, endvalue = 1, description = "You defeated Rahemos and received a Helmet Piece",
				},

			},
		},

		[18] = {
			name = "The Ape City", startstorageid = Storage.TheApeCity.Started, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Hairycles' Missions", storageid = Storage.TheApeCity.Questline, startvalue = 1, endvalue = 18,
					states = {
						[1] = "Find whisper moss in the dworc settlement south of Port Hope and bring it back to Hairycles.",
						[2] = "You have completed the first mission. Hairycles was happy about the whisper moss you gave to him. He might have another mission for you.",
						[3] = "Hairycles asked you to bring him cough syrup from a human settlement. A healer might know more about this medicine.",
						[4] = "You have completed the second mission. Hairycles was happy about the cough syrup you gave to him. He might have another mission for you.",
						[5] = "Hairycles asked you to bring him a magical scroll from the lizard settlement Chor.",
						[6] = "You have completed the third mission. Hairycles appreciated that you brought the scroll to him and will try to read it. Maybe he has another mission for you later.",
						[7] = "Since Hairycles was not able to read the scroll you brought him, he asked you dig for a tomb in the desert to the east. Proceed in this tomb until you find an obelisk between red stones and read it.",
						[8] = "You have completed the fourth mission. Hairycles read your mind and can now translate the lizard scroll. He might have another mission for you.",
						[9] = "Hairycles wants to create a life charm for the ape people. He needs a hydra egg since it has strong regenerating powers.",
						[10] = "You have completed the fifth mission. Hairycles attempts to create a might charm for the protection of the ape people. He might have another mission for you later.",
						[11] = "Hairycles need a witches' cap mushroom which is supposed to be hidden in a dungeon deep under Fibula.",
						[12] = "You have completed the sixth mission. You brought the witches' cap mushroom back to Hairycles. He might have another mission for you.",
						[13] = "Hairycles is worried about an ape cult which drinks some strange fluid that the lizards left behind. Go to the old lizard temple under Banuta and destroy three of the casks there with a crowbar.",
						[14] = "You have completed the seventh mission. You found the old lizard ruins under Banuta and destroyed three of the casks with snake blood. Hairycles might have another mission for you.",
						[15] = "The apes now need a symbol of their faith. Speak with the blind prophet in a cave to the northeast and go to the Forbidden Land. Find a hair of the giant, holy ape Bong and bring it back.",
						[16] = "You completed the eighth mission. Hairycles gladly accepted the hair of the ape god which you brought him. He told you to have one final mission for you.",
						[17] = "Go into the deepest catacombs under Banuta and destroy the monument of the snake god with the hammer that Hairycles gave to you.",
						[18] = "You successfully destroyed the monument of the snake god. As reward, you can buy sacred statues from Hairycles. If you haven't done so yet, you should also ask him for a shaman outfit.",
					},

				},

			},
		},

		[19] = {
			name = "The Beginning", startstorageid = Storage.RookgaardTutorialIsland.SantiagoQuestLog, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "The Cockroach Plague", storageid = Storage.RookgaardTutorialIsland.SantiagoQuestLog, startvalue = 1, endvalue = 11,
					states = {
						[1] = "You have found a fisherman called Santiago, who has a little problem. Maybe you should talk to him again to find out more.",
						[2] = "Santiago asked you to go into his house. Upstairs you will find a chest. You can keep what you find inside of it. Once you got that, talk to Santiago again.",
						[3] = "You have found Santiago's Coat and reported back to him. Your quest is not done yet, you should talk to him a bit more.",
						[4] = "Santiago gave you a weapon. After equipping it, go to the cellar of his house to find out about the cockroach plague.",
						[5] = "You brought the cockroach legs to Santiago. He still has something to tell you though.",
						[6] = "Santiago asked you, if those cockroaches hurt you. You should reply to him!",
						[7] = "Santiago has a valuable lesson for you. You should talk to him again.",
						[8] = "Santiago showed you how some monsters might hurt you. Better to talk to him to learn a way to heal yourself.",
						[9] = "Santiago gave you some fish! Just 'use' it to eat it and regain health. Afterwards, you should talk to Santiago again.",
						[10] = "Santiago asked you if you had seen Zirella. Don't let him wait for the answer.",
						[11] = "You have helped Santiago a lot by killing the cokcroaches in his cellar. In exchange, he gave you equipment and some valuable experience. Well done!",
					},

				},

				[2] = {
					name = "Collecting Wood", storageid = Storage.RookgaardTutorialIsland.ZirellaQuestLog, startvalue = 1, endvalue = 8,
					states = {
						[1] = "You have a vague idea that Zirella might need you for collecting firewood, but you don't know yet where to get it. You should talk to her again.",
						[2] = "You know that the branches Zirella needs might be gotten from dead trees in the forest south of here, but you don't know the details yet. You should talk to her again.",
						[3] = "You have learned that you need to 'Use' the dead tree to break a branch from it, but there is some information missing. You should talk to Zirella again.",
						[4] = "You have learned that you can push the branch which you've broken from a dead tree by 'Drag &amp; Drop', but you still need some information. You should talk to Zirella again.",
						[5] = "You know that you have to 'Use' the branch. Then leftclick with the changed cursor on the cart. Now you just have to tell Zirella that you will help her.",
						[6] = "Go into the forest south of here and look for trees without leaves. 'Use' one to break a branch from it, then drag &amp; drop the branch back to her cart and 'Use' it with the cart.",
						[7] = "You have brought a branch to Zirella, congratulations! You should talk to her again for your reward.",
						[8] = "You have helped Zirella by collecting wood for her. The reward can be found in her house.",
					},

				},

				[3] = {
					name = "A Hungry Tailor", storageid = Storage.RookgaardTutorialIsland.CarlosQuestLog, startvalue = 1, endvalue = 8,
					states = {
						[1] = "You found another person named Carlos. You should talk to him learn how to change your outfit.",
						[2] = "Carlos taught you how to change your outfit. Now he seems to be wanting a small favour from you. Talk to him again to learn more.",
						[3] = "Carlos asked you whether you could bring him some food. Talk to him again to learn how to find food here.",
						[4] = "Carlos asked you to hunt some deer and rabbits and loot them to find a piece of ham or meat. However you haven't agreed yet, so you should tell him that you'll do it.",
						[5] = "You agreed to bring Carlos some food. Hunt some deer or rabbit until you find a piece of meat or ham talk to Carlos again.",
						[6] = "To sell the meat or ham to Carlos, talk to him and ask him for a 'trade'.",
						[7] = "You sucessfully learnt how to change your outfit and how to trade with NPCs. Time to head over the bridge to Rookgaard!",
						[8] = "You have passed the bridge to Rookgaard and have sucessfully completed the Tutorial. If you want to skip the tutorial in the future with a new character, simply say 'skip tutorial' to Santiago.",
					},

				},

			},
		},

		[20] = {
			name = "The Djinn War - Efreet Faction", startstorageid = Storage.DjinnWar.EfreetFaction.Start, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Efreet Mission 1: The Supply Thief", storageid = Storage.DjinnWar.EfreetFaction.Mission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Travel to Thais and keep your eyes open for something that might give you a clue on the supply thief.",
						[2] = "You have found the potential supply thief - Partos in Thais seemed very suspicious. Baa'leal might be interested in this matter.",
						[3] = "You have reported the case to Baa'leal. He seemed very satisfied and told you that Alesar might have another mission for you.",
					},

				},

				[2] = {
					name = "Efreet Mission 2: The Tear of Daraman", storageid = Storage.DjinnWar.EfreetFaction.Mission02, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Sneak into Ashta'daramai and steal a &quot;Tear of Daraman&quot;. For more information about these gems visit the Efreet library.",
						[2] = "You have successfully managed to steal a Tear of Daraman from Ashta'daramai. Bring it to Alesar.",
						[3] = "You have delivered Daraman's Tear. Alesar seemed very satisfied and told you that Malor himself might have another mission for you.",
					},

				},

				[3] = {
					name = "Efreet Mission 3: The Sleeping Lamp", storageid = Storage.DjinnWar.EfreetFaction.Mission02, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Malor asked you to find Fa'hradin's sleeping lamp in the orc fortress at Ulderek's Rock. Then, sneak into Ashta'daramai and exchange Gabel's sleeping lamp with Fa'hradin's lamp.",
						[2] = "You successfully exchanged the lamps. Malor will be happy to hear about this.",
						[3] = "The Efreet are very satisfied with your help. King Malor allowed you to trade with Yaman and Alesar.",
					},

				},

			},
		},

		[21] = {
			name = "The Djinn War - Marid Faction", startstorageid = Storage.DjinnWar.MaridFaction.Start, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Marid Mission 1: The Dwarven Kitchen", storageid = Storage.DjinnWar.MaridFaction.Mission01, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Bring a cookbook of the dwarven kitchen to Bo'ques.",
						[2] = "You have delivered the cookbook. Bo'ques seemed very satisfied and told you that Fa'hradin might have another mission for you.",
					},

				},

				[2] = {
					name = "Marid Mission 2: The Spyreport", storageid = Storage.DjinnWar.MaridFaction.Mission02, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Fa'hradin asked you to sneak into the Efreet fortress Mal'ouqhah and find their undercover spy. The codeword is PIEDPIPER.",
						[2] = "You have delivered the spyreport. Fa'hradin seemed impressed and told you that Gabel himself might have another mission for you.",
					},

				},

				[3] = {
					name = "Rata'Mari and the Cheese", storageid = Storage.DjinnWar.MaridFaction.RataMari, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You have promised Rata'Mari cheese. Once you deliver some to him, he will hand over his spyreport.",
						[2] = "You got Rata'Mari's spyreport. He seems to be quite happy with the cheese you brought him.",
					},

				},

				[4] = {
					name = "Marid Mission 3: The Sleeping Lamp", storageid = Storage.DjinnWar.MaridFaction.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Gabel asked you to find Fa'hradin's sleeping lamp in the orc fortress at Ulderek's Rock. Then, sneak into Mal'ouqhah and exchange Malor's sleeping lamp with Fa'hradin's lamp.",
						[2] = "You successfully exchanged the lamps. Gabel will be happy to hear about this.",
						[3] = "The Marid deeply appreciate your help. King Gabel allowed you to trade with Haroun and Nah'bob.",
					},

				},

			},
		},

		[22] = {
			name = "The Hidden City of Beregar", startstorageid = Storage.hiddenCityOfBeregar.DefaultStart, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Going Down", storageid = Storage.hiddenCityOfBeregar.GoingDown, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Deliver 3 Gear Wheels to Xorlosh.",
						[2] = "You sucessfully helped Xorlosh in repairing the elevator. You can now enter the teleporter to the eastern part of the mine.",
					},

				},

				[2] = {
					name = "Justice for All", storageid = Storage.hiddenCityOfBeregar.JusticeForAll, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Nokmir told you that he is falsely accused of being a thief. You could help him by talking to Grombur about the case. Furthermore you should try to find that ring which belongs to Rerun.",
						[2] = "You should talking to Grombur about Nokmir.",
						[3] = "You should try to find that ring which belongs to Rerun everywhere in the mine.",
						[4] = "You have found Rerun's ring. Bring the ring to the emperor Rehal and talk to him about Nokmir.",
						[5] = "You informed emperor Rehal about your recent discoveries and he acquitted Nokmir of being a thief.",
						[6] = "You told Nokmir about his acquittal and he granted you access to the northern mine.",
					},

				},

				[3] = {
					name = "Pythius the Rotten", storageid = Storage.FirewalkerBoots, startvalue = 1, endvalue = 1,
					states = {
						[1] = "You won the battle against the malicious undead dragon Pythius the Rotten. He granted you firewalker boots as a reward.",
					},

				},

				[4] = {
					name = "Sweet as Chocolate Cake", storageid = Storage.hiddenCityOfBeregar.SweetAsChocolateCake, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Bake a Chocolate Cake and bring it to Bolfona at the bar.",
						[2] = "Report back to Frafnar by telling him about the mission.",
						[3] = "You told Frafnar that you did everything he asked you to do. You may now enter the western part of the mine.",
					},

				},

				[5] = {
					name = "The Good Guard", storageid = Storage.hiddenCityOfBeregar.TheGoodGuard, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Grombur asked you to get him a cask of dwarven brown ale. You heard that Boozer in Venore tried to brew some. Maybe you should pay him a visit.",
						[2] = "Grombur liked the ale and you are now allowed to enter his part of the mine.",
					},

				},

			},
		},

		[23] = {
			name = "The Ice Islands Quest", startstorageid = Storage.TheIceIslands.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Befriending the Musher", storageid = Storage.TheIceIslands.Mission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Find Sniffler the husky of Iskan. He should be somewhere north west of the town. He is probably marking his territory so you should be able to find his trace. Call him sniffler and feed him with meat.",
						[2] = "Tell Iskan that you found and feed Sniffler",
						[3] = "You are now a friend of Iskan and can ask him for a passage to Nibelor. You should ask Hjaern in Nibelor if you can help him.",
					},

				},

				[2] = {
					name = "Nibelor 1: Breaking the Ice", storageid = Storage.TheIceIslands.Mission02, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Chakoyas may use the ice for a passage to the west and attack Svargrond. Use the rocks at east of nibelor on at least three of these places and the chakoyas probably won't be able to pass the ice.",
						[2] = "You have broke 1 of 3 icepassages",
						[3] = "You have broke 2 of 3 icepassages",
						[4] = "You have broke 3 of 3 icepassages! Tell Hjaern your mission!",
						[5] = "You should ask Silfind if you can help her in some matters.",
					},

				},

				[3] = {
					name = "Nibelor 2: Ecological Terrorism", storageid = Storage.TheIceIslands.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Siflind send you to travel to a distant land to get ants from an Ant-Hill to perform ecological terrorism on some pirates on Tyrsung. Just use the jug on an anthill.",
						[2] = "Now head back to Svargrond and go to Buddel, the drunk sailor in southern Svargrond, and ask him to take you to Tyrsung. Now go all the way to the southern shores where you find a outpost. Go to the bottom deck and use the jug with the western mast",
						[3] = "Go tell Siflind that you released the ants and aks her for mission!",
					},

				},

				[4] = {
					name = "Nibelor 3: Artful Sabotage", storageid = Storage.TheIceIslands.Mission04, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Siflind gave you a Vial of Paint to use on some Baby Seals. Go back to Tyrsung and follow the shore from Buddel south. Use the Vial of Paint on three of these seals.",
						[2] = "Go tell Siflind that you painted the seals and aks her for mission!",
					},

				},

				[5] = {
					name = "Nibelor 4: Berserk Brewery", storageid = Storage.TheIceIslands.Mission05, startvalue = 1, endvalue = 6,
					states = {
						[1] = "The first things needed are 5 bat wings to brew a berserker elixir. Bring her them!",
						[2] = "The next items Siflind need are 4 bear paws. Bring her them!",
						[3] = "The next items Siflind need are 3 bonelord eyes. Bring her them!",
						[4] = "The next items Siflind need are 2 fish fins. Bring her them!",
						[5] = "The next item Siflind need is a green dragon scale. Bring her that!",
						[6] = "You helped Siflind to defend Svargrond. Now Nilsor need help, go ask him for mission.",
					},

				},

				[6] = {
					name = "Nibelor 5: Cure the Dogs", storageid = Storage.TheIceIslands.Mission06, startvalue = 1, endvalue = 8,
					states = {
						[1] = "To cure Nilsor dogs, bring him the 1st of 7 ingredients: a Part of the Sun Adorer Cactus. Only an ordinary kitchen knife will be precise enough to produce the ingredient weneed.",
						[2] = "To cure Nilsor dogs, bring him the 2nd of 7 ingredients: Geyser Water in a Waterskin. Use it on a geyser that is NOT active. The water of active geysers is far too hot.",
						[3] = "To cure Nilsor dogs, bring him the 3rd of 7 ingredients: Fine Sulphur. Use an ordinary kitchen spoon on an inactive lava hole.",
						[4] = "To cure Nilsor dogs, bring him the 4th of 7 ingredients: the Frostbite Herb. You can find it on mountain peaks. You will need to cut it with a fine kitchen knife.",
						[5] = "To cure Nilsor dogs, bring him the 5th of 7 ingredients: Purple Kiss Blossom. The purple kiss is a plant that grows in a place called jungle. You will have to use a kitchen knife to harvest its blossom.",
						[6] = "To cure Nilsor dogs, bring him the 6th of 7 ingredients: the Hydra Tongue. The hydra tongue is a common pest plant in warmer regions. You might find one in a shop.",
						[7] = "To cure Nilsor dogs, bring him the 7th of 7 ingredients: Spores of a Giant Glimmercap Mushroom. The giant glimmercap mushroom exists in caves and other preferably warm and humid places. Use an ordinary kitchen spoon on a mushroom to collectits spores.",
						[8] = "You found all ingredients to cure Nilsor dogs, ask him for mission. You can now travel by Dog Sleds to Inukaya.",
					},

				},

				[7] = {
					name = "The Secret of Helheim", storageid = Storage.TheIceIslands.Mission07, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Hjaern might have a mission for you. So maybe you go and talk to him.",
						[2] = "Hjaern send you to find someone in Svargrond who can give you a passage to Helheim and seek the reason for the unrest there.",
						[3] = "You discovered the necromantic altar and should report Hjaern about it.",
					},

				},

				[8] = {
					name = "The Contact", storageid = Storage.TheIceIslands.Mission08, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Get out of Nibelor and go to the Svargrond Explorer's Society. Ask Lurik for the mission.",
						[2] = "Get to the raider camp, then follow to the extreme south where you find lots of barbarians. Near the southern most coastline, try looking for the NPC Nor. Ask him about Memory Crystal.",
						[3] = "Go back to Lurik and deliver him the memory crystal.",
						[4] = "Give Lurik some time to evaluate the information (ca. 5min). Then talk to him again about your mission.",
					},

				},

				[9] = {
					name = "Formorgar Mines 1: The Mission", storageid = Storage.TheIceIslands.Mission09, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Find the entrance of the Formorgar Mines. Find some hint or someone who is willing to talk about what is going on there.",
						[2] = "You found a old and tattered written paper in a skeleton next to a Restless Soul, you can only make out a signature: Tylaf, apprentice of Hjaern. Ask Hjaern about Tylaf.",
					},

				},

				[10] = {
					name = "Formorgar Mines 2: Ghostwhisperer", storageid = Storage.TheIceIslands.Mission10, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Go back to the mine and ask the restless soul about his story.",
						[2] = "You already have listen to his story!",
					},

				},

				[11] = {
					name = "Formorgar Mines 3: The Secret", storageid = Storage.TheIceIslands.Mission11, startvalue = 1, endvalue = 2,
					states = {
						[1] = "The Cultists plan is to create a new demon army for their master to conquer the world. Hjaern and the other shamans must learn about it! Hurry before its too late.",
						[2] = "The Cultists plan is to create a new demon army for their master to conquer the world. Hjaern and the other shamans are already informed!",
					},

				},

				[12] = {
					name = "Formorgar Mines 4: Retaliation", storageid = Storage.TheIceIslands.Mission12, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Hjaern gave you a spirit charm of cold. Travel to the mines and find four special obelisks to mark them with the charm.",
						[2] = "1 of 4 obelisks are marked.",
						[3] = "2 of 4 obelisks are marked.",
						[4] = "3 of 4 obelisks are marked.",
						[5] = "Once all 4 obelisks are marked report back to Hjaern.",
						[6] = "You got the Norseman outfit and you have access to the Yakchal room deep in the Formorgar Mines.",
					},

				},

			},
		},

		[24] = {
			name = "The Inquisition", startstorageid = Storage.TheInquisition.Questline, startstoragevalue = 2,
			missions = {
				[1] = {
					name = "Mission 1: Interrogation", storageid = Storage.TheInquisition.Mission01, startvalue = 1, endvalue = 7,
					states = {
						[1] = "Your mission is to investigate the 5 guards in Thais regarding the Heretic behavior. Tim, Kulag, Grof, Miles and Walter are their names. If you do well you see a holy sprite on you.",
						[2] = "You investigated 1 of 5 guards in Thais.",
						[3] = "You investigated 2 of 5 guards in Thais.",
						[4] = "You investigated 3 of 5 guards in Thais.",
						[5] = "You investigated 4 of 5 guards in Thais.",
						[6] = "You investigated 5 of 5 guards in Thais. Get back to Thais and report your mission to Henricus.",
						[7] = "You investigated all guards in Thais.",
					},

				},

				[2] = {
					name = "Mission 2: Eclipse", storageid = Storage.TheInquisition.Mission02, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Henricus tells you to get The Witches' Grimoire, he sends you to Femor Hills where you can fly to the witches' mountain, say Eclipse to Uzon and he will take you there. Use the vial of holy water that he gives you on the big cauldron and open the chest to your left, then bring the witches' grimoire to Henricus.",
						[2] = "Find the witches' grimoire and bring it to Henricus.",
						[3] = "You already brought the witches' grimoire to Henricus.",
					},

				},

				[3] = {
					name = "Mission 3: Vampire Hunt", storageid = Storage.TheInquisition.Mission03, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Henricus wants you to find the Dwarfish Vampire Hunter, Storkus, located west of the Dwarf Bridge. It's good idea bring your 20 Vampire Dusts with you to save some time.",
						[2] = "Go Back to Storkus the Dwarf and ask for Mission.",
						[3] = "Now Storkus wants you to kill a vampire lord, The Count in the Green Claw Swamp, The Count is located near to the Blood Herb Quest. To summon The Count, you must use the coffin in the center of the room. Kill it and bring The Ring of the Count to Storkus.",
						[4] = "Kill The Count and bring his ring to Storkus the Dwarf and ask for Mission.",
						[5] = "Return to Henricus and tell him that you finished your job here.",
						[6] = "Get back to Thais and report your mission to Henricus.",
					},

				},

				[4] = {
					name = "Mission 4: The Haunted Ruin", storageid = Storage.TheInquisition.Mission04, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Henricus will gave you a Special Flask (vial of holy water). Go to Liberty Bay and use the vial on an old house. Use this vial of holy water on that spot to drive out the evil being.",
						[2] = "Kill the Pirate Ghost and get back to Thais and report your mission to Henricus.",
						[3] = "You already cleaned the abandoned and haunted house in Liberty, ask Henricus for mission.",
					},

				},

				[5] = {
					name = "Mission 5: Essential Gathering", storageid = Storage.TheInquisition.Mission05, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Henricus wants 20 Demonic Essences as a proof of your accomplishments.",
						[2] = "Now ask Henricus for outfit to get the Demon Hunter Outfit.",
						[3] = "You got the Demon Hunter Outfit! Ask Henricus for mission to unlock more addons.",
					},

				},

				[6] = {
					name = "Mission 6: The Demon Ungreez", storageid = Storage.TheInquisition.Mission06, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Henricus wants you to kill a demon called Ungreez. Head to Edron Hero Cave and go down a few levels.",
						[2] = "You killed Ungreez, report your mission to Henricus.",
						[3] = "You got the the first addon of Demon Hunter Outfit! Ask Henricus for mission to unlock more addons.",
					},

				},

				[7] = {
					name = "Mission 7: The Shadow Nexus", storageid = Storage.TheInquisition.Mission07, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Your mission is to go to the Demon Forge and slay seven of The Ruthless Seven Minions. The Demon Forge is located in the Edron Hero Cave, through a portal after the Vampire Shield Quest.",
						[2] = "You destroyed the shadow nexus! Get back to Thais and report your mission to Henricus.",
						[3] = "Now ask to Henricus for a outfit. He will give you the 2nd addon of the Demon Hunter Outfits.",
						[4] = "You got the the second addon of Demon Hunter Outfit! Go now to the reward room and choose one wisely!",
						[5] = "You have completed The Inquisition Quest! You can now buy the Blessing of the Inquisition!",
					},

				},

			},
		},

		[25] = {
			name = "The New Frontier", startstorageid = Storage.TheNewFrontier.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 01: New Land", storageid = Storage.TheNewFrontier.Mission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Ongulf sends you to explore the passage to the east of farmine.",
						[2] = "You have found the passage through the mountains and can report Ongulf about your success.",
						[3] = "You already reported Ongulf your success! Ask Ongulf for new mission!",
					},

				},

				[2] = {
					name = "Mission 02: From Kazordoon With Love", storageid = Storage.TheNewFrontier.Mission02, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Ongulf will tell you that he needs to send a message to the dwarves in Kazordoon. Travel there and then walk to the Dwarf Mines to the west. Cross the two rivers and find Melfar.",
						[2] = "Melfar gave you a Flask with Beaver Bait that you must use on the 3 trees(Trees will be marked on your map).",
						[3] = "You marked 1 of 3 trees with Beaver Bait in near the Dwarf Mines",
						[4] = "You marked 2 of 3 trees with Beaver Bait in near the Dwarf Mines",
						[5] = "You marked all 3 trees with Beaver Bait in near the Dwarf Mines. Return to talk to Melfar before heading back to Farmine.",
						[6] = "Return to Ongulf and report your mission!",
					},

				},

				[3] = {
					name = "Mission 03: Strangers in the Night", storageid = Storage.TheNewFrontier.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "You need to find the tribe which lives in the mountains. Find some vines in this mountain, climb up there and find out who is spying on us!",
						[2] = "Return to Ongulf and report your mission about primitive humans.",
						[3] = "You already reported Ongulf about primitive humans! Ask Ongulf for new mission!",
					},

				},

				[4] = {
					name = "Mission 04: The Mine Is Mine", storageid = Storage.TheNewFrontier.Mission04, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Head back to the levers and this time use the left one. Go North through the tunnel of Stone Golems. Kill the boss, Shard of Corruption at the end of the tunnel.",
						[2] = "You killed the Shard of Corruption. Return to Ongulf and report your mission!",
					},

				},

				[5] = {
					name = "Mission 05: Getting Things Busy", storageid = Storage.TheNewFrontier.Mission05, startvalue = 1, endvalue = 7,
					states = {
						[1] = "This mission consists of getting support from 6 people (King Tibianus in Thais, Leeland in Venore, Angus in Port Hope, Wyrdin in the Ivory Towers, Telas in Edron, Humgolf in Kazordoon  around Tibia. You need to ask for farmine and then you either need to Flatter, Threaten, Impress, Bluff, Reason or Plea him!",
						[2] = "You got support from 1 of 6 people, King Tibianus in Thais, Leeland in Venore, Angus in Port Hope, Wyrdin in the Ivory Towers, Telas in Edron and Humgolf in Kazordoon. You need to ask for farmine and then you either need to Flatter, Threaten, Impress, Bluff, Reason or Plea him!",
						[3] = "You got support from 2 of 6 people, King Tibianus in Thais, Leeland in Venore, Angus in Port Hope, Wyrdin in the Ivory Towers, Telas in Edron and Humgolf in Kazordoon. You need to ask for farmine and then you either need to Flatter, Threaten, Impress, Bluff, Reason or Plea him!",
						[4] = "You got support from 3 of 6 people, King Tibianus in Thais, Leeland in Venore, Angus in Port Hope, Wyrdin in the Ivory Towers, Telas in Edron and Humgolf in Kazordoon. You need to ask for farmine and then you either need to Flatter, Threaten, Impress, Bluff, Reason or Plea him!",
						[5] = "You got support from 4 of 6 people, King Tibianus in Thais, Leeland in Venore, Angus in Port Hope, Wyrdin in the Ivory Towers, Telas in Edron and Humgolf in Kazordoon. You need to ask for farmine and then you either need to Flatter, Threaten, Impress, Bluff, Reason or Plea him!",
						[6] = "You got support from 5 of 6 people, King Tibianus in Thais, Leeland in Venore, Angus in Port Hope, Wyrdin in the Ivory Towers, Telas in Edron and Humgolf in Kazordoon. You need to ask for farmine and then you either need to Flatter, Threaten, Impress, Bluff, Reason or Plea him!",
						[7] = "You got support from all needed people to help farmine! Return to Ongulf and report your mission!",
					},

				},

				[6] = {
					name = "Mission 06: Days Of Doom", storageid = Storage.TheNewFrontier.Mission06, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Go to Curos, leader of the Orcs, in the middle of the Zao Steppe in the north-east area of an Orc camp. Ask for a mission and accept it.",
						[2] = "Enter the ring of battle, close to Curos quarter. Face Mooh'Tah Master in a battle and survive for two minutes. Return to him after you have passed this test.",
						[3] = "You passed the test of Curos. Return to Ongulf and report your mission!",
					},

				},

				[7] = {
					name = "Mission 07: Messengers Of Peace", storageid = Storage.TheNewFrontier.Mission07, startvalue = 1, endvalue = 3,
					states = {
						[1] = "You now have to contact the Lizards, the real rulers of Zao. Find them, contact them, talk to them, scare them, bribe them, whatever.",
						[2] = "You have been trapped! Find a way out!",
						[3] = "You found the Lizards!",
					},

				},

				[8] = {
					name = "Mission 08: An Offer You Can't Refuse", storageid = Storage.TheNewFrontier.Mission08, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Take the boat at the northern of Dragonblaze Peaks to tournament Isle. Ask Zurak for a passage. There you'll learn anything you need to know about the great tournament. Ask there Chrak for the battle.",
						[2] = "You agreed the Offer.",
					},

				},

				[9] = {
					name = "Mission 09: Mortal Combat", storageid = Storage.TheNewFrontier.Mission09, startvalue = 1, endvalue = 3,
					states = {
						[1] = "You have to go into the Arena with another player, because 2 players are needed, at the same time, to enter. Choose your companion wisely!",
						[2] = "You have won! Report Chrak your mission about the battle.",
						[3] = "Go back to Farmine and talk to Ongulf about your mission.",
					},

				},

				[10] = {
					name = "Mission 10: New Horizons", storageid = Storage.TheNewFrontier.Mission10, startvalue = 1, endvalue = 1, description = "You now have permission to use the Magic Carpet on the mountain above Farmine, Cael now accepts more Tomes of Knowledge from you and you got the Warmaster Outfit!",
				},

				[11] = {
					name = "Tome of Knowledge Counter", storageid = Storage.TheNewFrontier.TomeofKnowledge, startvalue = 1, endvalue = 12,
					states = {
						[1] = "You brought the fist Tome of Knowledge to Cael. He learnt more about the lizard culture. Pompan will sell you dragon tapestries from now on.",
						[2] = "You brought the second Tome of Knowledge to Cael. He learnt more about the minotaur culture. Pompan will sell you minotaur backpacks from now on.",
						[3] = "You brought the third Tome of Knowledge to Cael. He learnt more about the last stand of the draken culture. Esrik will sell you lizard weapon rack from now on.",
						[4] = "You brought the fourth Tome of Knowledge to Cael. He learnt something interesting about a certain food that the lizardmen apparently prepare. Swolt will trade you a bunch of ripe rice for 10 rice balls from now on.",
						[5] = "You brought the fifth Tome of Knowledge to Cael. He learnt more about the last stand of the lizards in the South, Zzaion. Pompan will sell you lizard backpacks from now on.",
						[6] = "You brought the sixth Tome of Knowledge to Cael. He learnt a few things about the primitive human culture on this continent. Cael will sell you War Drums and Didgeridoo from now on.",
						[7] = "You brought the seventh Tome of Knowledge to Cael. He learnt something interesting about the Zao steppe. Now you to use the snake teleport at the peak of the mountain.",
						[8] = "You brought the eighth Tome of Knowledge to Cael. He learnt a few things about an illness. Now you can enter a corruption hole in the north-eastern end of Zao.",
						[9] = "You brought the ninth Tome of Knowledge to Cael. He learnt something interesting about the Draken origin. Esrik will buy lizard equipment from you now.",
						[10] = "You brought the tenth Tome of Knowledge to Cael. He learnt more about the last stand of the lizard dynasty. Now you can enter the Zao Palace. It is situated deep underground, below the mountain base of the Lizards.",
						[11] = "You brought the eleventh Tome of Knowledge to Cael. He learnt something interesting about dragons and their symbolism. You can buy a Dragon Statue from NPC Cael after you bring him a Red Lantern.",
						[12] = "You brought the twelfth Tome of Knowledge to Cael. He learnt something about reveals some of the power structures in Zao. Cael will now make a Dragon Throne for you after you bring him a Red Piece of Cloth. He will reward you with 5000 experience points for each extra tome you give to him.",
					},

				},

			},
		},

		[26] = {
			name = "The Postman Missions", startstorageid = Storage.postman.Mission01, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 01 - Check Postal Routes", storageid = Storage.postman.Mission01, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Kevin wants you to travel with Captain Bluebear to Carlin.",
						[2] = "Kevin wants you to travel with Uzon in Femor Hills to Edron.",
						[3] = "Kevin wants you to travel with Captain Seahorse to Venore.",
						[4] = "Kevin wants you to travel with Brodrosch to Cormaya",
						[5] = "You have checked the Postal Routes, report back to Kevin!",
						[6] = "You have reported back that you have completed the mission.",
					},

				},

				[2] = {
					name = "Mission 02 - Fix Mailbox", storageid = Storage.postman.Mission02, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Kevin wants you to fix one of their Mailboxes located on Folda with a crowbar.",
						[2] = "You have fixed the mailbox, report back to Kevin!",
						[3] = "You have reported back that you have completed the mission.",
					},

				},

				[3] = {
					name = "Mission 03 - Bill Delivery", storageid = Storage.postman.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Kevin wants you to deliver a bill to the stage magician David Brassacres. He's hiding from his creditors somewhere in Venore.",
						[2] = "You have delivered the bill to the stage magician David Brassacres, report back to Kevin!",
						[3] = "You have reported back that you have completed the mission.",
					},

				},

				[4] = {
					name = "Mission 04 - Aggressive Dogs", storageid = Storage.postman.Mission04, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Kevin has asked you to deliver 20 Bones to him.",
						[2] = "You have delivered 20 Bones to Kevin.",
					},

				},

				[5] = {
					name = "Mission 05 - Present Delivery", storageid = Storage.postman.Mission05, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Kevin has asked you to retrieve the present behind the door on the lower right side of his room and deliver it to Dermot in Fibula.",
						[2] = "Deliver the present to Dermot in Fibula.",
						[3] = "You have delivered the present to Dermot, report back to Kevin!",
						[4] = "You have reported back that you have completed the mission.",
					},

				},

				[6] = {
					name = "Mission 06 - New Uniforms", storageid = Storage.postman.Mission06, startvalue = 1, endvalue = 13,
					states = {
						[1] = "Kevin has asked you to travel to Venore and negotiate with Hugo for new uniforms.",
						[2] = "Hugo said that his dog ate the last dress pattern they used and he has no clue where Kevin Postner got it from, go ask Kevin.",
						[3] = "Kevin wants you to ask the great Technomancer Talphion in Kazordoon for the technical details.",
						[4] = "Talphion will send a copy to Kevin, report back to Kevin.",
						[5] = "Kevin wants you to ask Queen Eloise of Carlin for the perfect colours.",
						[6] = "Queen Eloise said she will send some color samples via mail to Kevin, report back to Kevin.",
						[7] = "Kevin has asked you to go to Noodles and find out what he dislikes the most: mouldy cheese, a piece of fur or a banana skin.",
						[8] = "Noodles seems to like banana skin, check if he likes dirty fur.",
						[9] = "Noodles seems to like dirty fur, check if he likes mouldy cheese.",
						[10] = "Noodles dislikes mouldy cheese! Report back to Kevin.",
						[11] = "Kevin wants you to tell Hugo that they order those uniforms.",
						[12] = "Hugo has agreed to make the uniforms, report back to Kevin!",
						[13] = "You have reported back that you have completed the mission.",
					},

				},

				[7] = {
					name = "Mission 07 - Measurements", storageid = Storage.postman.Mission07, startvalue = 1, endvalue = 8,
					states = {
						[1] = "Kevin wants you to bring him the measurements of Benjamin, Lokur, Dove, Liane, Chrystal and Olrik.",
						[2] = "You have received the measurements from 1 of 6 post officers.",
						[3] = "You have received the measurements from 2 of 6 post officers.",
						[4] = "You have received the measurements from 3 of 6 post officers.",
						[5] = "You have received the measurements from 4 of 6 post officers.",
						[6] = "You have received the measurements from 5 of 6 post officers.",
						[7] = "You have received all measurements, report back to Kevin!",
						[8] = "You have reported back that you have completed the mission.",
					},

				},

				[8] = {
					name = "Mission 08 - Missing Courier", storageid = Storage.postman.Mission08, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Kevin wants you to find the missing courier Waldo or at least his posthorn.",
						[2] = "You have found Waldos posthorn.",
						[3] = "You have reported back that you have completed the mission.",
					},

				},

				[9] = {
					name = "Mission 09 - Dear Santa", storageid = Storage.postman.Mission09, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Kevin wants you to deliver som letters to Santa Claus on Vega.",
						[2] = "You have retrieved the letters, deliver them to Santa Claus on Vega.",
						[3] = "You have delivered the letters to Santa Claus on Vega.",
						[4] = "You have reported back that you have completed the mission.",
					},

				},

				[10] = {
					name = "Mission 10 - Mintwallin", storageid = Storage.postman.Mission10, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Kevin wants you to deliver a letter  to Markwin, king of Mintwallin from his mother.",
						[2] = "You have delivered the letter to Markwin.",
						[3] = "You have reported back that you have completed the mission.",
					},

				},

				[11] = {
					name = "Postman Rank", storageid = Storage.postman.Rank, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Assistant Postman",
						[2] = "Postman",
						[3] = "Grand Postman",
						[4] = "Grand Postman for Special Operations",
						[5] = "Arch Postman",
					},

				},

			},
		},

		[27] = {
			name = "The Shattered Isles", startstorageid = Storage.TheShatteredIsles.DefaultStart, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "A Djinn in Love", storageid = Storage.TheShatteredIsles.ADjinnInLove, startvalue = 1, endvalue = 5,
					states = {
						[1] = "You need to return to Marina and ask her for a date with Ocelus.",
						[2] = "You need to return to Ocelus with the bad news.",
						[3] = "Ocelus told you to get a poem for him, if you didn't buy one already, head to Ab'Dendriel and buy a Love Poem from Elvith.",
						[4] = "You need to go recite the poem to Marina and impress her with the Djinn's romantic and poetic abilities.",
						[5] = "After reciting the poem to Marina, she decided to date Ocelus and release Ray Striker from her spell.",
					},

				},

				[2] = {
					name = "A Poem for the Mermaid", storageid = Storage.TheShatteredIsles.APoemForTheMermaid, startvalue = 1, endvalue = 3,
					states = {
						[1] = "You need to find the man-stealing mermaid and try to break her spell over poor Raymond, the mermaid Marina is near the northern coast of the island.",
						[2] = "You discovered that she does in fact have a spell on him, and will not release him unless someone better comes along.",
						[3] = "You are a true master in reciting love poems now. No mermaid will be able to resist if you ask for a date!",
					},

				},

				[3] = {
					name = "Access to Goroma", storageid = Storage.TheShatteredIsles.AccessToGoroma, startvalue = 1, endvalue = 1, description = "After helping Jack Fate to collect the 30 woodpieces, Jack Fate in Liberty Bay will bring you to Goroma.",
				},

				[4] = {
					name = "Access to Laguna Island", storageid = Storage.TheShatteredIsles.AccessToLagunaIsland, startvalue = 1, endvalue = 1, description = "After arranging a date for Marina and Ocelus, you are allowed to use Marina's sea turtles. They will bring you to the idyllic Laguna Islands.",
				},

				[5] = {
					name = "Access to Meriana", storageid = Storage.TheShatteredIsles.AccessToMeriana, startvalue = 1, endvalue = 1, description = "After earning the trust of the governor's daughter Eleonore, Captain Waverider in Liberty Bay will bring you to Meriana if you tell him the secret codeword 'peg leg'.",
				},

				[6] = {
					name = "The Counterspell", storageid = Storage.TheShatteredIsles.TheCounterspell, startvalue = 1, endvalue = 4,
					states = {
						[1] = "You have begun Chondur's ritual. Bring him a fresh dead chicken so that he can begin to create a counterspell which will allow you to pass the magical barrier on Goroma.",
						[2] = "You have begun Chondur's ritual. Bring him a fresh dead rat so that he can continue creating a counterspell which will allow you to pass the magical barrier on Goroma.",
						[3] = "You have begun Chondur's ritual. Bring him a fresh dead black sheep so that he can complete his counterspell which will allow you to pass the magical barrier on Goroma.",
						[4] = "You may pass the energy barrier on Goroma. The counterspell Chondur created for you with his ritual will allow you to withstand the evil magic of the cultist.",
					},

				},

				[7] = {
					name = "The Errand", storageid = Storage.TheShatteredIsles.TheErrand, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You told Eleonore to run a small errand. Deliver the 200 gold pieces she gave to the herbalist Charlotta in the south-western part of Liberty Bay.",
						[2] = "You delivered the gold to Charlotta. Return to Eleonore and tell her the secret password: peg leg",
					},

				},

				[8] = {
					name = "The Governor's Daughter", storageid = Storage.TheShatteredIsles.TheGovernorDaughter, startvalue = 1, endvalue = 3,
					states = {
						[1] = "You promised to find Eleonore's lost ring. She told you that a parrot stole it from her dressing table and flew to the nearby mountains. You might need a rake to retrieve the ring.",
						[2] = "You found the ring. Return it to Eleonore.",
						[3] = "You returned the ring to Eleonore.",
					},

				},

			},
		},

		[28] = {
			name = "The Thieves Guild", startstorageid = Storage.thievesGuild.Quest, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 1: Ivory Poaching", storageid = Storage.thievesGuild.Mission01, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Dorian wants you to collect 10 elephant tusks and deliver them to him.",
						[2] = "You delivered the ten tusks to Dorian.",
					},

				},

				[2] = {
					name = "Mission 2: Burglary", storageid = Storage.thievesGuild.Mission02, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Dorian wants you to steal a vase from Sarina, the owner of Carlin's general store.",
						[2] = "You have stolen the vase, report back to Dorian!",
						[3] = "You have delivered the stolen vase to Dorian, ask him for a new mission!",
					},

				},

				[3] = {
					name = "Mission 3: Invitation", storageid = Storage.thievesGuild.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your task is to somehow convince Oswald to hand you an invitation to the king's ball.",
						[2] = "You have received the invitation to the King's ball, report back to Dorian!",
						[3] = "You have delivered the invitation to Dorian, ask him for a new mission!",
					},

				},

				[4] = {
					name = "Mission 4: Bridge Robbery", storageid = Storage.thievesGuild.Mission04, startvalue = 1, endvalue = 8,
					states = {
						[1] = "Dorian wants you to find a forger in the outlaw camp, go talk to Snake eye.",
						[2] = "Snake Eye told you to visit Ahmet in Ankrahmun.",
						[3] = "Ahmet told you that he will only help a friend and asked you to kill at least one Nomad.",
						[4] = "You have killed a Nomad, go back to Ahmet!",
						[5] = "You have received the forged documents from Ahmet, next is to get a disguise from Percybald in Venore!",
						[6] = "You have received the dwarf disguise from Percybald. Now go do the deal with Nurik.",
						[7] = "You have traded the forged documents for the painting, report back to Dorian.",
						[8] = "You have delivered the painting to Dorian, ask him for a new mission!",
					},

				},

				[5] = {
					name = "Mission 5: Enforcing Debts", storageid = Storage.thievesGuild.Mission05, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your mission is to travel to Tiquanda. Fina a hidden smuggler cave to the north of Port Hope and try to retrieve the valuable goblet which Dorian is looking for. Once you got it, bring it to him.",
						[2] = "You have delivered the golden goblet to Dorian, ask him for a new mission!",
					},

				},

				[6] = {
					name = "Mission 6: Fishnapping", storageid = Storage.thievesGuild.Mission06, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Dorian wants you to fishnap Theodore Loveless' fish, first you need to get the key to his room. Talk to Chantalle in Liberty Bay.",
						[2] = "You have received the key for Theodore Loveless' room, time to fishnap his fish!",
						[3] = "You have fishnapped Theodore Loveless' fish, deliver it to Dorian.",
						[4] = "You have delivered the fish to Dorian, ask him for a new mission!",
					},

				},

				[7] = {
					name = "Mission 7: Blackmail", storageid = Storage.thievesGuild.Mission07, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your current task is to find compromising information about one of the Venore city guards, no matter how. A good starting point might be in their barracks.",
						[2] = "You have delivered the compromising letter to Dorian, ask him for a new mission!",
					},

				},

				[8] = {
					name = "Mission 8: Message", storageid = Storage.thievesGuild.Mission08, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Dorian wants you to deliver a message to his competitors in the dark cathedral.",
						[2] = "You have put up the message, report back to Dorian.",
						[3] = "You have reported back that you have completed the mission, Dorian now allows you to trade with Black Bert.",
					},

				},

			},
		},

		[29] = {
			name = "The Travelling Trader Quest", startstorageid = Storage.TravellingTrader.Mission01, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 1: Trophy", storageid = Storage.TravellingTrader.Mission01, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your first mission for becoming a recognized trader is to bring the traveling salesman Rashid a Deer Trophy.",
						[2] = "You have completed this mission. Talk with Rashid to continue.",
					},

				},

				[2] = {
					name = "Mission 2: Delivery", storageid = Storage.TravellingTrader.Mission02, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Your mission is to get the package from Willard the weapon dealer at Edron.",
						[2] = "Willard forgot to pick it up from Snake Eye at Outlaw Camp. So he wants you to go and pick it up from Snake Eye.",
						[3] = "Take the package just next door.",
						[4] = "Now bring back the package to Rashid.",
						[5] = "You have completed this mission. Talk with Rashid to continue.",
					},

				},

				[3] = {
					name = "Mission 3: Cheese", storageid = Storage.TravellingTrader.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Rashid wants you to pick his special order from Miraia in Darashia. But you have to be quick, Scarab cheese can rot really fast in high temperature.",
						[2] = "Now quickly bring back the Scarab cheese to Rashid.",
						[3] = "You have completed this mission. Talk with Rashid to continue.",
					},

				},

				[4] = {
					name = "Mission 4: Vase", storageid = Storage.TravellingTrader.Mission04, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Rashid have ordered a special elven vase from Briasol in Ab'Dendriel. He asks you to buy it from Briasol and bring it back.\nBut you should be carefully, since the vase is very fragile.",
						[2] = "Now carefully bring the vase back to Rashid.",
						[3] = "You have completed this mission. Talk with Rashid to continue.",
					},

				},

				[5] = {
					name = "Mission 5: Make a deal", storageid = Storage.TravellingTrader.Mission05, startvalue = 1, endvalue = 3,
					states = {
						[1] = "This time, Rashid is testing your trading skills to buy a Crimson Sword from Uzgod. But it have to be less than 400 gold coins and the quality has to be perfect.",
						[2] = "Now bring the sword back to Rashid.",
						[3] = "You have completed this mission. Talk with Rashid to continue.",
					},

				},

				[6] = {
					name = "Mission 6: Goldfish", storageid = Storage.TravellingTrader.Mission06, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Rashid wants you to bring him a Goldfish Bowl.",
						[2] = "You have completed this mission. Talk with Rashid to continue.",
					},

				},

				[7] = {
					name = "Mission 7: Declare", storageid = Storage.TravellingTrader.Mission07, startvalue = 1, endvalue = 1,
					states = {
						[1] = "Rashid has declare you as one of his recognized traders, and now you are able to trade with him anytime..",
					},

				},

			},
		},

		[30] = {
			name = "The Queen of the Banshees", startstorageid = Storage.QueenOfBansheesQuest.FirstSeal, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "The Hidden Seal", storageid = Storage.QueenOfBansheesQuest.FirstSeal, startvalue = 1, endvalue = 1, description = "You broke the first seal.",
				},

				[2] = {
					name = "The Seal of Logic", storageid = Storage.QueenOfBansheesQuest.SixthSeal, startvalue = 1, endvalue = 1, description = "You broke the sixth seal.",
				},

				[3] = {
					name = "The Seal of True Path", storageid = Storage.QueenOfBansheesQuest.FifthSeal, startvalue = 1, endvalue = 1, description = "You broke the fifth seal.",
				},

				[4] = {
					name = "The Seal of Sacrifice", storageid = Storage.QueenOfBansheesQuest.FourthSeal, startvalue = 1, endvalue = 1, description = "You broke the fourth seal.",
				},

				[5] = {
					name = "The Seal of Demonrage", storageid = Storage.QueenOfBansheesQuest.ThirdSeal, startvalue = 1, endvalue = 1, description = "You broke the third seal.",
				},

				[6] = {
					name = "The Plague Seal", storageid = Storage.QueenOfBansheesQuest.SecondSeal, startvalue = 1, endvalue = 1, description = "You broke the second seal.",
				},

				[7] = {
					name = "All Seals", storageid = Storage.QueenOfBansheesQuest.LastSeal, startvalue = 1, endvalue = 1, description = "You broke all the seals.",
				},

			},
		},

		[31] = {
			name = "The Ultimate Challenges", startstorageid = Storage.SvargrondArena.QuestLogGreenhorn, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Barbarian Arena - Greenhorn Mode", storageid = Storage.SvargrondArena.QuestLogGreenhorn, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You have to defeat all enemies in this mode.",
						[2] = "You have defeated all enemies in this mode.",
					},

				},

				[2] = {
					name = "Barbarian Arena - Scrapper Mode", storageid = Storage.SvargrondArena.QuestLogScrapper, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You have to defeat all enemies in this mode.",
						[2] = "You have defeated all enemies in this mode.",
					},

				},

				[3] = {
					name = "Barbarian Arena - Warlord Mode", storageid = Storage.SvargrondArena.QuestLogWarlord, startvalue = 1, endvalue = 2,
					states = {
						[1] = "You have to defeat all enemies in this mode.",
						[2] = "You have defeated all enemies in this mode.",
					},

				},

			},
		},

		[32] = {
			name = "The White Raven Monastery", startstorageid = Storage.WhiteRavenMonasteryQuest.QuestLog, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Access to the Isle of Kings", storageid = Storage.WhiteRavenMonasteryQuest.Passage, endvalue = 1,
					states = {
						[1] = "You are a friend of Dalbrect. Since you returned his family brooch he will sail you to the Isle of Kings unless you do something stupid.",
					},

				},

				[2] = {
					name = "The Investigation", storageid = Storage.WhiteRavenMonasteryQuest.Diary, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Investigate the catacombs. Abbot Costello should be interested in information about brother Fugio.",
						[2] = "You returned Fugio's Diary. Costello was very thankful about your help and gave you a blessed ankh as reward.",
					},

				},

			},
		},

		[33] = {
			name = "Tibia Tales", startstorageid = Storage.TibiaTales.DefaultStart, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "To Appease the Mighty", storageid = Storage.TibiaTales.ToAppeaseTheMightyQuest, stargtvalue = 0, endvalue = 4,
					states = {
						[1] = "Kazzan sent you to talk with Ubaid and Umar to offer an appeasement treaty to the Djinn races. Talk to Umar first.",
						[2] = "Umar said he won't be part of Kazzan's plans. Now you need to try with Ubaid.",
						[3] = "Umar and Ubaid said they won't be part of those plans. Return to Kazzan and collect your reward.",
						[4] = "You have completed the quest!",
					},

				},

				[2] = {
					name = "Arito's Task", storageid = Storage.TibiaTales.AritosTask, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Arito asked you to make a peace agreement between him and the Nomads.",
						[2] = "Return to Arito and tell him the good news.",
						[3] = "Now Arito are safe and you have acess to Nomads Cave.",
					},

				},

				[3] = {
					name = "Against the Spider Cult", storageid = Storage.TibiaTales.AgainstTheSpiderCult, startvalue = 1, endvalue = 6,
					states = {
						[1] = "Daniel Steelsoul in Edron wants you to infiltrate the Edron Orc Cave and destroy 4 Spider Eggs.",
						[2] = "You destroyed 1 of 4 Spider Eggs in the Edron Orc Cave",
						[3] = "You destroyed 2 of 4 Spider Eggs in the Edron Orc Cave",
						[4] = "You destroyed 3 of 4 Spider Eggs in the Edron Orc Cave",
						[5] = "You destroyed all Spider Eggs in the Edron Orc Cave, report back to Daniel Steelsoul!",
						[6] = "You have completed the Quest!",
					},

				},

				[4] = {
					name = "An Interest In Botany", storageid = Storage.TibiaTales.AnInterestInBotany, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Rabaz in Farmine asked you to collect samples from rare plant specimen in Zao. Go to the storage room to the west and receive the Botany Almanach. Find then the Giant Dreadcoil and use your Obsidian Knife on it to obtain a sample.",
						[2] = "Now you must find the second plant, a Giant Verminous and use your Obsidian Knife on it to obtain a sample.",
						[3] = "You found the two samples, report back to Rabaz in Farmine!",
						[4] = "You have completed the Quest!",
					},

				},

				[5] = {
					name = "Graves Sanctified - In Progress", storageid = Storage.TibiaTales.RestInHallowedGround.HolyWater, startvalue = 1, endvalue = 15, description = function(player)return string.format("You sanctified %d of 15 graves.", (math.max(player:getStorageValue(Storage.TibiaTales.RestInHallowedGround.HolyWater), 0))) end,
				},

				[6] = {
					name = "Into the Bone Pit", storageid = Storage.TibiaTales.IntoTheBonePit, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Search the Cursed Bone Pit in the dungeon north of Thais and dig for a well-preserved human bone for Muriel.",
						[2] = "You have found a desecrated bone for Muriel.",
						[3] = "You helped Muriel to obtain a desecrated bone.",
					},

				},

				[7] = {
					name = "Rest in Hallowed Ground", storageid = Storage.TibiaTales.RestInHallowedGround.Questline, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Go to the white raven monastery and ask for some holy water for Amanda.",
						[2] = "You got the holy water from the white raven monastery. Go back to Amanda and report about your mission.",
						[3] = "Sanctify every single grave at the unholy graveyard north of Edron with the holy water.",
						[4] = "You have sanctified all graves at the unholy graveyard of Edron. Report about your mission at Amanda.",
						[5] = "You helped Amanda by sanctifying the cursed graveyard of Edron.",
					},

				},

				[8] = {
					name = "The Exterminator", storageid = Storage.TibiaTales.TheExterminator, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Padreia in Carlin asked you to exterminate the slimes in the sewers of Carlin by poisoning their spawn pool.",
						[2] = "You poisoned the spawn pool of the slimes in the sewers of Carlin. Report to Padreia about your mission.",
						[3] = "You successfully helped Padreia in saving Carlin from a slimy disease.",
					},

				},

				[9] = {
					name = "The Ultimate Booze", storageid = Storage.TibiaTales.ultimateBoozeQuest, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Boozer in Vernore asked you to bring him some special dwarven brown ale. You may find some in the brewery in Kazordoon.",
						[2] = "You found the special dwarven brown ale. Bring it to Boozer in Vernore.",
						[3] = "You have completed The Ultimate Booze Quest!",
					},

				},

			},
		},

		[34] = {
			name = "Unnatural Selection", startstorageid = Storage.UnnaturalSelection.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 1: Skulled", storageid = Storage.UnnaturalSelection.Mission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Your mission is to find the Holy Skull. It is in a cave in the northern orc settlement, which is located north-west on the Zao Steppe.",
						[2] = "You found the Holy Skull. Retrieve it to Lazaran in the Zao Mountains.",
						[3] = "You brought Lazaran the Holy Skull. Ask him for new mission!",
					},

				},

				[2] = {
					name = "Mission 2: All Around the World", storageid = Storage.UnnaturalSelection.Mission02, startvalue = 1, endvalue = 13,
					states = {
						[1] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Edron.",
						[2] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Ab'dendriel.",
						[3] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Femor Hills.",
						[4] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Darashia",
						[5] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Ankrahmun",
						[6] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Port Hope",
						[7] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Liberty Bay",
						[8] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Yalahar",
						[9] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Svargrond",
						[10] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Thais",
						[11] = "You received the Skull of a Caveman and need to explore the world, letting the skull see everything. You need to stand at the highest place of Carlin",
						[12] = "You visited all the highest places with the skull. Turn the skull back to Lazaran and report him your mission!",
						[13] = "You turned the skull already back to Lazaran. Ask him for new mission!",
					},

				},

				[3] = {
					name = "Mission 3: Dance Dance Evolution", storageid = Storage.UnnaturalSelection.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Lazaran told you to go to Ulala, who is located above Lazaran.",
						[2] = "Ulala told you to dance to please their god Krunus. On the south mountain in the camp you will find the Krunus altar, there are lots of leaves on the ground.",
						[3] = "You solved the dance. Head back to Ulala and report your mission!",
					},

				},

				[4] = {
					name = "Mission 4: Bits and Pieces", storageid = Storage.UnnaturalSelection.Mission04, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Now the god Krunus is pleased, another god called Pandor needs to be pleased. Ulala wants you to collect 5 Orc Teeth, 5 Minotaur leathers and 5 Lizard Leathers. Bring them to her.",
						[2] = "You brought Ulala 5 Orc Teeth, 5 Minotaur leathers and 5 Lizard Leathers. Ask her for new mission!",
					},

				},

				[5] = {
					name = "Mission 5: Ray of Light", storageid = Storage.UnnaturalSelection.Mission05, startvalue = 1, endvalue = 3,
					states = {
						[1] = "The third god which needs to be pleased is called Fasuon. Find the great crystal on top of mountain of Fasuon and pray there for his support!",
						[2] = "You already prayed at the great crystal. Report it to Ulala",
						[3] = "You have reported back to Ulala that you have completed the mission.",
					},

				},

				[6] = {
					name = "Mission 6: Firewater Burn", storageid = Storage.UnnaturalSelection.Mission06, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Speak with Lazaran and tell the gods are pleased now.",
						[2] = "Bring Lazaran a Pot of brown water for a party after the great hunt.",
						[3] = "You brought Lazaran the beer and got a Serpent Crest as reward!",
					},

				},

			},
		},

		[35] = {
			name = "What a foolish Quest", startstorageid = Storage.WhatAFoolishQuest.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "What a foolish Quest - Tasks of a Fool", storageid = Storage.WhatAFoolishQuest.Mission1, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Cut a flower at the Whiteflower Temple south of Thais. Then report to Bozo about your mission.",
						[2] = "You have finished your first mission and should ask Bozo for the next mission.",
					},

				},

				[2] = {
					name = "What a foolish Quest - That stinks!", storageid = Storage.WhatAFoolishQuest.Mission2, startvalue = 1, endvalue = 2,
					states = {
						[1] = "It sometimes stinks to be a fool. Collect some noxious fumes from a recently slain slime with the special vial. Then report to Bozo about your mission.",
						[2] = "You have finished your second mission and should ask Bozo for the next mission.",
					},

				},

				[3] = {
					name = "What a foolish Quest - A Piece of Cake", storageid = Storage.WhatAFoolishQuest.Mission3, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Get 12 pies from Mirabell in Edron. Then report to Bozo about your mission.",
						[2] = "You have finished your third mission and should ask Bozo for the next mission.",
					},

				},

				[4] = {
					name = "What a foolish Quest - Fool Spirits", storageid = Storage.WhatAFoolishQuest.Mission4, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Get 18 vials of wine for Bozo. Then report to Bozo about your mission.",
						[2] = "Exchange the crates in front of Xodet's house and return to Bozo with the swapped crate.",
						[3] = "You have finished your fourth mission and should ask Bozo for the next mission.",
					},

				},

				[5] = {
					name = "What a foolish Quest - Watch out for the foolish", storageid = Storage.WhatAFoolishQuest.Mission5, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Steal the magic watch from the Triangle Tower west of Jakundaf Desert. Then report to Bozo about your mission.",
						[2] = "Use the magic watch to steal the beard of the sleeping dwarven emperor.",
						[3] = "You have already finished five missions for that fool. You should definitely talk to Bozo about your jester outfit now!",
					},

				},

				[6] = {
					name = "What a foolish Quest - The queen of farts", storageid = Storage.WhatAFoolishQuest.Mission6, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Get Bozo 4 pieces of minotaur leather.",
						[2] = "Get Bozo a piece of giant spider silk.",
						[3] = "Ask Bozo about your mission, he might be finished with the whoopee cushion by now.",
						[4] = "Place the whoopee cushion on the queen's throne in Carlin by using the cushion with the throne.",
						[5] = "You have finished your sixth mission and should ask Bozo for the next mission.",
					},

				},

				[7] = {
					name = "What a foolish Quest - For your mice only", storageid = Storage.WhatAFoolishQuest.Mission7, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Get the toy mouse of Queen Eloise's cat and show it to Carina, the jeweller in Venore, to scare her.",
						[2] = "You have finished your seventh mission and should ask Bozo for the next mission.",
					},

				},

				[8] = {
					name = "What a foolish Quest - Smoking is a foolish thing", storageid = Storage.WhatAFoolishQuest.Mission8, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Gather some easily inflammable sulphur using a spoon on an inactive lava hole.",
						[2] = "You brought Bozo the sulphur. Now cut him some leaves of the jungle dweller bush with a kitchen knife.",
						[3] = "You have gathered the ordered ingredients and should ask Bozo for the next mission.",
						[4] = "Deliver the exploding cigar to Theodore Loveless in Liberty Bay.",
						[5] = "You have finished your eighth mission and should ask Bozo for the next mission.",
					},

				},

				[9] = {
					name = "What a foolish Quest - A fool's bargain", storageid = Storage.WhatAFoolishQuest.Mission9, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Bozo wants you to fill a vial with the blood of a stalker. Use the vial on a slain stalker immediately after his death. Then report to Bozo about your mission.",
						[2] = "Bozo wants you to fill a vial with the ink of a quara constrictor. Use the vial on a slain constrictor immediately after its death. Then report to Bozo about your mission.",
						[3] = "You have gathered the ordered ingredients and should ask Bozo for the next mission.",
						[4] = "Order 2000 steel shields from Sam. Sign his contract with the magic ink.",
						[5] = "You have finished your ninth mission and should ask Bozo for the next mission.",
					},

				},

				[10] = {
					name = "What a foolish Quest - A sweet surprise", storageid = Storage.WhatAFoolishQuest.Mission10, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Deliver a cookie to Avar Tar, Simon, Ariella, Lorbas, King Markwin, Hjaern, Wyda, Hairycles, the orc king and EITHER Yaman OR Nah'Bob. Then report to Bozo about the mission.",
						[2] = "You have finished your tenth mission and should ask Bozo for the next mission.",
					},

				},

				[11] = {
					name = "What a foolish Quest - The final foolishness", storageid = Storage.WhatAFoolishQuest.Mission11, startvalue = 1, endvalue = 4,
					states = {
						[1] = "Gather 5 pieces of white cloth for Bozo. Then report about your mission.",
						[2] = "Travel to Darama and climb the highest point of the Plague Spike to give these pieces of white cloth an old and worn look. Some ancient altar should suit your needs best - use the white cloth on it.",
						[3] = "Use your mummy disguise to scare the caliph Kazzan in Darashia. DON'T use the disguise too early or you will fail the quest.",
						[4] = "You have finished all of Bozo's missions and you are a complete fool now. Yay!",
					},

				},

				[12] = {
					name = "What a foolish Quest - To become a complete fool", storageid = Storage.WhatAFoolishQuest.JesterOutfit, startvalue = 4, endvalue = 4,
					states = {
						[4] = "Now that you have a basic outfit, you should talk to Bozo about your missions to gain further rewards.",
					},

				},

			},
		},

		[36] = {
			name = "Wrath of the Emperor", startstorageid = Storage.WrathoftheEmperor.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 01: Catering the Lions Den", storageid = Storage.WrathoftheEmperor.Mission01, startvalue = 1, endvalue = 3,
					states = {
						[1] = "You must bring Zalamon 3 nails and a piece of wood so that he can make a Marked Crate for you.",
						[2] = "Go to the tunnel in eastern Muggy Plains and reach the other side. Try to hide in the dark and avoid being seen at all by using the crate. After that you need to find the rebel hideout and talk to their leader Chartan.",
						[3] = "You found the leader of the rebel Chartan and reported him about Zalamon. Ask him for new mission!",
					},

				},

				[2] = {
					name = "Mission 02: First Contact", storageid = Storage.WrathoftheEmperor.Mission02, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Chartan needs you to reactivate the teleport to the Muggy Plains. Head downstairs and into the temple and craft material to repair the teleport. To do this you will need some tools to improvise.",
						[2] = "As you give the coal into the pool the corrupted fluid begins to dissolve, leaving purified, refreshing water. The teleporter is reactivated. Report back to Chartan.",
						[3] = "Report back to Zalamon for the next mission.",
					},

				},

				[3] = {
					name = "Mission 03: The Keeper", storageid = Storage.WrathoftheEmperor.Mission03, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Zalamon gives you a Flask of Plant Poison to destroy plants in the garden of the Emperor to lure out and kill The Keeper to get his tail. The garden is southeast of the rebel hideout.",
						[2] = "You killed the Keeper and got his tail. Bring it to Zalamon.",
						[3] = "You brought the tail of the Keeper to Zalamon and completed the mission. Ask for the next mission.",
					},

				},

				[4] = {
					name = "Mission 04: Sacrament of the Snake", storageid = Storage.WrathoftheEmperor.Mission04, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Zalamon now wants you to go to Deeper Banuta and get an Ancient Sceptre that will help in the fight against the emperor. On each floor under Deeper Banuta you collect a sceptre part from a Ghost of a Priest. On the 4th and final floor you need to assemble the sceptre..",
						[2] = "After you've assembled the Snake Sceptre and fought your way back out, head back to Zalamon and give it to him.",
						[3] = "You brought the Snake Sceptre to Zalamon and completed the mission. Ask for the next mission.",
					},

				},

				[5] = {
					name = "Mission 05: New in Town", storageid = Storage.WrathoftheEmperor.Mission05, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Zalamon tells you that you have to go inside the city. From the rebel hideout go out to the gray road and follow it to the southwest. Find the Gate Guardian and ask him for a mission to enter the city.",
						[2] = "Now you only have to walk west until you find Zlak inside the big green building.",
						[3] = "You went deep inside the city to find Zlak and completed the mission. Ask for the next mission.",
					},

				},

				[6] = {
					name = "Mission 06: The Office Job", storageid = Storage.WrathoftheEmperor.Mission06, startvalue = 0, endvalue = 4, description = function(player)return string.format("Explore the area where Zlak is to find Lizard Magistratus and kill 4 of them. You currently have %d killed. Report back to Zlak if you finished it.", (math.max(player:getStorageValue(Storage.WrathoftheEmperor.Mission06), 0))) end,
				},

				[7] = {
					name = "Mission 07: A Noble Cause", storageid = Storage.WrathoftheEmperor.Mission07, startvalue = 0, endvalue = 6, description = function(player)return string.format("Explore the area where Zlak is to find Lizard Noble and kill 6 of them. You currently have %d killed. Report back to Zlak if you finished it.", (math.max(player:getStorageValue(Storage.WrathoftheEmperor.Mission07), 0))) end,
				},

				[8] = {
					name = "Mission 08: Uninvited Guests", storageid = Storage.WrathoftheEmperor.Mission08, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your mission is to reach your rebel contact Zizzle in the imperial palace. You need to take the old escape tunnel that leads from the abandoned basement in the north of the ministry to a lift that ends somewhere in the palace.",
						[2] = "You have reached your rebel contact Zizzle in the imperial palace.",
					},

				},

				[9] = {
					name = "Mission 09: The Sleeping Dragon", storageid = Storage.WrathoftheEmperor.Mission09, startvalue = 1, endvalue = 2,
					states = {
						[1] = "To enter the inner realms of the Emperor you need to free the mind of a dragon. An interdimensional potion will help you to enter this dream and unleash his consciousness.",
						[2] = "You travelled through the Sleeping Dragon dreams and freed his mind.",
					},

				},

				[10] = {
					name = "Mission 10: A Message of Freedom", storageid = Storage.WrathoftheEmperor.Mission10, startvalue = 1, endvalue = 6,
					states = {
						[1] = "After solving the riddle, and talking again to the Sleeping Dragon you got a Spiritual Charm. Report back to Zizzle.",
						[2] = "You possess the key to enter the inner realms of the emperor. Start with the one in the north-west and work your way clockwise trough the room and kill those manifestation. Then use your sceptre on the remain to destroy the emperor's influence over the crystal.",
						[3] = "You possess the key to enter the inner realms of the emperor. You destroyed 1 of 4 emperor's influences.",
						[4] = "You possess the key to enter the inner realms of the emperor. You destroyed 2 of 4 emperor's influences.",
						[5] = "You possess the key to enter the inner realms of the emperor. You destroyed 3 of 4 emperor's influences.",
						[6] = "You possess the key to enter the inner realms of the emperor. You destroyed all emperor's influences.",
					},

				},

				[11] = {
					name = "Mission 11: Payback Time", storageid = Storage.WrathoftheEmperor.Mission11, startvalue = 1, endvalue = 2,
					states = {
						[1] = "Your Mission is to kill Zalamon. Step into the teleporter to confront him. Finally use your sceptre on the death body.",
						[2] = "Go back to Awareness Of The Emperor and report him your success!",
					},

				},

				[12] = {
					name = "Mission 12: Just Rewards", storageid = Storage.WrathoftheEmperor.Mission12, startvalue = 0, endvalue = 1,
					states = {
						[0] = "The Emperor has promised you wealth beyond measure. Go claim it in the ministry.",
						[1] = "You completed this Quest!",
					},

				},

			},
		},

		[37] = {
			name = "Oramond", startstorageid = Storage.Oramond.QuestLine, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "To Take Roots", storageid = Storage.Oramond.MissionToTakeRoots, startvalue = 1, endvalue = 3000, description = "Five Juicy roots from the outskirts of Rathleton may already help feed the poor. Try to find a city official to deliver them to or go to the Rathleton poor house.",
				},
			},
		},
		[38] = {
			name = "Forgotten Knowledge", startstorageid = Storage.ForgottenKnowledge.Tomes, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Circle of the Black Sphinx", storageid = Storage.ForgottenKnowledge.LadyTenebrisKilled, startvalue = 0, endvalue = 1522018605,
					states = {
						[1] = "You defeated the rogue Lady Tenebris.",
					},
				},
				[2] = {
					name = "Bane of the Cosmic Force", storageid = Storage.ForgottenKnowledge.LloydKilled, startvalue = 0, endvalue = 1522018605,
					states = {
						[1] = "You calmed poor, misguided Lloyd. All he wanted was protection from the outside world. Luckily he seems to have learned his lesson... or has he?",
					},
				},
				[3] = {
					name = "The Desecrated Glade", storageid = Storage.ForgottenKnowledge.ThornKnightKilled, startvalue = 0, endvalue = 1522018605,
					states = {
						[1] = "You defeated the Thorn Knight and shattered the root of evil with all your might. The honour of being a guardian of the glade indeed comes with pride as well as responsibility.",
					},
				},
				[4] = {
					name = "The Unwary Mage", storageid = Storage.ForgottenKnowledge.DragonkingKilled, startvalue = 0, endvalue = 1522018605,
					states = {
						[1] = "With help of Ivalisse from the temple of the Astral Shapers in Thais and her father, you averted the Dragon King's menace deep in the Zao Muggy Plains.",
					},
				},
				[5] = {
					name = "Dragon in Distress", storageid = Storage.ForgottenKnowledge.HorrorKilled, startvalue = 0, endvalue = 1522018605,
					states = {
						[1] = "You saved the Dragon Mother's egg and she melted the ice wall that blocked your way.",
					},
				},
				[6] = {
					name = "Time is a Window", storageid = Storage.ForgottenKnowledge.TimeGuardianKilled, startvalue = 0, endvalue = 1522018605,
					states = {
						[1] = "You defeated the Time Guardian and are free to return to your own time. For some creatures in this world, it seems neither past nor future are an obstacle.",
					},
				},
				[7] = {
					name = "Final Fight", storageid = Storage.ForgottenKnowledge.LastLoreKilled, startvalue = 0, endvalue = 1522018605,
					states = {
						[1] = "Description Fault.",
					},
				},
			},
		},
		[39] = {
			name = "The First Dragon", startstorageid = Storage.FirstDragon.Start, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Power", storageid = Storage.FirstDragon.DragonCounter, startvalue = 0, endvalue = 200, description = function(player)return string.format("You already hunted %d/200 dragons.")(math.max(player:getStorageValue(Storage.FirstDragon.DragonCounter))) end,
				},
				[2] = {
					name = "Treasure", storageid = Storage.FirstDragon.ChestCounter, startvalue = 1, endvalue = 15, description = "Treasure is the favorite of the dragon lords. Find and take Kalyassa's treasures spread accross the world."
				},
				[3] = {
					name = "Knowledge", storageid = Storage.FirstDragon.GelidrazahAccess, startvalue = 1, endvalue = 1, description = "You learned that frost dragon's incitement is the thirst for knowledge, perhaps if you bring some to Gelidrazah's you'll meet him."
				},
				[4] = {
					name = "Life", storageid = Storage.FirstDragon.SecretsCounter, startvalue = 1, endvalue = 3, description = "Undead dragons aspires for life. No better way to see life as it grows around the world, is there?"
				},
			},
		},

		[40] = {
			name = "Cults of Tibia", startstorageid = Storage.CultsOfTibia.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "The Strengthtening of the Minotaurs", storageid = Storage.CultsOfTibia.Minotaurs.jamesfrancisTask, startvalue = 0, endvalue = 50, description = function(player)
                    return ("James asked you to enter the cave for hunting 50 empowered minotaurs. Then he will be able to continue his research.\nMinotaurs killed: %d/50"):format(player:getStorageValue(Storage.CultsOfTibia.Minotaurs.jamesfrancisTask))
                end,
				},

				[2] = {
					name = "The Strengthtening of the Minotaurs", storageid = Storage.CultsOfTibia.Minotaurs.Mission, startvalue = 1, endvalue = 5,
					states = {
						[1] = "Gerimor told you that the naturalist Jamesfrancis is an expert of minotaurs. Right now he is investigating a cave in minocity. But this time something seems to be completely different.",
						[2] = "Jamesfrancis already entered the inner part of the cave weeks ago but had to flee when the minotaurs became too strong. He gave you the key to investigate this room as well.",
						[3] = "You found an entrance to the minotaur boss. You killed it and now you have to return to Jamesfrancis.",
						[4] = "Jamesfrancis sent you to talk with Gerimor about the minotaur cult.",
						[5] = "You have reported the Druid of Crunor about the minotaur cult.",
					},

				},

				[3] = {
					name = "Patron of Arts", storageid = Storage.CultsOfTibia.MotA.Mission, startvalue = 1, endvalue = 15,
					states = {
						[1] = "The Druid of Cronor gave you the hint that the Thais exhibition has expanded. The new section is called MOTA (Museum of Tibian Arts). It's really worth a visit.",
						[2] = "Gareth told you how to become a patron of the arts. To fulfil your duty you have to manage some tasks. First you have to investigate the crime scene of a theft in the museum.",
						[3] = "You found a ransom note, wich requests you to pay some money for the stolen picture to a stonge in Kazordoon. His name is Iwar. Nevertheless I should talk to Gareth first.",
						[4] = "You told Gareth about the ransom note. He asked you to pay the money to Iwar to get the picture back. In his opinion, there is no alternative.",
						[5] = "You paid the money to stooge in Kazordoon. You were told that the picture is delivered to Gareth himself.",
						[6] = "You have to go to Angelo and get a magnifier to investigate all small pictures in the entrance hall of the MOTA. One of them should be a fake.",
						[7] = "Angelo allowed you to take a magnifier from a crate next to the cave entrance.",
						[8] = "You've fetched the magnifier from Angelo's crate. You're ready for your job in the museum.",
						[9] = "Indeed! One of the investigated small pictures is fake. Report to Gareth!",
						[10] = "After you told Gareth about the fake painting, he asked you to go to Angelo to get a new picture.",
						[11] = "Angelo was not willing to give you a new picture. However, they havent found any artefact in the sandy cave yet. Report to Gareth about your failure.",
						[12] = "Even though you weren't successful in getting a replacement for the fake picture, Gareth gave you access to the last floor of the museum. This area is for patrons only.",
						[13] = "NÃO SEI O QUE TEM AQUI",
						[14] = "The Denomintator opened the door for you after you answered his questions to the wanted number. In the end he mentioned the Druid of Conor. Maybe you should pay him a visit.",
						[15] = "In the end you told the Druid of Crunor about your experiences in the MoTA.",
					},

				},

				[4] = {
					name = "Barkless", storageid = Storage.CultsOfTibia.Barkless.Mission, startvalue = 1, endvalue = 7,
					states = {
						[1] = "The members of the Barkless follow a rigid path of hardship and sacrifice. Their cult is located somewhere beneath Ab'dendriel. Whatever happened to their leader, only a true Barkless can find out.",
						[2] = "You survived the sulphur and tar trial. You accepted the stigma of misfortune and vanity. The hardest part, however, is yet to come. Give your life to the ice... to become true and purified.",
						[3] = function(player)return("You survived the Trial. Barkless now have the right to see the cult leader but a powerful relic is sealing the path.\nBarkless markings broken to reverse the power of the cult object: %d of 10"):format(math.max(player:getStorageValue(Storage.CultsOfTibia.Barkless.Objects), 0))
                end,
						[4] = "You broke enough Barkless markings to now reverse the seal held up by the cult object in the ritual chamber. The power you gained feels unnatural and excessive but it seems ther is no other way.",
						[5] = "Something far more powerful than the beliel of your Barkless brothers and sisters powered the seal to the leader. Whatever the case - find Leiden, or as he's known to his devotees: the \"Penitent\".",
						[6] = "The Leiden you confronted has strayed far from his own original vision of Barkless. What you encountered was more monster than elf and less virtuous than his devotees would have you believe.",
						[7] = "You returned to Gerimor after putting an end to the mischief of Leyden the Penitent. May the Barkless walk the true path again one day.",
					},

				},

				[5] = {
					name = "Misguided", storageid = Storage.CultsOfTibia.Misguided.Mission, startvalue = 1, endvalue = 5,
					states = {
						[1] = "ASD",
						[2] = "Below a ruin in the vicinity of the outlaw camp east of Thais a strange figure in ragged clothes hinted at something weird going on in a cave. He seemed too confused to decide whether to stop you.",
						[3] = function(player)return("While rubbish, the amulet you equipe emits a strange aura of splendour. You feel an urge to fulfill the amulets hunger for especific deaths... \nExorcisms: %d/5 "):format(math.max(player:getStorageValue(Storage.CultsOfTibia.Misguided.Exorcisms), 0))
						end,
						[4] = "You defeated the cult leader of Misguided by uncovering the true master to pull his strings and freeing this world from its malicious existance. Return to Gerimor to tell him about the victory.",
						[5] = "You have spoken to Gerimor about your victory.",
					},

				},

				[6] = {
					name = "The Orc Idol", storageid = Storage.CultsOfTibia.Orcs.Mission, startvalue = 1, endvalue = 3,
					states = {
						[1] = "ASD",
						[2] = "ASD",
						[3] = "You returned to Gerimor after facing the being the orcs worshipped. Whatever it was, it did not find the orcs by accident. A far more powerful force seems to have strategically place it here.",
					},

				},

				[7] = {
					name = "The Secret of the Sandy Cave", storageid = Storage.CultsOfTibia.Life.Mission, startvalue = 1, endvalue = 10,
					states = {
						[1] = "ASD",
						[2] = "ASD",
						[3] = "In the cave you haven't found one of the missing scientists. However, you have faced a lots of strange mummies and a green oasis at the end.",
						[4] = "After you informed Angelo about your experiences in the cave, he asked you to go back to analyse the water of the oasis. For that reason you got an analysis tool.",
						[5] = "You have analysed the water with the help of the analysis tool from Angelo.",
						[6] = "You informed Angelo about the analyzed water. He gave you a counteragent, wich you have to apply to the oasis.",
						[7] = "You applied the counteragent to the oasis, just like Angelo had asked you to. But the effect was different from what you had expected. A sandstorm approached and caused create damage to the oasis.",
						[8] = "You Killed the boss",
						[9] = "You reported your victory to Angelo",
						[10] = "You have told Gerimor about your stay in the sandy cave. He was not really surprised and felt vindicated that the rumors about a cult in the cave might be true.",
					},

				},

				[8] = {
					name = "Zathroth Remmants", storageid = Storage.CultsOfTibia.Humans.Mission, startvalue = 1, endvalue = 3,
					states = {
						[1] = function(player)
						return ("A remnant cult of Zathroth has formed in a forbidden temple beneath Carlin. Find out what's behind this and stop it in time.\nTemporarily vaporised souls:\n%d Decaying\n%d Withering"):format(math.max(player:getStorageValue(18551), 0), math.max(player:getStorageValue(18550), 0))
						end,
						[2] = "ASD",
						[3] = "You returned to Gerimor after encounter with the remnants of Zathroth. On one hand its is furtunate that Zathroth indeed wasn't behind all this, but on the other... what is going on there?",
					},

				},

			},
		},
		[41] = {
			name = "Dangerous Depths", startstorageid = Storage.DangerousDepths.Questline, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Dwarves: Home Improvement", storageid = Storage.DangerousDepths.Dwarves.Home, startvalue = 1, endvalue = 2,
					states = {
						[1] = function(player)return string.format("Destroy makeshift homes of the Lost to force them to fight you! Try making some prisoners in the progress and report back to Klom Stonecutter.\n\nLost Exiles: %d/20\nPrisoners (bonus): %d/3"):format(math.max(player:getStorageValue(Storage.DangerousDepths.Dwarves.LostExiles), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Dwarves.Prisoners), 0))
						end,
						[2] = "You drove off the Lost but more are sure to come. Check back with Klom Stonecutter at a later time.",
					},
				},
				[2] = {
					name = "Dwarves: Subterranean Life", storageid = Storage.DangerousDepths.Dwarves.Subterranean, startvalue = 1, endvalue = 2,
					states = {
						[1] = function(player)return string.format("Klome Stonecutter sent you on a grave mission to exterminate large populaces of subterranian life. Looks like the dwarves make short work of the deep intruders.\n\nSubterranean organisms: %d/50"):format(math.max(player:getStorageValue(Storage.DangerousDepths.Dwarves.Organisms), 0))
						end,
						[2] = "You helped Klom defend the outpost by cutting down a number of vermin from deep down below. The gnomes don't seem to completely approve of this but everyone appreciates the drop in the enemy's ranks.",
					},
				},
				[3] = {
					name = "Gnomes: Gnomal Warming Measurements", storageid = Storage.DangerousDepths.Gnomes.Measurements, startvalue = 1, endvalue = 2,
					states = {
						[1] = function(player)return string.format("Gnomus sent you on a mission to measure the rising heat from below.\n\nLocation A: %d/1\nLocation B: %d/1\nLocation C: %d/1\nLocation D: %d/1\nLocation E: %d/1"):format(math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.locationA), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.locationB), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.locationC), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.locationD), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.locationE), 0))
						end,
						[2] = "You helped Lardoc Bashsmite fighting back the verminous growth in the northern mineshaft. Return to him later to see if he has more work for you.",
					},
				},
				[4] = {
					name = "Gnomes: Ordnance", storageid = Storage.DangerousDepths.Gnomes.Ordnance, startvalue = 1, endvalue = 3,
					states = {
						[1] = "Gnomus sent you to find and rescue the gnome ordnance the outpost is currently waiting for. Travel to the east of the cave system and find the old gnome trail where reinforcements will arrive.",
						[2] = function(player)return string.format("You found the old gnome trail where ordnance for the gnome outpost arrive, escort them and their pack animals to safety and return to Gnomus.\n\nRescued gnomes: %d/5\nRescued animals: %d/3"):format(math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.GnomesCount), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.CrawlersCount), 0))
						end,
						[3] = "You helped Lardoc Bashsmite fighting back the verminous growth in the northern mineshaft. Return to him later to see if he has more work for you.",
					},
				},
				[5] = {
					name = "Gnomes: Uncharted Territory", storageid = Storage.DangerousDepths.Gnomes.Charting, startvalue = 1, endvalue = 2,
					states = {
						[1] = function(player)return string.format("Chart the area around the deep base for Gnomus. Look for especific landmarks:\n\nOld Gate: %d/1\nThe Gaze: %d/1\nLost Ruin: %d/1\nOutpost: %d/1\nBastion: %d/1\nBroken Tower: %d/1"):format(math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.OldGate), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.TheGaze), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.LostRuin), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.Outpost), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.Bastion), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Gnomes.BrokenTower), 0))
						end,
						[2] = "You helped Gnomus chart the area around the deep base. You found traces of what could have been an old civilisation but there's not enough left to draw any conclusion.",
					},
				},
				[6] = {
					name = "Scouts: Explosive Growth", storageid = Storage.DangerousDepths.Scouts.Growth, startvalue = 1, endvalue = 2,
					states = {
						[1] = function(player)return string.format("You found the mine shaft. Burn all the growth and report back to Lardoc Bashsmite!\n\nFirst Room: %d/1\nSecond room: %d/1\nThird room: %d/1\nFourth room: %d/1\nFifth room: %d/1"):format(math.max(player:getStorageValue(Storage.DangerousDepths.Scouts.firstBarrel), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Scouts.secondBarrel), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Scouts.thirdBarrel), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Scouts.fourthBarrel), 0), math.max(player:getStorageValue(Storage.DangerousDepths.Scouts.fifthBarrel), 0))
						end,
						[2] = "You helped Lardoc Bashsmite fighting back the verminous growth in the northern mineshaft. Return to him later to see if he has more work for you.",
					},
				},
				[7] = {
					name = "Scouts: Pesticide", storageid = Storage.DangerousDepths.Scouts.Diremaw, startvalue = 1, endvalue = 2,
					states = {
						[1] = function(player)return string.format("Lardoc asked you to follow a plan of the gnomes to stop the deep threat by trying to neutralise diremaw spawn with pesticies. Diremaws lay eggs inside corpses of their skin.\n\nNeutralised: %d/20"):format(math.max(player:getStorageValue(Storage.DangerousDepths.Scouts.DiremawsCount), 0))
						end,
						[2] = "You reported back to Lardoc Bashsmite to inform him that the gnome's plan to neutralise diremaw corpses seems to work.",
					},
				},
			},
		},
		[42] = {
			name = "Threatened Dreams", startstorageid = Storage.ThreatenedDreams.Start, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "Mission 01: Troubled Animals", storageid = Storage.ThreatenedDreams.TroubledMission01, startvalue = 1, endvalue = 4,
					states = {
						[1] = "STATE 1",
						[2] = "STATE 2",
						[3] = "STATE 3",
						[4] = "STATE 4",
						[5] = "STATE 5",
					},
				},
			},
		},
		[43] = {
			name = "Adventurers Guild", startstorageid = Storage.AdventurersGuild.GreatDragonHunt.WarriorSkeleton, startstoragevalue = 1,
			missions = {
				[1] = {
					name = "The Great Dragon Hunt", storageid = Storage.AdventurersGuild.GreatDragonHunt.WarriorSkeleton, startvalue = 0, endvalue = 2, description = function(player)
						return ("You are exploring the Kha'zeel Dragon Lairs. Others obviously found a terrible end here. But the dragon hoards might justify the risks. You killed %d/50 dragons and dragon lords."):format(math.max(player:getStorageValue(Storage.AdventurersGuild.GreatDragonHunt.DragonCounter), 0))
					end,
				},
			},
		},
	}
end

if not LastQuestlogUpdate then
	LastQuestlogUpdate = {}
end

-- Text functions

function evaluateText(value, player)
	if type(value) == "function" then
		return tostring(value(player))
	end

	return tostring(value)
end

-- Game functions

function Game.isValidQuest(questId)
	return (Quests and Quests[questId])
end

function Game.isValidMission(questId, missionId)
	return (Game.isValidQuest(questId) and Quests[questId].missions and Quests[questId].missions[missionId])
end

function Game.getQuest(questId)
	if Game.isValidQuest(questId) then
		return Quests[questId]
	end
	return false
end

function Game.getQuestIdByName(name)
	for questId = 1, #Quests do
		local quest = Game.getQuest(questId)
		if quest and quest.name:lower() == name:lower() then
			return questId
		end
	end
	return false
end

function Game.getMission(questId, missionId)
	if Game.isValidMission(questId, missionId) then
		return Quests[questId].missions[missionId]
	end
	return false
end

function Game.isQuestStorage(key, value, oldValue)
	for questId = 1, #Quests do
		local quest = Game.getQuest(questId)
		if quest then
			if quest.startstorageid == key and quest.startstoragevalue == value then
				return true
			end

			if quest.missions then
				for missionId = 1, #quest.missions do
					local mission = Game.getMission(questId, missionId)
					if mission then
						if mission.storageid == key and value >= mission.startvalue and value <= mission.endvalue then
							return mission.description or oldValue < mission.storageid or oldValue > mission.endvalue;
						end
					end
				end
			end
		end
	end
	return false
end

function Game.getQuestsCount(player)
	local count = 0
	if Quests then
		for id = 1, #Quests do
			if player:questIsStarted(id) then
				count = count + 1
			end
		end
	end
	return count
end

function Game.getMissionsCount(player, questId)
	local quest = Game.getQuest(questId)
	local count = 0
	if quest then
		local missions = quest.missions
		if missions then
			for missionId = 1, #missions do
				if player:missionIsStarted(questId, missionId) then
					count = count + 1
				end
			end
		end
	end
	return count
end

function Game.addQuest(quest)
	local findQuest = Game.getQuestIdByName(quest.name)
	if findQuest then
		Quests[findQuest] = quest
		return findQuest
	end

	local questId = #Quests + 1
	Quests[questId] = quest
	return questId
end

-- Player functions

function Player.questIsStarted(self, questId)
	local quest = Game.getQuest(questId)
	if quest and self:getStorageValue(quest.startstorageid) ~= -1 or self:getStorageValue(quest.startstorageid) >= quest.startstoragevalue then
		return true
	end
	return false
end

function Player.missionIsStarted(self, questId, missionId)
	local mission = Game.getMission(questId, missionId)
	if mission then
		local value = self:getStorageValue(mission.storageid)
		if value == -1 or value < mission.startvalue or (not mission.ignoreendvalue and value > mission.endvalue) then
			return false
		end

		return true
	end
	return false
end

function Player.questIsCompleted(self, questId)
	local quest = Game.getQuest(questId)
	if quest then
		local missions = quest.missions
		if missions then
			-- if(self:missionIsCompleted(questId, #missions))then
				-- return true
			-- end
			for missionId = 1, #missions do
				if not self:missionIsCompleted(questId, missionId) then
					return false
				end
			end
		end
		return true
	end
	return false
end

function Player.missionIsCompleted(self, questId, missionId)
	local mission = Game.getMission(questId, missionId)
	if mission then
		local value = self:getStorageValue(mission.storageid)
		if value == -1 then
			return false
		end

		if mission.ignoreendvalue then
			return value >= mission.endvalue
		end

		return value == mission.endvalue
	end
	return false
end

function Player.getMissionName(self, questId, missionId)
	local mission = Game.getMission(questId, missionId)
	if mission then
		if self:missionIsCompleted(questId, missionId) then
			return mission.name .. " (completed)"
		end
		return mission.name
	end
	return ""
end

function Player.getMissionDescription(self, questId, missionId)
	local mission = Game.getMission(questId, missionId)
	if mission then
		if mission.description then
			return evaluateText(mission.description, self)
		end

		local value = self:getStorageValue(mission.storageid)
		local state = value
		if mission.ignoreendvalue and value > table.maxn(mission.states) then
			state = table.maxn(mission.states)
		end
		return evaluateText(mission.states[state], self)
	end
	return "An error has occurred, please contact a gamemaster."
end

function Player.sendQuestTracker(self)
	local msg = NetworkMessage()
	msg:addByte(0xD0) -- byte quest tracker
	msg:addByte(1) -- send quests of quest log ??
	msg:addU16(1) -- unknown
	msg:sendToPlayer(self)
	msg:delete()
end


function Player.sendQuestLog(self)
	local msg = NetworkMessage()
	msg:addByte(0xF0)
	msg:addU16(Game.getQuestsCount(self))
	for questId = 1, #Quests do
		if self:questIsStarted(questId) then
			msg:addU16(questId)
			msg:addString(Quests[questId].name .. ""..(self:questIsCompleted(questId) and " (completed)" or ""))
			msg:addByte(self:questIsCompleted(questId))
		end
	end
	msg:sendToPlayer(self)
	msg:delete()
end

function Player.sendQuestLine(self, questId)
	local quest = Game.getQuest(questId)
	if quest then
		local missions = quest.missions
		local msg = NetworkMessage()
		msg:addByte(0xF1)
		msg:addU16(questId)
		msg:addByte(Game.getMissionsCount(self, questId))
		if missions then
			for missionId = 1, #missions do
				if self:missionIsStarted(questId, missionId) then
					if (self:getClient().version >= 1120)then
						msg:addU16(questId)
					end
					msg:addString(self:getMissionName(questId, missionId))
					msg:addString(self:getMissionDescription(questId, missionId))
				end
			end
		end
		if (self:getClient().os == CLIENTOS_NEW_WINDOWS) then
			self:sendQuestTracker()
		end

		msg:sendToPlayer(self)
		msg:delete()
	end
end

function Player.updateStorage(self, key, value, oldValue, currentFrameTime)
	local guid = self:getGuid()
	if LastQuestlogUpdate[guid] ~= currentFrameTime and Game.isQuestStorage(key, value, oldValue) then
		LastQuestlogUpdate[guid] = currentFrameTime
		self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your questlog has been updated.")
	end
end
