local TOCNAME,EC=...

local function langSplit(source)
	local ret={}
	for lang,pat in pairs(source) do
			ret[lang]=EC.Tool.Split(pat:lower(),",")
	end
	return ret
end

EC.PrefixTags = {"lf", "wtb", "looking for", "anyone", "search", "any enchanter", "can you"}
-- MIGHT NEED THIS ONE LATER 
EC.EnchanterTags = {"lfenchanter", "lookingforenchanter", "anyenchantersonline", "needenchanter", "lfenchpst", "lfench"}

-- ******IMPORTANT******
-- You can't have just a token number be part of the pattern or it will wrongly match on item links
-- ie "spellpower to weapon,40" will match LF JC [Relentless Earthstorm Diamond] due to the "40"
-- if instead of "40" it would be "+40" or "40+" thats okay
EC.RecipeTags={
	enGB = langSplit({
		-- 2H Weapon 
		["Enchant 2H Weapon - Lesser Intellect"] = "Enchant 2H Weapon - Lesser Intellect",
		["Enchant 2H Weapon - Major Spirit"] = "Enchant 2H Weapon - Major Spirit",
		["Enchant 2H Weapon - Lesser Spirit"] = "Enchant 2H Weapon - Lesser Spirit",
		["Enchant 2H Weapon - Superior Impact"] = "Enchant 2H Weapon - Superior Impact,+9 weap",
		["Enchant 2H Weapon - Greater Impact"] = "Enchant 2H Weapon - Greater Impact,+7 weap",
		["Enchant 2H Weapon - Impact"] = "Enchant 2H Weapon - Impact,+5 weap,+5 dmg 2h,2h +5",
		["Enchant 2H Weapon - Lesser Impact"] = "Enchant 2H Weapon - Lesser Impact,3 dmg 2h,2h +3",
		["Enchant 2H Weapon - Minor Impact"] = "Enchant 2H Weapon - Minor Impact,2 dmg 2h,2h +2",

		-- Weapon
		["Enchant Weapon - Fiery Weapon"] = "Enchant Weapon - Fiery Weapon,fiery weapon,fiery",
		["Enchant Weapon - Crusader"] = "Enchant Weapon - Crusader,crusader,weap crus,crus weap",
		["Enchant Weapon - Icy Chill"] = "Enchant Weapon - Icy Chill,icy",
		["Enchant Weapon - Winter's Might"] = "Enchant Weapon - Winter's Might",
		["Enchant Weapon - Greater Striking"] = "Enchant Weapon - Greater Striking,+4 dmg,+4 wp,+4 weapon",
		["Enchant Weapon - Striking"] = "Enchant Weapon - Striking,+3 dmg,+3 wp",
		["Enchant Weapon - Lesser Striking"] = "Enchant Weapon - Lesser Striking,2 dmg,2 wp",
		["Enchant Weapon - Lesser Beastslayer"] = "Enchant Weapon - Lesser Beastslayer,lesser beastslayer,lesser beastslaying",
		["Enchant Weapon - Minor Beastslayer"] = "Enchant Weapon - Minor Beastslayer,minor beastslayer,minor beastslaying,beastslaying,beastslayer",
		["Enchant Weapon - Demonslaying"] = "Enchant Weapon - Demonslaying",

		
		--  Shield
		 ["Enchant Shield - Greater Stamina"] = "Enchant Shield - Greater Stamina,stam to shield,7 stam to shield,stamina to shield",
		 ["Enchant Shield - Stamina"] = "Enchant Shield - Stamina",
		 ["Enchant Shield - Frost Resistance"] = "Enchant Shield - Frost Resistance",
		 ["Enchant Shield - Lesser Block"] = "Enchant Shield - Lesser Block",

		-- Boots
		["Enchant Boots - Minor Speed"] = "Enchant Boots - Minor Speed,minor speed,speed to boot,speed to feet,minor move speed,minor movespeed,speed on boots,speed ench",
		["Enchant Boots - Greater Stamina"] = "Enchant Boots - Greater Stamina,boots stam,+7 boots",
		["Enchant Boots - Minor Stamina"] = "Enchant Boots - Minor Stamina,boots stam,1 boots,stam boots",
		["Enchant Boots - Greater Agility"] = "Enchant Boots - Greater Agility,7 agi to boots,7 agi to feet,7 agi boot",
		["Enchant Boots - Agility"] = "Enchant Boots - Agility,5 agi to boots,5 agi to feet,5 agi boot",
		["Enchant Boots - Lesser Agility"] = "Enchant Boots - Lesser Agility,3 agi to boots,3 agi to feet,3 agi boot",
		["Enchant Boots - Minor Agility"] = "Enchant Boots - Minor Agility,1 agi to boots,1 agi to feet,1 agi boot,agi boots",
		["Enchant Boots - Spirit"] = "Enchant Boots - Spirit,5 spi to boots,5 spi to feet,5 spi boot",

		-- Bracers
		["Enchant Bracer - Superior Stamina"] = "Enchant Bracer - Superior Stamina,wrist 9 stamina,bracer superior stamina,bracer 9 stam,9 stam bracer",
		["Enchant Bracer - Greater Stamina"] = "Enchant Bracer - Greater Stamina,wrist 7 stamina,bracer greater stamina,bracer 7 stam",
		["Enchant Bracer - Lesser Stamina"] = "Enchant Bracer - Lesser Stamina,wrist 3 stamina,bracer lesser stamina,bracer 3 stam,bracer stam",
		["Enchant Bracer - Minor Stamina"] = "Enchant Bracer - Minor Stamina,wrist 1 stamina,bracer minor stamina,bracer 1 stam",
		["Enchant Bracer - Stamina"] = "Enchant Bracer - Stamina,wrist 5 stamina,bracer stamina,bracer 5 stam",
		["Enchant Bracer - Superior Strength"] = "Enchant Bracer - Superior Strength,wrist 9 strength,bracer 9 strength,+9 strenght,+9 strength",
		["Enchant Bracer - Greater Strength"] = "Enchant Bracer - Greater Strength,wrist 7 strength,bracer 7 strength,+7 strenght,+7 strength",
		["Enchant Bracer - Strength"] = "Enchant Bracer - Strength,wrist 5 strength,bracer 5 strength,+5 strenght,+5 strength",
		["Enchant Bracer - Lesser Strength"] = "Enchant Bracer - Lesser Strength,wrist 3 strength,bracer 3 strength,3 strenght,3 strength",
		["Enchant Bracer - Minor Strength"] = "Enchant Bracer - Minor Strength,wrist 1 strength,bracer 1 strength,1 strenght,1 strength",
		["Enchant Bracer - Superior Spirit"] = "Enchant Bracers - Superior Spirit,superior spirit,spirit to bracer,spirit to wrist",
		["Enchant Bracer - Greater Spirit"] = "Enchant Bracers - Greater Spirit,greater spirit,spirit to bracer,spirit to wrist",
		["Enchant Bracer - Spirit"] = "Enchant Bracers - Spirit",
		["Enchant Bracer - Lesser Spirit"] = "Enchant Bracers - Lesser Spirit,lesser spirit,spirit to bracer,spirit to wrist",
		["Enchant Bracer - Minor Spirit"] = "Enchant Bracers - Minor Spirit",
		["Enchant Bracer - Greater Intellect"] = "Enchant Bracer - Greater Intellect,7 int to wrist,7 int to bracer,greater intellect to bracer,greater intellect to wrist",

		-- Chest
		["Enchant Chest - Major Health"] = "Enchant Chest - Major Health,100 hp,100hp,major health,100 health,100+ health,100+hp",
		["Enchant Chest - Superior Health"] = "Enchant Chest - Superior Health,50 hp,50hp,superior health,50 health,50+ health,50+hp",
		["Enchant Chest - Greater Health"] = "Enchant Chest - Greater Health,35 hp,35hp,superior health,35 health,35+ health,35+hp",
		["Enchant Chest - Health"] = "Enchant Chest - Health,25 hp,25hp,chest health,25 health,25+ health,25+hp",
		["Enchant Chest - Major Mana"] = "Enchant Chest - Major Mana,Major mana,mana to chest,100mana,100 mana,100 mp,100mp",
		["Enchant Chest - Stats"] = "Enchant Chest - Stats,Chest Stats,3 stat,3 stats,3 chest",
		["Enchant Chest - Minor Stats"] = "Enchant Chest - Minor Stats,Chest Stats,1 stat,1 stats,1 chest",

		-- Cloak
		["Enchant Cloak - Superior Defense"] = "Enchant Cloak - Superior Defense,70 cloak",
		["Enchant Cloak - Greater Defense"] = "Enchant Cloak - Greater Defense,50 cloak",
		["Enchant Cloak - Defense"] = "Enchant Cloak - Defense",
		["Enchant Cloak - Lesser Agility"] = "Enchant Cloak - Lesser Agility,lesser agility to back,lesser agility to cloak,3 agi to back,3 agi to cloak,3 agility to cloak,3 agility to back,3 agi cloak",
		["Enchant Cloak - Minor Agility"] = "Enchant Cloak - Minor Agility,minor agility to back,minor agility to cloak,1 agi to back,1 agi to cloak,1 agility to cloak,1 agility to back,1 agi cloak,agi cloak",
		["Enchant Cloak - Greater Resistance"] = "Enchant Cloak - Greater Resistance,greater resis,5 resis,res to cloak",
		["Enchant Cloak - Resistance"] = "Enchant Cloak - Resistance,3 resis,res to cloak",
		["Enchant Cloak - Greater Fire Resistance"] = "Enchant Cloak - Greater Fire Resistance,fire res",
		["Enchant Cloak - Fire Resistance"] = "Enchant Cloak - Fire Resistance,fire res",

		-- Gloves
		["Enchant Gloves - Advanced Herbalism"] = "Enchant Gloves - Advanced Herbalism,advanced herb,advance herb,herb to hand,herb to glove,+herb,herbalism to hand,herbalism to glove,5herb,5 herb",
		["Enchant Gloves - Advanced Mining"] = "Enchant Gloves - Advanced Mining,advanced min,advance min,mining to hand,mining to glove,+mining,mining to hand,mining to glove,5mini,5 mini",
		["Enchant Gloves - Herbalism"] = "Enchant Gloves - Herbalism",
		["Enchant Gloves - Fishing"] = "Enchant Gloves - Fishing",
		["Enchant Gloves - Skinning"] = "Enchant Gloves - Skinning",
		["Enchant Gloves - Minor Haste"] = "Enchant Gloves - Minor Haste",
		["Enchant Gloves - Riding Skill"] = "Enchant Gloves - Riding Skill,riding speed,riding skill,+riding,mount speed",
		["Enchant Gloves - Greater Strength"] = "Enchant Gloves - Greater Strength,7str,7 str",
		["Enchant Gloves - Greater Agility"] = "Enchant Gloves - Greater Agility,7agi,7 agi",
		["Enchant Gloves - Agility"] = "Enchant Gloves - Agility",

		-- Oil
		-- ["Superior Mana Oil"] = "Superior Mana Oil",
		-- ["Superior Wizard Oil"] = "Superior Wizard Oil",
		["Minor Mana Oil"] = "Minor Mana Oil",
		["Minor Wizard Oil"] = "Minor Wizard Oil",
		["Enchanted Leather"] = "enchanted leather,enchant leather,ench leather",
		["Enchanted Thorium"] = "enchanted thorium,enchant thorium,ench thorium",
		["Greater Magic Wand"] = "Greater Magic Wand",
		["Lesser Magic Wand"] = "Lesser Magic Wand",
	}),
}

EC.ItemIds = {
	["Thorium Bar"] = 12359,
	["Rugged Leather"] = 8170,
	["Righteous Orb"] = 12811,
	["Golden Pearl"] = 13926,
	["Aquamarine"] = 7909,
	["Living Essence"] = 12803,
	["Essence of Undeath"] = 12808,
	["Essence of Fire"] = 7078,
	["Essence of Water"] = 7080,
	["Essence of Air"] = 7082,
	["Essence of Earth"] = 7076,
	["Heart of Fire"] = 7077,
	["Core of Earth"] = 7075,
	["Globe of Water"] = 7079,
	["Breath of Wind"] = 7081,
	["Ichor of Undeath"] = 7972,
	["Elemental Fire"] = 7068,
	["Wintersbite"] = 3819,
	["Icecap"] = 13467,
	["Large Fang"] = 5637,
	["Elemental Earth"] = 7067,
	["Guardian Stone"] = 12809,
	["Black Diamond"] = 11754,
	["Black Lotus"] = 13468,
	["Shadow Protection Potion"] = 6048,
	["Elixir of Demonslaying"] = 9224,
	["Fire Oil"] = 6371,
	["Empty Vial"] = 3371,
	["Leaded Vial"] = 3372,
	["Simple Wood"] = 4470,
	["Maple Seed"] = 17034,
	["Strange Dust"] = 10940,
	["Soul Dust"] = 11083,
	["Vision Dust"] = 11137,
	["Dream Dust"] = 11176,
	["Illusion Dust"] = 16204,
	["Lesser Magic Essence"] = 10938,
	["Greater Magic Essence"] = 10939,
	["Lesser Astral Essence"] = 10998,
	["Greater Astral Essence"] = 11082,
	["Lesser Mystic Essence"] = 11134,
	["Greater Mystic Essence"] = 11135,
	["Lesser Nether Essence"] = 11174,
	["Greater Nether Essence"] = 11175,
	["Lesser Eternal Essence"] = 16202,
	["Greater Eternal Essence"] = 16203,
	["Small Glimmering Shard"] = 10978,
	["Large Glimmering Shard"] = 11084,
	["Small Glowing Shard"] = 11138,
	["Large Glowing Shard"] = 11139,
	["Small Radiant Shard"] = 11177,
	["Large Radiant Shard"] = 11178,
	["Small Brilliant Shard"] = 14343,
	["Large Brilliant Shard"] = 14344,
	["Nexus Crystal"] = 20725,
}
