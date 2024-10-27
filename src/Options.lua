local TOCNAME,EC=...

--Options
-------------------------------------------------------------------------------------

function EC.UpdateTags()
	-- Undecided if I should keep this in or not
	--[[ 
		for k, v in pairs(EC.DB.Custom) do 
		if v == nil or v == "" then
			local txt = EC.Tool.Combine(EC.RecipeTags["enGB"][k],",")
			EC.DB.Custom[k] = txt
		end
	end
--]]
	for k, _ in pairs(EC.DBChar.RecipeList) do
		if EC.DB.Custom[k] ~= nil and EC.DB.Custom[k] ~= "" then
			if EC.DBChar.Debug == true then
				print("Updating recipe: " .. k .. " with custom pattern: " .. EC.DB.Custom[k])
			end
			EC.DBChar.RecipeList[k] = EC.Tool.Split(EC.DB.Custom[k]:lower(),",")
		end
	end
end

function EC.UpdateMsg()
	if EC.DB.MsgPrefix == nil or EC.DB.MsgPrefix == "" then
		EC.DB.MsgPrefix = EC.DefaultMsg
	end
end

function EC.OptionsUpdate() 
	EC.UpdateMsg()
	EC.UpdateTags()
	EC.BlackList = EC.Tool.Split(EC.DB.Custom.BlackList:lower(), ",")
end

function EC.OptionsInit ()
	local onCommit = function(panelFrame)
		EC.OptionsUpdate()
	end
	local onRefresh = function(panelFrame)
		EC.OptionsUpdate()
	end
	local onDefault = function(panelFrame)
		EC.OptionsBuilder.DefaultRegisteredVariables()
		EC.OptionsUpdate()
	end
	EC.OptionsBuilder.Init(onCommit, onRefresh, onDefault);
	EC.OptionsBuilder.SetScale(0.85)

	-- Tags Tab
	EC.OptionsBuilder.AddNewCategoryPanel("Enchanter",false,true)
	EC.OptionsBuilder.AddHeaderToCurrentPanel("General Options")
	EC.OptionsBuilder.Indent(10)

	EC.OptionsBuilder.AddCheckBoxToCurrentPanel(EC.DB, "AutoInvite", true, "Auto Invite")
	EC.OptionsBuilder.AddCheckBoxToCurrentPanel(EC.DB, "NetherRecipes", false, "Disable Nether Recipes")

	EC.OptionsBuilder.Indent(-10)
	--
	EC.OptionsBuilder.AddHeaderToCurrentPanel("Search Patterns")
	EC.OptionsBuilder.Indent(10)
	EC.OptionsBuilder.AddTextToCurrentPanel('Enter your own unique search patterns here. You must use "," (comma) as the seperator with no space after it', 450+200)
	EC.OptionsBuilder.AddSpacerToPanel()

	---- Message String
	EC.OptionsBuilder.AddEditBoxToCurrentPanel(EC.DB, "MsgPrefix", EC.DB.MsgPrefix, "Message Prefix", 445, 200, false)
	--
	---- Blacklist
	EC.OptionsBuilder.AddEditBoxToCurrentPanel(EC.DB.Custom, "BlackList", "", "BlackList", 445, 200, false)
	--
	--EC.Options.AddSpace()
	---- Recipe Tags
	for k,v in pairs(EC.RecipeTags["enGB"]) do
		local txt = EC.Tool.Combine(EC.RecipeTags["enGB"][k],",")
		EC.OptionsBuilder.AddEditBoxToCurrentPanel(EC.DB.Custom, k, txt, k, 445, 200, false)
	end
end
