--- @type LibTalentInfoClassic-1.0
local LibTalentInfoClassic = LibStub and LibStub("LibTalentInfoClassic-1.0", true)
local version = 54377

if WOW_PROJECT_ID ~= WOW_PROJECT_CATACLYSM_CLASSIC or LibTalentInfoClassic == nil or version <= LibTalentInfoClassic:GetTalentProviderVersion() then
	return
end

--- @type table<integer,{[integer]: { id: integer, name: string, icon: integer }}>
local specializations = {
	ROGUE = {
		[1] = { id = 182, name = "Assassination", icon = 132292 }, -- Assassination
		[2] = { id = 181, name = "Combat", icon = 132090 }, -- Combat
		[3] = { id = 183, name = "Subtlety", icon = 132320 }, -- Subtlety
	},
	SHAMAN = {
		[1] = { id = 261, name = "Elemental", icon = 136048 }, -- Elemental
		[2] = { id = 263, name = "Enhancement", icon = 136051 }, -- Enhancement
		[3] = { id = 262, name = "Restoration", icon = 136052 }, -- Restoration
	},
	DEATHKNIGHT = {
		[1] = { id = 398, name = "Blood", icon = 135770 }, -- Blood
		[2] = { id = 399, name = "Frost", icon = 135773 }, -- Frost
		[3] = { id = 400, name = "Unholy", icon = 135775 }, -- Unholy
	},
	WARRIOR = {
		[1] = { id = 746, name = "Arms", icon = 132355 }, -- Arms
		[2] = { id = 815, name = "Fury", icon = 132347 }, -- Fury
		[3] = { id = 845, name = "Protection", icon = 132341 }, -- Protection
	},
	DRUID = {
		[1] = { id = 752, name = "Balance", icon = 136096 }, -- Balance
		[2] = { id = 750, name = "Feral Combat", icon = 132276 }, -- Feral Combat
		[3] = { id = 748, name = "Restoration", icon = 136041 }, -- Restoration
	},
	PRIEST = {
		[1] = { id = 760, name = "Discipline", icon = 135940 }, -- Discipline
		[2] = { id = 813, name = "Holy", icon = 237542 }, -- Holy
		[3] = { id = 795, name = "Shadow", icon = 136207 }, -- Shadow
	},
	MAGE = {
		[1] = { id = 799, name = "Arcane", icon = 135932 }, -- Arcane
		[2] = { id = 851, name = "Fire", icon = 135810 }, -- Fire
		[3] = { id = 823, name = "Frost", icon = 135846 }, -- Frost
	},
	HUNTER = {
		[1] = { id = 811, name = "Beast Mastery", icon = 461112 }, -- Beast Mastery
		[2] = { id = 807, name = "Marksmanship", icon = 236179 }, -- Marksmanship
		[3] = { id = 809, name = "Survival", icon = 461113 }, -- Survival
	},
	PALADIN = {
		[1] = { id = 831, name = "Holy", icon = 135920 }, -- Holy
		[2] = { id = 839, name = "Protection", icon = 236264 }, -- Protection
		[3] = { id = 855, name = "Retribution", icon = 135873 }, -- Retribution
	},
	WARLOCK = {
		[1] = { id = 871, name = "Affliction", icon = 136145 }, -- Affliction
		[2] = { id = 867, name = "Demonology", icon = 136172 }, -- Demonology
		[3] = { id = 865, name = "Destruction", icon = 136186 }, -- Destruction
	},
}

--- @type table<integer,{ id: integer, name: string, icon: integer }>
local talents = {
	-- Combat Rogue
	[181] = {
			{ id = 29, name = "Precision", icon = 132222 },
			{ id = 30, name = "Lightning Reflexes", icon = 136047 },
			{ id = 31, name = "Improved Sinister Strike", icon = 136189 },
			{ id = 32, name = "Improved Gouge", icon = 132155 },
			{ id = 33, name = "Adrenaline Rush", icon = 136206 },
			{ id = 34, name = "Improved Kick", icon = 132219 },
			{ id = 35, name = "Improved Sprint", icon = 132307 },
			{ id = 36, name = "Aggression", icon = 132275 },
			{ id = 37, name = "Blade Twisting", icon = 132283 },
			{ id = 38, name = "Combat Potency", icon = 135673 },
			{ id = 39, name = "Improved Slice and Dice", icon = 132306 },
			{ id = 40, name = "Throwing Specialization", icon = 236282 },
			{ id = 41, name = "Savage Combat", icon = 132100 },
			{ id = 42, name = "Killing Spree", icon = 236277 },
			{ id = 43, name = "Improved Recuperate", icon = 457635 },
			{ id = 44, name = "Reinforced Leather", icon = 458730 },
			{ id = 45, name = "Restless Blades", icon = 458731 },
			{ id = 46, name = "Revealing Strike", icon = 135407 },
			{ id = 47, name = "Bandit's Guile", icon = 236278 },
	},
	-- Assassination Rogue
	[182] = {
			{ id = 1, name = "Lethality", icon = 132109 },
			{ id = 2, name = "Ruthlessness", icon = 132122 },
			{ id = 3, name = "Coup de Grace", icon = 132292 },
			{ id = 4, name = "Puncturing Wounds", icon = 132090 },
			{ id = 5, name = "Improved Expose Armor", icon = 132354 },
			{ id = 6, name = "Cold Blood", icon = 135988 },
			{ id = 7, name = "Overkill", icon = 132205 },
			{ id = 8, name = "Seal Fate", icon = 236281 },
			{ id = 9, name = "Vile Poisons", icon = 132293 },
			{ id = 10, name = "Master Poisoner", icon = 132108 },
			{ id = 11, name = "Quickening", icon = 132301 },
			{ id = 12, name = "Deadly Brew", icon = 236270 },
			{ id = 13, name = "Cut to the Chase", icon = 236269 },
			{ id = 14, name = "Vendetta", icon = 458726 },
			{ id = 15, name = "Deadly Momentum", icon = 458727 },
			{ id = 16, name = "Blackjack", icon = 458797 },
			{ id = 17, name = "Murderous Intent", icon = 136147 },
			{ id = 18, name = "Venomous Wounds", icon = 458736 },
			{ id = 19, name = "Deadened Nerves", icon = 132286 },
	},
	-- Subtlety Rogue
	[183] = {
			{ id = 57, name = "Nightstalker", icon = 132320 },
			{ id = 58, name = "Initiative", icon = 136159 },
			{ id = 59, name = "Elusiveness", icon = 135994 },
			{ id = 60, name = "Opportunity", icon = 236268 },
			{ id = 61, name = "Improved Ambush", icon = 132282 },
			{ id = 62, name = "Preparation", icon = 460693 },
			{ id = 63, name = "Premeditation", icon = 136183 },
			{ id = 64, name = "Hemorrhage", icon = 136168 },
			{ id = 65, name = "Serrated Blades", icon = 135315 },
			{ id = 66, name = "Cheat Death", icon = 132285 },
			{ id = 67, name = "Waylay", icon = 236286 },
			{ id = 68, name = "Honor Among Thieves", icon = 236275 },
			{ id = 69, name = "Slaughter from the Shadows", icon = 236280 },
			{ id = 70, name = "Shadow Dance", icon = 236279 },
			{ id = 71, name = "Relentless Strikes", icon = 132340 },
			{ id = 72, name = "Find Weakness", icon = 132295 },
			{ id = 73, name = "Sanguinary Vein", icon = 457636 },
			{ id = 74, name = "Enveloping Shadows", icon = 132291 },
			{ id = 75, name = "Energetic Recovery", icon = 458734 },
	},
	-- Elemental Shaman
	[261] = {
			{ id = 1, name = "Call of Flame", icon = 135817 },
			{ id = 2, name = "Concussion", icon = 135807 },
			{ id = 3, name = "Convection", icon = 459025 },
			{ id = 4, name = "Elemental Mastery", icon = 136115 },
			{ id = 5, name = "Elemental Focus", icon = 136170 },
			{ id = 6, name = "Reverberation", icon = 135850 },
			{ id = 7, name = "Elemental Warding", icon = 136094 },
			{ id = 8, name = "Elemental Reach", icon = 136099 },
			{ id = 9, name = "Elemental Precision", icon = 136028 },
			{ id = 10, name = "Earthquake", icon = 451165 },
			{ id = 11, name = "Elemental Oath", icon = 237576 },
			{ id = 12, name = "Lava Flows", icon = 237583 },
			{ id = 13, name = "Totemic Wrath", icon = 135829 },
			{ id = 14, name = "Lava Surge", icon = 451169 },
			{ id = 15, name = "Acuity", icon = 136011 },
			{ id = 16, name = "Feedback", icon = 252174 },
			{ id = 17, name = "Rolling Thunder", icon = 136014 },
			{ id = 18, name = "Earth's Grasp", icon = 136100 },
			{ id = 19, name = "Fulmination", icon = 136111 },
	},
	-- Restoration Shaman
	[262] = {
			{ id = 57, name = "Ancestral Healing", icon = 136109 },
			{ id = 58, name = "Resurgence", icon = 132315 },
			{ id = 59, name = "Soothing Rains", icon = 136037 },
			{ id = 60, name = "Mana Tide Totem", icon = 135861 },
			{ id = 61, name = "Nature's Swiftness", icon = 136076 },
			{ id = 62, name = "Tidal Focus", icon = 135859 },
			{ id = 63, name = "Totemic Focus", icon = 136057 },
			{ id = 64, name = "Nature's Blessing", icon = 136059 },
			{ id = 65, name = "Nature's Guardian", icon = 136060 },
			{ id = 66, name = "Blessing of the Eternals", icon = 237573 },
			{ id = 67, name = "Ancestral Awakening", icon = 237571 },
			{ id = 68, name = "Tidal Waves", icon = 237590 },
			{ id = 69, name = "Riptide", icon = 252995 },
			{ id = 70, name = "Improved Cleanse Spirit", icon = 236288 },
			{ id = 71, name = "Focused Insight", icon = 462651 },
			{ id = 72, name = "Ancestral Resolve", icon = 252271 },
			{ id = 73, name = "Telluric Currents", icon = 135990 },
			{ id = 74, name = "Spark of Life", icon = 237556 },
			{ id = 75, name = "Cleansing Waters", icon = 136079 },
			{ id = 76, name = "Spirit Link Totem", icon = 237586 },
	},
	-- Enhancement Shaman
	[263] = {
			{ id = 29, name = "Flurry", icon = 132152 },
			{ id = 30, name = "Ancestral Swiftness", icon = 348567 },
			{ id = 31, name = "Improved Shields", icon = 136051 },
			{ id = 32, name = "Elemental Weapons", icon = 135814 },
			{ id = 33, name = "Toughness", icon = 135892 },
			{ id = 34, name = "Stormstrike", icon = 132314 },
			{ id = 35, name = "Unleashed Rage", icon = 136110 },
			{ id = 36, name = "Shamanistic Rage", icon = 136088 },
			{ id = 37, name = "Static Shock", icon = 237587 },
			{ id = 38, name = "Earthen Power", icon = 136024 },
			{ id = 39, name = "Maelstrom Weapon", icon = 237584 },
			{ id = 40, name = "Feral Spirit", icon = 237577 },
			{ id = 41, name = "Searing Flames", icon = 135825 },
			{ id = 42, name = "Focused Strikes", icon = 451166 },
			{ id = 43, name = "Improved Lava Lash", icon = 451168 },
			{ id = 44, name = "Elemental Devastation", icon = 135791 },
			{ id = 45, name = "Frozen Power", icon = 135776 },
			{ id = 46, name = "Totemic Reach", icon = 136008 },
			{ id = 47, name = "Seasoned Winds", icon = 136027 },
	},
	-- Blood Death Knight
	[398] = {
			{ id = 1, name = "Improved Blood Presence", icon = 135770 },
			{ id = 2, name = "Bladed Armor", icon = 135067 },
			{ id = 3, name = "Butchery", icon = 132455 },
			{ id = 4, name = "Rune Tap", icon = 237529 },
			{ id = 5, name = "Scent of Blood", icon = 132284 },
			{ id = 6, name = "Will of the Necropolis", icon = 132094 },
			{ id = 7, name = "Blood Parasite", icon = 136211 },
			{ id = 8, name = "Dancing Rune Weapon", icon = 135277 },
			{ id = 9, name = "Blade Barrier", icon = 132330 },
			{ id = 10, name = "Vampiric Blood", icon = 136168 },
			{ id = 11, name = "Abomination's Might", icon = 236310 },
			{ id = 12, name = "Improved Death Strike", icon = 237517 },
			{ id = 13, name = "Toughness", icon = 135892 },
			{ id = 14, name = "Bone Shield", icon = 458717 },
			{ id = 15, name = "Blood-Caked Blade", icon = 132109 },
			{ id = 16, name = "Sanguine Fortitude", icon = 458719 },
			{ id = 17, name = "Scarlet Fever", icon = 458735 },
			{ id = 18, name = "Crimson Scourge", icon = 237513 },
			{ id = 19, name = "Hand of Doom", icon = 458966 },
			{ id = 20, name = "Improved Blood Tap", icon = 237515 },
	},
	-- Frost Death Knight
	[399] = {
			{ id = 29, name = "Endless Winter", icon = 136223 },
			{ id = 30, name = "Pillar of Frost", icon = 458718 },
			{ id = 31, name = "Brittle Bones", icon = 460686 },
			{ id = 32, name = "Chill of the Grave", icon = 135849 },
			{ id = 33, name = "Howling Blast", icon = 135833 },
			{ id = 34, name = "Rime", icon = 135840 },
			{ id = 35, name = "Merciless Combat", icon = 135294 },
			{ id = 36, name = "Hungering Cold", icon = 135152 },
			{ id = 37, name = "Nerves of Cold Steel", icon = 132147 },
			{ id = 38, name = "Improved Frost Presence", icon = 135773 },
			{ id = 39, name = "Runic Power Mastery", icon = 135728 },
			{ id = 40, name = "Icy Reach", icon = 135859 },
			{ id = 41, name = "Killing Machine", icon = 135305 },
			{ id = 42, name = "Annihilation", icon = 135609 },
			{ id = 43, name = "Lichborne", icon = 136187 },
			{ id = 44, name = "Improved Icy Talons", icon = 252994 },
			{ id = 45, name = "Chilblains", icon = 135864 },
			{ id = 46, name = "Threat of Thassarian", icon = 132148 },
			{ id = 47, name = "Might of the Frozen Wastes", icon = 135303 },
			{ id = 48, name = "On a Pale Horse", icon = 132264 },
	},
	-- Unholy Death Knight
	[400] = {
			{ id = 57, name = "Virulence", icon = 136126 },
			{ id = 58, name = "Epidemic", icon = 136207 },
			{ id = 59, name = "Unholy Blight", icon = 136132 },
			{ id = 60, name = "Summon Gargoyle", icon = 458967 },
			{ id = 61, name = "Magic Suppression", icon = 136120 },
			{ id = 62, name = "Improved Unholy Presence", icon = 135775 },
			{ id = 63, name = "Unholy Command", icon = 237532 },
			{ id = 64, name = "Ebon Plaguebringer", icon = 132095 },
			{ id = 65, name = "Runic Corruption", icon = 252272 },
			{ id = 66, name = "Rage of Rivendare", icon = 135564 },
			{ id = 67, name = "Dark Transformation", icon = 342913 },
			{ id = 68, name = "Anti-Magic Zone", icon = 237510 },
			{ id = 69, name = "Desecration", icon = 136199 },
			{ id = 70, name = "Resilient Infection", icon = 132102 },
			{ id = 71, name = "Unholy Frenzy", icon = 136224 },
			{ id = 72, name = "Sudden Doom", icon = 136181 },
			{ id = 73, name = "Morbidity", icon = 136144 },
			{ id = 74, name = "Shadow Infusion", icon = 136188 },
			{ id = 75, name = "Contagion", icon = 136182 },
			{ id = 76, name = "Death's Advance", icon = 237561 },
	},
	-- Arms Warrior
	[746] = {
			{ id = 1, name = "Deep Wounds", icon = 132090 },
			{ id = 2, name = "Drums of War", icon = 236397 },
			{ id = 3, name = "Second Wind", icon = 132175 },
			{ id = 4, name = "Sweeping Strikes", icon = 132306 },
			{ id = 5, name = "Wrecking Crew", icon = 132364 },
			{ id = 6, name = "Juggernaut", icon = 132335 },
			{ id = 7, name = "Sudden Death", icon = 132346 },
			{ id = 8, name = "Bladestorm", icon = 236303 },
			{ id = 9, name = "Blood Frenzy", icon = 132334 },
			{ id = 10, name = "Blitz", icon = 458970 },
			{ id = 11, name = "War Academy", icon = 236317 },
			{ id = 12, name = "Taste for Blood", icon = 236276 },
			{ id = 13, name = "Lambs to the Slaughter", icon = 458973 },
			{ id = 14, name = "Impale", icon = 132312 },
			{ id = 15, name = "Field Dressing", icon = 133675 },
			{ id = 16, name = "Throwdown", icon = 133542 },
			{ id = 17, name = "Deadly Calm", icon = 298660 },
			{ id = 18, name = "Tactical Mastery", icon = 136031 },
			{ id = 19, name = "Improved Hamstring", icon = 132316 },
			{ id = 20, name = "Improved Slam", icon = 132340 },
	},
	-- Restoration Druid
	[748] = {
			{ id = 57, name = "Blessing of the Grove", icon = 237586 },
			{ id = 58, name = "Natural Shapeshifter", icon = 136116 },
			{ id = 59, name = "Improved Rejuvenation", icon = 136081 },
			{ id = 60, name = "Nature's Swiftness", icon = 136076 },
			{ id = 61, name = "Living Seed", icon = 236155 },
			{ id = 62, name = "Nature's Bounty", icon = 136085 },
			{ id = 63, name = "Efflorescence", icon = 134222 },
			{ id = 64, name = "Swift Rejuvenation", icon = 132124 },
			{ id = 65, name = "Nature's Ward", icon = 132137 },
			{ id = 66, name = "Revitalize", icon = 236166 },
			{ id = 67, name = "Tree of Life", icon = 132145 },
			{ id = 68, name = "Master Shapeshifter", icon = 236161 },
			{ id = 69, name = "Wild Growth", icon = 236153 },
			{ id = 70, name = "Empowered Touch", icon = 132125 },
			{ id = 71, name = "Nature's Cure", icon = 236288 },
			{ id = 72, name = "Perseverance", icon = 236740 },
			{ id = 73, name = "Gift of the Earthmother", icon = 236160 },
			{ id = 74, name = "Naturalist", icon = 136041 },
			{ id = 75, name = "Fury of Stormrage", icon = 237472 },
			{ id = 76, name = "Heart of the Wild", icon = 135879 },
			{ id = 77, name = "Malfurion's Gift", icon = 237578 },
	},
	-- Feral Combat Druid
	[750] = {
			{ id = 29, name = "Thick Hide", icon = 134355 },
			{ id = 30, name = "Feral Swiftness", icon = 136095 },
			{ id = 31, name = "Feral Charge", icon = 132183 },
			{ id = 32, name = "Stampede", icon = 304501 },
			{ id = 33, name = "Nurturing Instinct", icon = 132130 },
			{ id = 34, name = "Fury Swipes", icon = 132134 },
			{ id = 35, name = "Brutal Impact", icon = 132114 },
			{ id = 36, name = "Survival Instincts", icon = 236169 },
			{ id = 37, name = "Pulverize", icon = 132318 },
			{ id = 38, name = "King of the Jungle", icon = 236159 },
			{ id = 39, name = "Leader of the Pack", icon = 136112 },
			{ id = 40, name = "Primal Madness", icon = 132242 },
			{ id = 41, name = "Blood in the Water", icon = 237347 },
			{ id = 42, name = "Rend and Tear", icon = 236164 },
			{ id = 43, name = "Berserk", icon = 236149 },
			{ id = 44, name = "Natural Reaction", icon = 132091 },
			{ id = 45, name = "Endless Carnage", icon = 237513 },
			{ id = 46, name = "Infected Wounds", icon = 236158 },
			{ id = 47, name = "Primal Fury", icon = 132278 },
			{ id = 48, name = "Predatory Strikes", icon = 132185 },
			{ id = 49, name = "Feral Aggression", icon = 132121 },
			{ id = 50, name = "Furor", icon = 135881 },
	},
	-- Balance Druid
	[752] = {
			{ id = 1, name = "Starlight Wrath", icon = 136006 },
			{ id = 2, name = "Moonglow", icon = 136087 },
			{ id = 3, name = "Nature's Grace", icon = 136062 },
			{ id = 4, name = "Solar Beam", icon = 252188 },
			{ id = 5, name = "Gale Winds", icon = 236154 },
			{ id = 6, name = "Shooting Stars", icon = 236205 },
			{ id = 7, name = "Balance of Power", icon = 132113 },
			{ id = 8, name = "Euphoria", icon = 341763 },
			{ id = 9, name = "Owlkin Frenzy", icon = 236163 },
			{ id = 10, name = "Lunar Shower", icon = 236704 },
			{ id = 11, name = "Force of Nature", icon = 132129 },
			{ id = 12, name = "Fungal Growth", icon = 132371 },
			{ id = 13, name = "Starfall", icon = 236168 },
			{ id = 14, name = "Earth and Moon", icon = 236150 },
			{ id = 15, name = "Moonkin Form", icon = 136036 },
			{ id = 16, name = "Nature's Majesty", icon = 135138 },
			{ id = 17, name = "Typhoon", icon = 236170 },
			{ id = 18, name = "Genesis", icon = 135730 },
			{ id = 19, name = "Dreamstate", icon = 132123 },
			{ id = 20, name = "Sunfire", icon = 236216 },
	},
	-- Discipline Priest
	[760] = {
			{ id = 1, name = "Twin Disciplines", icon = 135969 },
			{ id = 2, name = "Inner Sanctum", icon = 135926 },
			{ id = 3, name = "Inner Focus", icon = 135863 },
			{ id = 4, name = "Evangelism", icon = 135895 },
			{ id = 5, name = "Mental Agility", icon = 132156 },
			{ id = 6, name = "Power Word: Barrier", icon = 253400 },
			{ id = 7, name = "Reflective Shield", icon = 458412 },
			{ id = 8, name = "Soul Warding", icon = 458722 },
			{ id = 9, name = "Divine Aegis", icon = 237539 },
			{ id = 10, name = "Power Infusion", icon = 135939 },
			{ id = 11, name = "Rapture", icon = 237548 },
			{ id = 12, name = "Focused Will", icon = 458227 },
			{ id = 13, name = "Pain Suppression", icon = 135936 },
			{ id = 14, name = "Grace", icon = 237543 },
			{ id = 15, name = "Improved Power Word: Shield", icon = 135940 },
			{ id = 16, name = "Renewed Hope", icon = 135923 },
			{ id = 17, name = "Borrowed Time", icon = 237538 },
			{ id = 18, name = "Archangel", icon = 458225 },
			{ id = 19, name = "Atonement", icon = 458720 },
			{ id = 20, name = "Strength of Soul", icon = 135871 },
			{ id = 21, name = "Train of Thought", icon = 236225 },
	},
	-- Shadow Priest
	[795] = {
			{ id = 57, name = "Darkness", icon = 458226 },
			{ id = 58, name = "Improved Shadow Word: Pain", icon = 136207 },
			{ id = 59, name = "Improved Psychic Scream", icon = 136184 },
			{ id = 60, name = "Improved Mind Blast", icon = 136224 },
			{ id = 61, name = "Veiled Shadows", icon = 135994 },
			{ id = 62, name = "Silence", icon = 458230 },
			{ id = 63, name = "Vampiric Embrace", icon = 136230 },
			{ id = 64, name = "Mind Melt", icon = 237569 },
			{ id = 65, name = "Improved Devouring Plague", icon = 252996 },
			{ id = 66, name = "Shadowform", icon = 136200 },
			{ id = 67, name = "Phantasm", icon = 237570 },
			{ id = 68, name = "Shadowy Apparition", icon = 458229 },
			{ id = 69, name = "Psychic Horror", icon = 237568 },
			{ id = 70, name = "Vampiric Touch", icon = 135978 },
			{ id = 71, name = "Pain and Suffering", icon = 237567 },
			{ id = 72, name = "Dispersion", icon = 237563 },
			{ id = 73, name = "Sin and Punishment", icon = 135945 },
			{ id = 74, name = "Harnessed Shadows", icon = 134336 },
			{ id = 75, name = "Paralysis", icon = 132299 },
			{ id = 76, name = "Twisted Faith", icon = 237566 },
			{ id = 77, name = "Masochism", icon = 136176 },
	},
	-- Arcane Mage
	[799] = {
			{ id = 1, name = "Improved Polymorph", icon = 136071 },
			{ id = 2, name = "Arcane Concentration", icon = 136170 },
			{ id = 3, name = "Improved Counterspell", icon = 135856 },
			{ id = 4, name = "Torment the Weak", icon = 135737 },
			{ id = 5, name = "Improved Blink", icon = 135736 },
			{ id = 6, name = "Presence of Mind", icon = 136031 },
			{ id = 7, name = "Prismatic Cloak", icon = 135752 },
			{ id = 8, name = "Arcane Potency", icon = 135732 },
			{ id = 9, name = "Arcane Power", icon = 136048 },
			{ id = 10, name = "Incanter's Absorption", icon = 236219 },
			{ id = 11, name = "Arcane Flows", icon = 236223 },
			{ id = 12, name = "Improved Mana Gem", icon = 134104 },
			{ id = 13, name = "Slow", icon = 136091 },
			{ id = 14, name = "Missile Barrage", icon = 236221 },
			{ id = 15, name = "Netherwind Presence", icon = 236222 },
			{ id = 16, name = "Focus Magic", icon = 135754 },
			{ id = 17, name = "Arcane Tactics", icon = 429382 },
			{ id = 18, name = "Improved Arcane Missiles", icon = 136096 },
			{ id = 19, name = "Invocation", icon = 429383 },
			{ id = 20, name = "Nether Vortex", icon = 135735 },
			{ id = 22, name = "Improved Arcane Explosion", icon = 136116 },
	},
	-- Marksmanship Hunter
	[807] = {
			{ id = 29, name = "Rapid Killing", icon = 132205 },
			{ id = 30, name = "Efficiency", icon = 236179 },
			{ id = 31, name = "Go for the Throat", icon = 132174 },
			{ id = 32, name = "Sic 'Em!", icon = 461121 },
			{ id = 33, name = "Careful Aim", icon = 132217 },
			{ id = 34, name = "Improved Steady Shot", icon = 236182 },
			{ id = 35, name = "Readiness", icon = 132206 },
			{ id = 36, name = "Concussive Barrage", icon = 461115 },
			{ id = 37, name = "Bombardment", icon = 132222 },
			{ id = 38, name = "Trueshot Aura", icon = 132329 },
			{ id = 39, name = "Termination", icon = 132345 },
			{ id = 40, name = "Master Marksman", icon = 132177 },
			{ id = 41, name = "Resistance is Futile", icon = 461120 },
			{ id = 42, name = "Rapid Recuperation", icon = 236201 },
			{ id = 43, name = "Silencing Shot", icon = 132323 },
			{ id = 44, name = "Posthaste", icon = 461119 },
			{ id = 45, name = "Marked for Death", icon = 236173 },
			{ id = 46, name = "Chimera Shot", icon = 236176 },
			{ id = 47, name = "Piercing Shots", icon = 236198 },
	},
	-- Survival Hunter
	[809] = {
			{ id = 57, name = "Pathing", icon = 236183 },
			{ id = 58, name = "Entrapment", icon = 136100 },
			{ id = 59, name = "Hunter vs. Wild", icon = 236180 },
			{ id = 60, name = "Survival Tactics", icon = 132293 },
			{ id = 61, name = "Counterattack", icon = 132336 },
			{ id = 62, name = "Improved Serpent Sting", icon = 132204 },
			{ id = 63, name = "Lock and Load", icon = 236185 },
			{ id = 64, name = "Resourcefulness", icon = 132207 },
			{ id = 65, name = "T.N.T.", icon = 133713 },
			{ id = 66, name = "Toxicology", icon = 132378 },
			{ id = 67, name = "Wyvern Sting", icon = 135125 },
			{ id = 68, name = "Point of No Escape", icon = 236199 },
			{ id = 69, name = "Noxious Stings", icon = 236200 },
			{ id = 70, name = "Hunting Party", icon = 236181 },
			{ id = 71, name = "Sniper Training", icon = 236187 },
			{ id = 72, name = "Black Arrow", icon = 136181 },
			{ id = 73, name = "Mirrored Blades", icon = 304583 },
			{ id = 74, name = "Thrill of the Hunt", icon = 132216 },
			{ id = 75, name = "Trap Mastery", icon = 132149 },
			{ id = 76, name = "Serpent Spread", icon = 132209 },
	},
	-- Beast Mastery Hunter
	[811] = {
			{ id = 1, name = "One with Nature", icon = 461117 },
			{ id = 2, name = "Bestial Discipline", icon = 461112 },
			{ id = 3, name = "Improved Kill Command", icon = 132210 },
			{ id = 4, name = "Pathfinding", icon = 461118 },
			{ id = 5, name = "Fervor", icon = 132160 },
			{ id = 6, name = "Improved Mend Pet", icon = 132179 },
			{ id = 7, name = "Frenzy", icon = 134296 },
			{ id = 8, name = "Spirit Bond", icon = 132121 },
			{ id = 9, name = "Ferocious Inspiration", icon = 132173 },
			{ id = 10, name = "Focus Fire", icon = 461846 },
			{ id = 11, name = "Invigoration", icon = 236184 },
			{ id = 12, name = "Bestial Wrath", icon = 132127 },
			{ id = 13, name = "Killing Streak", icon = 236357 },
			{ id = 14, name = "Cobra Strikes", icon = 236177 },
			{ id = 15, name = "Longevity", icon = 236186 },
			{ id = 16, name = "The Beast Within", icon = 132166 },
			{ id = 17, name = "Kindred Spirits", icon = 236202 },
			{ id = 18, name = "Beast Mastery", icon = 236175 },
			{ id = 19, name = "Crouching Tiger, Hidden Chimera", icon = 236190 },
	},
	-- Holy Priest
	[813] = {
			{ id = 29, name = "Divine Fury", icon = 135971 },
			{ id = 30, name = "Empowered Healing", icon = 135913 },
			{ id = 31, name = "Inspiration", icon = 135928 },
			{ id = 32, name = "Serendipity", icon = 237549 },
			{ id = 33, name = "Holy Concentration", icon = 135905 },
			{ id = 34, name = "Body and Soul", icon = 135982 },
			{ id = 35, name = "Divine Touch", icon = 236254 },
			{ id = 36, name = "Circle of Healing", icon = 135887 },
			{ id = 37, name = "Test of Faith", icon = 237550 },
			{ id = 38, name = "Guardian Spirit", icon = 237542 },
			{ id = 39, name = "Improved Renew", icon = 135953 },
			{ id = 40, name = "Lightwell", icon = 135980 },
			{ id = 41, name = "Chakra", icon = 521584 },
			{ id = 42, name = "Heavenly Voice", icon = 458228 },
			{ id = 43, name = "Desperate Prayer", icon = 135954 },
			{ id = 44, name = "Spirit of Redemption", icon = 132864 },
			{ id = 45, name = "Blessed Resilience", icon = 135878 },
			{ id = 46, name = "Revelations", icon = 458721 },
			{ id = 47, name = "Surge of Light", icon = 135981 },
			{ id = 48, name = "Tome of Light", icon = 133739 },
			{ id = 49, name = "Rapid Renewal", icon = 236249 },
	},
	-- Fury Warrior
	[815] = {
			{ id = 29, name = "Battle Trance", icon = 133074 },
			{ id = 30, name = "Cruelty", icon = 132292 },
			{ id = 31, name = "Blood Craze", icon = 136218 },
			{ id = 32, name = "Enrage", icon = 136224 },
			{ id = 33, name = "Piercing Howl", icon = 136147 },
			{ id = 34, name = "Booming Voice", icon = 136075 },
			{ id = 35, name = "Death Wish", icon = 136146 },
			{ id = 36, name = "Furious Attacks", icon = 236308 },
			{ id = 37, name = "Flurry", icon = 132152 },
			{ id = 38, name = "Meat Cleaver", icon = 460959 },
			{ id = 39, name = "Executioner", icon = 135358 },
			{ id = 40, name = "Heroic Fury", icon = 460958 },
			{ id = 41, name = "Rampage", icon = 132352 },
			{ id = 42, name = "Bloodsurge", icon = 236306 },
			{ id = 43, name = "Titan's Grip", icon = 236316 },
			{ id = 44, name = "Single-Minded Fury", icon = 458974 },
			{ id = 45, name = "Intensify Rage", icon = 458971 },
			{ id = 46, name = "Skirmisher", icon = 458975 },
			{ id = 47, name = "Raging Blow", icon = 132215 },
			{ id = 48, name = "Die by the Sword", icon = 135396 },
			{ id = 49, name = "Rude Interruption", icon = 132339 },
	},
	-- Frost Mage
	[823] = {
			{ id = 57, name = "Ice Floes", icon = 135854 },
			{ id = 58, name = "Permafrost", icon = 135864 },
			{ id = 59, name = "Icy Veins", icon = 135838 },
			{ id = 60, name = "Ice Shards", icon = 429385 },
			{ id = 61, name = "Early Frost", icon = 135837 },
			{ id = 62, name = "Cold Snap", icon = 135865 },
			{ id = 63, name = "Fingers of Frost", icon = 236227 },
			{ id = 64, name = "Shattered Barrier", icon = 236209 },
			{ id = 65, name = "Ice Barrier", icon = 135988 },
			{ id = 66, name = "Brain Freeze", icon = 236206 },
			{ id = 67, name = "Enduring Winter", icon = 135833 },
			{ id = 68, name = "Deep Freeze", icon = 236214 },
			{ id = 69, name = "Piercing Chill", icon = 429386 },
			{ id = 70, name = "Piercing Ice", icon = 135845 },
			{ id = 71, name = "Shatter", icon = 135849 },
			{ id = 72, name = "Frostfire Orb", icon = 430840 },
			{ id = 73, name = "Improved Cone of Cold", icon = 135852 },
			{ id = 74, name = "Improved Freeze", icon = 135861 },
			{ id = 75, name = "Reactive Barrier", icon = 135859 },
	},
	-- Holy Paladin
	[831] = {
			{ id = 1, name = "Last Word", icon = 135921 },
			{ id = 2, name = "Arbiter of the Light", icon = 135917 },
			{ id = 3, name = "Denounce", icon = 135903 },
			{ id = 4, name = "Enlightened Judgements", icon = 236251 },
			{ id = 5, name = "Aura Mastery", icon = 135872 },
			{ id = 6, name = "Blessed Life", icon = 135876 },
			{ id = 7, name = "Sacred Cleansing", icon = 236261 },
			{ id = 8, name = "Judgements of the Pure", icon = 236256 },
			{ id = 9, name = "Infusion of Light", icon = 236254 },
			{ id = 10, name = "Beacon of Light", icon = 236247 },
			{ id = 11, name = "Tower of Radiance", icon = 236394 },
			{ id = 12, name = "Divine Favor", icon = 135895 },
			{ id = 13, name = "Light of Dawn", icon = 461859 },
			{ id = 14, name = "Clarity of Purpose", icon = 461857 },
			{ id = 15, name = "Speed of Light", icon = 460953 },
			{ id = 16, name = "Daybreak", icon = 134909 },
			{ id = 17, name = "Conviction", icon = 460689 },
			{ id = 18, name = "Blazing Light", icon = 135920 },
			{ id = 19, name = "Paragon of Virtue", icon = 135875 },
			{ id = 20, name = "Protector of the Innocent", icon = 460690 },
	},
	-- Protection Paladin
	[839] = {
			{ id = 29, name = "Seals of the Pure", icon = 133526 },
			{ id = 30, name = "Toughness", icon = 135892 },
			{ id = 31, name = "Divine Guardian", icon = 253400 },
			{ id = 32, name = "Improved Hammer of Justice", icon = 135963 },
			{ id = 33, name = "Shield of the Templar", icon = 236264 },
			{ id = 34, name = "Hallowed Ground", icon = 135926 },
			{ id = 35, name = "Sanctuary", icon = 136051 },
			{ id = 36, name = "Ardent Defender", icon = 135870 },
			{ id = 37, name = "Holy Shield", icon = 135880 },
			{ id = 38, name = "Sacred Duty", icon = 135896 },
			{ id = 39, name = "Judgements of the Just", icon = 236259 },
			{ id = 40, name = "Hammer of the Righteous", icon = 236253 },
			{ id = 41, name = "Vindication", icon = 135985 },
			{ id = 42, name = "Wrath of the Lightbringer", icon = 133562 },
			{ id = 43, name = "Reckoning", icon = 135882 },
			{ id = 44, name = "Grand Crusader", icon = 133176 },
			{ id = 45, name = "Guarded by the Light", icon = 236252 },
			{ id = 46, name = "Shield of the Righteous", icon = 236265 },
			{ id = 47, name = "Eternal Glory", icon = 135433 },
			{ id = 48, name = "Divinity", icon = 135883 },
	},
	-- Protection Warrior
	[845] = {
			{ id = 57, name = "Incite", icon = 236309 },
			{ id = 58, name = "Shield Specialization", icon = 134952 },
			{ id = 59, name = "Gag Order", icon = 132453 },
			{ id = 60, name = "Improved Revenge", icon = 132353 },
			{ id = 61, name = "Shield Mastery", icon = 132359 },
			{ id = 62, name = "Toughness", icon = 135892 },
			{ id = 63, name = "Concussion Blow", icon = 132325 },
			{ id = 64, name = "Blood and Thunder", icon = 460957 },
			{ id = 65, name = "Last Stand", icon = 135871 },
			{ id = 66, name = "Heavy Repercussions", icon = 134947 },
			{ id = 67, name = "Devastate", icon = 135291 },
			{ id = 68, name = "Thunderstruck", icon = 458976 },
			{ id = 69, name = "Safeguard", icon = 236311 },
			{ id = 70, name = "Vigilance", icon = 236318 },
			{ id = 71, name = "Warbringer", icon = 236319 },
			{ id = 72, name = "Sword and Board", icon = 236315 },
			{ id = 73, name = "Shockwave", icon = 236312 },
			{ id = 74, name = "Bastion of Defense", icon = 132110 },
			{ id = 75, name = "Hold the Line", icon = 236351 },
			{ id = 76, name = "Impending Victory", icon = 132342 },
	},
	-- Fire Mage
	[851] = {
			{ id = 29, name = "Improved Fire Blast", icon = 135807 },
			{ id = 30, name = "Ignite", icon = 135818 },
			{ id = 31, name = "Burning Soul", icon = 429590 },
			{ id = 32, name = "Impact", icon = 135821 },
			{ id = 33, name = "Critical Mass", icon = 136115 },
			{ id = 34, name = "Molten Shields", icon = 135806 },
			{ id = 35, name = "Master of Elements", icon = 135820 },
			{ id = 36, name = "Improved Scorch", icon = 135827 },
			{ id = 37, name = "Blast Wave", icon = 135903 },
			{ id = 38, name = "Blazing Speed", icon = 135788 },
			{ id = 39, name = "Pyromaniac", icon = 135789 },
			{ id = 40, name = "Combustion", icon = 135824 },
			{ id = 41, name = "Molten Fury", icon = 135822 },
			{ id = 42, name = "Dragon's Breath", icon = 134153 },
			{ id = 43, name = "Hot Streak", icon = 236218 },
			{ id = 44, name = "Living Bomb", icon = 236220 },
			{ id = 45, name = "Improved Flamestrike", icon = 135826 },
			{ id = 46, name = "Firestarter", icon = 236216 },
			{ id = 47, name = "Cauterize", icon = 252268 },
			{ id = 48, name = "Fire Power", icon = 135817 },
			{ id = 49, name = "Improved Hot Streak", icon = 236218 },
	},
	-- Retribution Paladin
	[855] = {
			{ id = 57, name = "Divine Purpose", icon = 135897 },
			{ id = 58, name = "Seals of Command", icon = 132347 },
			{ id = 59, name = "Eye for an Eye", icon = 135904 },
			{ id = 60, name = "Crusade", icon = 135889 },
			{ id = 61, name = "The Art of War", icon = 236246 },
			{ id = 62, name = "Repentance", icon = 135942 },
			{ id = 63, name = "Communion", icon = 236257 },
			{ id = 64, name = "Sanctified Wrath", icon = 236262 },
			{ id = 65, name = "Inquiry of Faith", icon = 236260 },
			{ id = 66, name = "Divine Storm", icon = 236250 },
			{ id = 67, name = "Sacred Shield", icon = 236249 },
			{ id = 68, name = "Acts of Sacrifice", icon = 236248 },
			{ id = 69, name = "Zealotry", icon = 237547 },
			{ id = 70, name = "Rule of Law", icon = 134916 },
			{ id = 71, name = "Selfless Healer", icon = 252269 },
			{ id = 72, name = "Sanctity of Battle", icon = 237486 },
			{ id = 73, name = "Long Arm of the Law", icon = 236258 },
			{ id = 74, name = "Pursuit of Justice", icon = 135937 },
			{ id = 75, name = "Improved Judgement", icon = 236255 },
			{ id = 76, name = "Guardian's Favor", icon = 135964 },
	},
	-- Destruction Warlock
	[865] = {
			{ id = 57, name = "Shadow and Flame", icon = 136196 },
			{ id = 58, name = "Bane", icon = 136146 },
			{ id = 59, name = "Improved Soul Fire", icon = 135808 },
			{ id = 60, name = "Shadowburn", icon = 136191 },
			{ id = 61, name = "Backlash", icon = 135823 },
			{ id = 62, name = "Improved Immolate", icon = 135817 },
			{ id = 63, name = "Bane of Havoc", icon = 460695 },
			{ id = 64, name = "Nether Protection", icon = 136178 },
			{ id = 65, name = "Soul Leech", icon = 136214 },
			{ id = 66, name = "Backdraft", icon = 236290 },
			{ id = 67, name = "Shadowfury", icon = 136201 },
			{ id = 68, name = "Empowered Imp", icon = 236294 },
			{ id = 69, name = "Fire and Brimstone", icon = 236297 },
			{ id = 70, name = "Chaos Bolt", icon = 236291 },
			{ id = 71, name = "Emberstorm", icon = 135826 },
			{ id = 72, name = "Burning Embers", icon = 460952 },
			{ id = 73, name = "Improved Searing Pain", icon = 135827 },
			{ id = 74, name = "Aftermath", icon = 135805 },
			{ id = 75, name = "Nether Ward", icon = 135796 },
	},
	-- Demonology Warlock
	[867] = {
			{ id = 29, name = "Dark Arts", icon = 460697 },
			{ id = 30, name = "Demonic Embrace", icon = 136172 },
			{ id = 31, name = "Improved Health Funnel", icon = 136168 },
			{ id = 32, name = "Master Summoner", icon = 136164 },
			{ id = 33, name = "Mana Feed", icon = 136171 },
			{ id = 34, name = "Molten Core", icon = 236301 },
			{ id = 35, name = "Decimation", icon = 135808 },
			{ id = 36, name = "Demonic Pact", icon = 237562 },
			{ id = 37, name = "Metamorphosis", icon = 237558 },
			{ id = 38, name = "Demonic Empowerment", icon = 236292 },
			{ id = 39, name = "Ancient Grimoire", icon = 460694 },
			{ id = 40, name = "Inferno", icon = 460698 },
			{ id = 41, name = "Demonic Aegis", icon = 136185 },
			{ id = 42, name = "Impending Doom", icon = 136082 },
			{ id = 43, name = "Cremation", icon = 460696 },
			{ id = 44, name = "Hand of Gul'dan", icon = 135265 },
			{ id = 45, name = "Fel Synergy", icon = 237564 },
			{ id = 46, name = "Demonic Rebirth", icon = 136150 },
			{ id = 47, name = "Aura of Foreboding", icon = 136192 },
	},
	-- Affliction Warlock
	[871] = {
			{ id = 1, name = "Doom and Gloom", icon = 136139 },
			{ id = 2, name = "Improved Corruption", icon = 136118 },
			{ id = 3, name = "Improved Life Tap", icon = 136126 },
			{ id = 4, name = "Soul Siphon", icon = 460700 },
			{ id = 5, name = "Improved Fear", icon = 136183 },
			{ id = 6, name = "Nightfall", icon = 136223 },
			{ id = 7, name = "Shadow Embrace", icon = 136198 },
			{ id = 8, name = "Curse of Exhaustion", icon = 136162 },
			{ id = 9, name = "Eradication", icon = 236295 },
			{ id = 10, name = "Improved Howl of Terror", icon = 136147 },
			{ id = 11, name = "Death's Embrace", icon = 237557 },
			{ id = 12, name = "Everlasting Affliction", icon = 236296 },
			{ id = 13, name = "Haunt", icon = 236298 },
			{ id = 14, name = "Pandemic", icon = 136166 },
			{ id = 15, name = "Jinx", icon = 460699 },
			{ id = 16, name = "Soul Swap", icon = 460857 },
			{ id = 17, name = "Soulburn: Seed of Corruption", icon = 136193 },
			{ id = 18, name = "Siphon Life", icon = 136188 },
	},
}

LibTalentInfoClassic:RegisterTalentProvider({
	version = version,
	specializations = specializations,
	talents = talents,
})
