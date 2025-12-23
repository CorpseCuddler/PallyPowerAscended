local L = AceLibrary("AceLocale-2.2"):new("PallyPower");
--local BS = AceLibrary("Babble-Spell-2.2")

local function InitValues()
	if not PallyPower then return end

PallyPower.commPrefix = "PLPWR";

PALLYPOWER_MAXPERCLASS = 8;
PALLYPOWER_NORMALBLESSINGDURATION = 10*60;
PALLYPOWER_GREATERBLESSINGDURATION = 30*60;
PALLYPOWER_MAXAURAS = 8;
PallyPower.SEALS_COUNT = 11;

PallyPower.CONFIG_DRAGHANDLE = L["DRAGHANDLE"];

local function SpellName(spellId)
	return GetSpellInfo(spellId)
end

PallyPower:RegisterBuffFamily("BLESSING", {
	order = 1,
	allowMultiple = false,
	short = false,
	classes = { "PALADIN" },
})

PallyPower:RegisterBuffFamily("DRUID", {
	order = 2,
	allowMultiple = true,
	short = false,
	classes = { "DRUID" },
})

PallyPower:RegisterBuffFamily("PRIEST", {
	order = 3,
	allowMultiple = true,
	short = false,
	classes = { "PRIEST" },
})

PallyPower:RegisterBuffFamily("SHAMAN", {
	order = 4,
	allowMultiple = true,
	short = true,
	classes = { "SHAMAN" },
})


PALLYPOWER_DEFAULT_VALUES = {
	buffscale = 0.90,
	configscale = 0.90,
	smartbuffs = true,
	smartpets = true,
	greaterbuffs = true,
	rfbuff = true,
	auras = true,
	extras = false,
	enableNonPaladin = false,
	autobuff = {
		autokey1 = ",",
		autokey2 = "CTRL-,",
		autobutton = true,
		waitforpeople = true,
	},
	display = {
		-- buttons
		rows = 11,
		columns = 1,
		gapping = 2,
		buttonWidth = 100,
		buttonHeight = 34,
		alignClassButtons = "9",
		alignPlayerButtons = "compact-left",
		edges = true,
        frameLocked = false,
		hideDragHandle = false,
		hidePlayerButtons = false,
		hideClassButtons = false,
		PlainButtons = false,
		HideKeyText = false,
		HideCount = false,
        LockBuffBars = false,
        HideCountText = false,
		HideTimerText = false,
	},
	ShowInParty = true,
	ShowWhenSingle = true,
	skin = "Smooth",
	cBuffNeedAll     = {r = 1.0, g = 0.0, b = 0.0, t = 0.5},
 	cBuffNeedSome    = {r = 1.0, g = 1.0, b = 0.5, t = 0.5},
 	cBuffNeedSpecial = {r = 0.0, g = 0.0, b = 1.0, t = 0.5},
	cBuffGood        = {r = 0.0, g = 0.7, b = 0.0, t = 0.5},
	sets = { 
		["primary"] = {
						seal = 0, 	-- wisdom
						aura = 1, 	-- devotion
						rf = false, -- RF off
						buffs = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,}
					},
		["secondary"] = {
						seal = 0, 	-- wisdom
						aura = 1, 	-- devotion
						rf = false, -- RF off
						buffs = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,}
					},
	},
	-- default assignments
	seal = 0,
	aura = 1,
	disabled = false,
	layout = "Standard",
	};

PallyPower_Credits1 = "Pally Power - by Aznamir, Phill Warmane";
--PallyPower_Credits2 = "Version "..PallyPower_Version;

PallyPower.BuffBarTitle = "Pally Buffs (%d)";

PallyPower:RegisterBuff(SpellName(19742), {
	family = "BLESSING",
	order = 1,
	short = false,
	long = true,
	groupSpell = SpellName(25894),
	icon = "Interface\\Icons\\Spell_Holy_SealOfWisdom",
	groupIcon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofWisdom",
	classes = { "PALADIN" },
	targetDeny = { "WARRIOR", "ROGUE", "DEATHKNIGHT" },
	reagent = { itemId = 21177, count = 1 },
	spellId = 19742,
	groupSpellId = 25894,
	talent = { tree = 1, index = 10 },
})

PallyPower:RegisterBuff(SpellName(19740), {
	family = "BLESSING",
	order = 2,
	short = false,
	long = true,
	groupSpell = SpellName(25782),
	icon = "Interface\\Icons\\Spell_Holy_FistOfJustice",
	groupIcon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",
	classes = { "PALADIN" },
	targetDeny = { "PRIEST", "MAGE", "WARLOCK" },
	reagent = { itemId = 21177, count = 1 },
	spellId = 19740,
	groupSpellId = 25782,
	talent = { tree = 3, index = 1 },
})

PallyPower:RegisterBuff(SpellName(20217), {
	family = "BLESSING",
	order = 3,
	short = false,
	long = true,
	groupSpell = SpellName(25898),
	icon = "Interface\\Icons\\Spell_Magic_MageArmor",
	groupIcon = "Interface\\Icons\\Spell_Magic_GreaterBlessingofKings",
	classes = { "PALADIN" },
	reagent = { itemId = 21177, count = 1 },
	spellId = 20217,
	groupSpellId = 25898,
})

PallyPower:RegisterBuff(SpellName(20911), {
	family = "BLESSING",
	order = 4,
	short = false,
	long = true,
	groupSpell = SpellName(25899),
	icon = "Interface\\Icons\\Spell_Nature_LightningShield",
	groupIcon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary",
	classes = { "PALADIN" },
	reagent = { itemId = 21177, count = 1 },
	spellId = 20911,
	groupSpellId = 25899,
})

PallyPower:RegisterBuff(SpellName(19979), {
	family = "BLESSING",
	order = 5,
	short = false,
	long = true,
	groupSpell = SpellName(25890),
	icon = "Interface\\Icons\\Spell_Holy_PrayerOfHealing02",
	groupIcon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofLight",
	classes = { "PALADIN" },
	reagent = { itemId = 21177, count = 1 },
	spellId = 19979,
	groupSpellId = 25890,
})

PallyPower:RegisterBuff(SpellName(1038), {
	family = "BLESSING",
	order = 6,
	short = false,
	long = true,
	groupSpell = SpellName(25895),
	icon = "Interface\\Icons\\Spell_Holy_SealOfSalvation",
	groupIcon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSalvation",
	classes = { "PALADIN" },
	reagent = { itemId = 21177, count = 1 },
	spellId = 1038,
	groupSpellId = 25895,
})

PallyPower.AuraIcons = {
    [-1] = "",
	[1] = "Interface\\Icons\\Spell_Holy_DevotionAura",
	[2] = "Interface\\Icons\\Spell_Holy_AuraOfLight",
	[3] = "Interface\\Icons\\Spell_Holy_MindSooth",
	[4] = "Interface\\Icons\\Spell_Shadow_SealOfKings",
	[5] = "Interface\\Icons\\Spell_Frost_WizardMark",
	[6] = "Interface\\Icons\\Spell_Fire_SealOfFire",
	[7] = "Interface\\Icons\\Spell_Holy_CrusaderAura",
	[8] = "Interface\\Icons\\Spell_Holy_MindVision",
};

--
-- Need to add localizations
--
PALLYPOWER_CLEAR = L["PP_CLEAR"];
PALLYPOWER_REFRESH = L["PP_REFRESH"];
PALLYPOWER_OPTIONS = L["PP_OPTIONS"];
PALLYPOWER_AUTOASSIGN = L["AUTOASSIGN"]
PALLYPOWER_FREEASSIGN = L["FREEASSIGN"]

PALLYPOWER_ASSIGNMENTS1 = L["PP_RAS1"];
PALLYPOWER_ASSIGNMENTS2 = L["PP_RAS2"];

-- Additional Buff Registrations
PallyPower:RegisterBuff(SpellName(467), {
	family = "DRUID",
	order = 1,
	short = true,
	long = false,
	icon = "Interface\\Icons\\Spell_Nature_Thorns",
	classes = { "DRUID" },
	spellId = 467,
})

PallyPower:RegisterBuff(SpellName(1126), {
	family = "DRUID",
	order = 2,
	short = false,
	long = true,
	groupSpell = SpellName(21849),
	icon = "Interface\\Icons\\Spell_Nature_Regeneration",
	groupIcon = "Interface\\Icons\\Spell_Nature_Regeneration",
	classes = { "DRUID" },
	spellId = 1126,
	groupSpellId = 21849,
	talent = { tree = 3, index = 3 },
})

PallyPower:RegisterBuff(SpellName(1243), {
	family = "PRIEST",
	order = 1,
	short = false,
	long = true,
	icon = "Interface\\Icons\\Spell_Holy_WordFortitude",
	classes = { "PRIEST" },
	spellId = 1243,
})

PallyPower:RegisterBuff(SpellName(14752), {
	family = "PRIEST",
	order = 2,
	short = false,
	long = true,
	icon = "Interface\\Icons\\Spell_Holy_DivineSpirit",
	classes = { "PRIEST" },
	spellId = 14752,
})

PallyPower:RegisterBuff(SpellName(974), {
	family = "SHAMAN",
	order = 1,
	short = true,
	long = false,
	icon = "Interface\\Icons\\Spell_Nature_SkinOfEarth",
	classes = { "SHAMAN" },
	spellId = 974,
})


PallyPower.RFSpell = GetSpellInfo(25780) --BS["Righteous Fury"]

PallyPower.HLSpell = GetSpellInfo(635)

PallyPower.Skins = {
    ["None"] = "Interface\\Tooltips\\UI-Tooltip-Background",
	["Banto"] = "Interface\\AddOns\\PallyPower\\Skins\\Banto",
	["BantoBarReverse"] = "Interface\\AddOns\\PallyPower\\Skins\\BantoBarReverse",
	["Glaze"] = "Interface\\AddOns\\PallyPower\\Skins\\Glaze",
	["Gloss"] = "Interface\\AddOns\\PallyPower\\Skins\\Gloss",
	["Healbot"] = "Interface\\AddOns\\PallyPower\\Skins\\Healbot",
	["oCB"] = "Interface\\AddOns\\PallyPower\\Skins\\oCB",
	["Smooth"] = "Interface\\AddOns\\PallyPower\\Skins\\Smooth",
};

PallyPower.Edge = 'Interface\\Tooltips\\UI-Tooltip-Border'
--PallyPower.Edge = ''	

PallyPower.Seals = {
    [0] = "",
    [1] = GetSpellInfo(20164), -- seal of justice
	[2] = GetSpellInfo(20165), -- seal of light
    [3] = GetSpellInfo(20166), -- seal of wisdom
    [4] = GetSpellInfo(21084), -- seal of righteousness
    [5] = GetSpellInfo(53720), -- seal of the martyr
    [6] = GetSpellInfo(31801), -- seal of vengeance
    [7] = GetSpellInfo(20375), -- seal of command
    [8] = GetSpellInfo(53736), -- seal of corruption
    [9] = GetSpellInfo(31892), -- seal of blood
	[10] = GetSpellInfo(27158), -- seal of the crusader
    [11] = "",
};



PallyPower.Auras = {
	[0] = "",
	[1] = GetSpellInfo(465), --BS["Devotion Aura"],
	[2] = GetSpellInfo(7294), --BS["Retribution Aura"],
	[3] = GetSpellInfo(19746), --BS["Concentration Aura"],
	[4] = GetSpellInfo(19876), --BS["Shadow Resistance Aura"],
	[5] = GetSpellInfo(19888), --BS["Frost Resistance Aura"],
	[6] = GetSpellInfo(19891), --BS["Fire Resistance Aura"],
	[7] = GetSpellInfo(32223), --BS["Crusader Aura"],
	[8] = GetSpellInfo(20218), --BS["Sanctity Aura"],
};

-- Buff templates
PallyPower.Templates={
	[1] = {
		[1]=  {3},
		[2]=  {3},
		[3]=  {3},
		[4]=  {3},
		[5]=  {3},
		[6]=  {3},
		[7]=  {3},
		[8]=  {3},
		[9]=  {3},
		[10]= {3},
		[11]= {3},
	},
	[2] = {
		[1]=  {2, 3},
		[2]=  {2, 3},
		[3]=  {1, 3},
		[4]=  {1, 3},
		[5]=  {1, 3},
		[6]=  {2, 3},
		[7]=  {1, 3},
		[8]=  {1, 3},
		[9]=  {1, 3},
		[10]= {2, 3},
		[11]= {2, 3},
	},
	[3]= {
		[1]=  {2, 4, 3},
		[2]=  {2, 4, 3},
		[3]=  {1, 4, 3},
		[4]=  {1, 2, 3},
		[5]=  {1, 2, 3},
		[6]=  {2, 1, 3},
		[7]=  {1, 4, 3},
		[8]=  {1, 4, 3},
		[9]=  {1, 2, 3},
		[10]= {2, 4, 3},
		[11]= {2, 1, 3},
	},
	[4]= {
		[1]=  {2, 4, 3},
		[2]=  {2, 4, 3},
		[3]=  {1, 4, 3},
		[4]=  {1, 2, 4, 3},
		[5]=  {1, 2, 4, 3},
		[6]=  {2, 1, 4, 3},
		[7]=  {1, 4, 3},
		[8]=  {1, 4, 3},
		[9]=  {1, 2, 4, 3},
		[10]= {2, 4, 3},
		[11]= {2, 1, 4, 3},
	},
}

local function ResolveBlessingKey(spellId)
	local buffName = SpellName(spellId)
	return PallyPower:GetBuffKey(buffName) or spellId
end

local blessingKeyMap = {
	[1] = ResolveBlessingKey(19742), -- wisdom
	[2] = ResolveBlessingKey(19740), -- might
	[3] = ResolveBlessingKey(20217), -- kings
	[4] = ResolveBlessingKey(20911), -- sanctuary
}

for _, classTemplates in pairs(PallyPower.Templates) do
	for _, priorityList in pairs(classTemplates) do
		for index, legacyKey in ipairs(priorityList) do
			if blessingKeyMap[legacyKey] then
				priorityList[index] = blessingKeyMap[legacyKey]
			end
		end
	end
end
-- Layouts
PallyPower.Layouts = {
	["Layout 1"] = { 	
					c = {
							[1] = {	
									x = 0, y = 0, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[2] = {
									x = 0, y = -1, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[3] = {
									x = 0, y = -2, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[4] = {
									x = 0, y = -3, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[5] = {
									x = 0, y = -4, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[6] = {
									x = 0, y = -5, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[7] = {
									x = 0, y = -6, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[8] = {
									x = 0, y = -7, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[9] = {
									x = 0, y = -8, 
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[10] = {
									x = 0, y = -9,
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
							[11] = {
									x = 0, y = -10,
									p = { 
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
										},
								},
		 		},
				ab = {x = 0, y = 1},
    			rf = {x = 0, y = 2},
		 		au = {x = 0, y = 3},

	},
	["Layout 2"] = { 	
					c = {
							[1] = {	
									x = 0, y = 0, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[2] = {
									x = 0, y = -1, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[3] = {
									x = 0, y = -2, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[4] = {
									x = 0, y = -3, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[5] = {
									x = 0, y = -4, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[6] = {
									x = 0, y = -5, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[7] = {
									x = 0, y = -6, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[8] = {
									x = 0, y = -7, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[9] = {
									x = 0, y = -8, 
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[10] = {
									x = 0, y = -9,
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
							[11] = {
									x = 0, y = -10,
									p = { 
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
										},
								},
		 		},
				ab = {x = 0, y = 1},
    			rf = {x = 0, y = 2},
		 		au = {x = 0, y = 3},
	},	
	["Layout 3"] = { 	
					c = {
							[1] = {	
									x = 0, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[2] = {
									x = 1, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[3] = {
									x = 2, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[4] = {
									x = 3, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[5] = {
									x = 4, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[6] = {
									x = 5, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[7] = {
									x = 6, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[8] = {
									x = 7, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[9] = {
									x = 8, y = 0, 
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[10] = {
									x = 9, y = 0,
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
							[11] = {
									x = 10, y = 0,
									p = { 
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
										},
								},
		 		},
				ab = {x = -1, y = 0},
    			rf = {x = -2, y = 0},
		 		au = {x = -3, y = 0},
	},
	["Layout 4"] = { 	
					c = {
							[1] = {	
									x = 0, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[2] = {
									x = 1, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[3] = {
									x = 2, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[4] = {
									x = 3, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[5] = {
									x = 4, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[6] = {
									x = 5, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[7] = {
									x = 6, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
									},
							[8] = {
									x = 7, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[9] = {
									x = 8, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[10] = {
									x = 9, y = 0,
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[11] = {
									x = 10, y = 0,
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
		 		},
				ab = {x = -1, y = 0},
    			rf = {x = -2, y = 0},
		 		au = {x = -3, y = 0},
	},	
	["Layout 5"] = { 	
					c = {
							[1] = {	
									x = -0, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[2] = {
									x = -1, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[3] = {
									x = -2, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[4] = {
									x = -3, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[5] = {
									x = -4, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[6] = {
									x = -5, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[7] = {
									x = -6, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
									},
							[8] = {
									x = -7, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[9] = {
									x = -8, y = 0, 
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[10] = {
									x = -9, y = 0,
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
							[11] = {
									x = -10, y = 0,
									p = { 
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
										},
								},
		 		},
				ab = {x = 3, y = 0},
    			rf = {x = 2, y = 0},
		 		au = {x = 1, y = 0},
	},
 }
 end  -- Close InitValues function

-- Initialize values when addon is ready
if PallyPower then
	InitValues()
else
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ADDON_LOADED")
	frame:SetScript("OnEvent", function(self, event, addon)
		if addon == "PallyPower" then
			InitValues()
			self:UnregisterEvent("ADDON_LOADED")
		end
	end)
end
