local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceDBOptions = LibStub("AceDBOptions-3.0")
local LibDBIcon = LibStub("LibDBIcon-1.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Clicked")

function Clicked:RegisterAddonConfig()
	local config = {
		type = "group",
		name = L["NAME"],
		args = {
			minimapIcon = {
				name = L["OPT_UI_MINIMAP_NAME"],
				desc = L["OPT_UI_MINIMAP_DESC"],
				type = "toggle",
				set = function(info, val)
					Clicked.db.profile.minimap.hide = not val

					if val then
						LibDBIcon:Show("Clicked")
					else
						LibDBIcon:Hide("Clicked")
					end
				end,
				get = function(info)
					return not Clicked.db.profile.minimap.hide
				end
			}
		}
	}
	local profile = AceDBOptions:GetOptionsTable(self.db)

	AceConfig:RegisterOptionsTable("Clicked_AddonOptions", config)
	AceConfigDialog:AddToBlizOptions("Clicked_AddonOptions", L["OPT_UI_LIST_TITLE"])

	AceConfig:RegisterOptionsTable("Clicked_AddonOptions_Profile", profile)
	AceConfigDialog:AddToBlizOptions("Clicked_AddonOptions_Profile", L["OPT_UI_LIST_TITLE_PROFILES"], config)
end
