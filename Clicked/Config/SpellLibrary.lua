-- Clicked, a World of Warcraft keybind manager.
-- Copyright (C) 2022  Kevin Krol
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

--- @class ClickedInternal
local Addon = select(2, ...)

--- @class SpellLibrary
local SpellLibrary = {}

--- @class SpellLibrary.Spell
--- @field public name string
--- @field public spellId integer
--- @field public icon integer
--- @field public tabName string
--- @field public tabIcon integer
--- @field public specId integer

--- @return table<integer,SpellLibrary.Spell>
local function GetSpells_v2()
	local result = {}

	for i = 2, C_SpellBook.GetNumSpellBookSkillLines() do
		local tab = C_SpellBook.GetSpellBookSkillLineInfo(i)

		for j = tab.itemIndexOffset + 1, tab.itemIndexOffset + tab.numSpellBookItems do
			local spell = C_SpellBook.GetSpellBookItemInfo(j, Enum.SpellBookSpellBank.Player)

			if not spell.isPassive then
				if spell.itemType == Enum.SpellBookItemType.Spell or spell.itemType == Enum.SpellBookItemType.FutureSpell then
					result[spell.spellID] = {
						name = spell.name,
						spellId = spell.spellID,
						icon = spell.iconID,
						tabName = tab.name,
						tabIcon = tab.iconID,
						specId = tab.specID
					}
				elseif spell.itemType == Enum.SpellBookItemType.Flyout then
					local _, _, spellCount = GetFlyoutInfo(spell.actionID)

					for k = 1, spellCount do
						local spellId = GetFlyoutSlotInfo(spell.actionID, k)
						local data = C_Spell.GetSpellInfo(spellId)

						result[spellId] = {
							name = data.name,
							spellId = spellId,
							icon = data.iconID,
							tabName = tab.name,
							tabIcon = tab.iconID,
							specId = tab.specID
						}
					end
				end
			end
		end
	end

	return result
end

--- @return table<integer,SpellLibrary.Spell>
local function GetSpells_v1()
	local result = {}

	for i = 2, GetNumSpellTabs() do
		local tabName, tabIcon, offset, count, _, specId = GetSpellTabInfo(i)

		for j = offset + 1, offset + count do
			local type, id = GetSpellBookItemInfo(j, BOOKTYPE_SPELL)

			if not IsPassiveSpell(id) then
				if type == "SPELL" or type == "FUTURESPELL" then
					local name, _, icon = GetSpellInfo(id)

					result[id] = {
						name = name,
						spellId = id,
						icon = icon,
						tabName = tabName,
						tabIcon = tabIcon,
						specId = specId
					}
				elseif type == "FLYOUT" then
					local _, _, spellCount = GetFlyoutInfo(id)

					for k = 1, spellCount do
						local spellId = GetFlyoutSlotInfo(id, k)
						local data = C_Spell.GetSpellInfo(spellId)

						result[spellId] = {
							name = data.name,
							spellId = spellId,
							icon = data.icon,
							tabName = tabName,
							tabIcon = tabIcon,
							specId = specId
						}
					end
				end
			end
		end
	end

	return result
end

--- @return table<integer,SpellLibrary.Spell>
local function GetSpells()
	if Addon.EXPANSION_LEVEL >= Addon.EXPANSION.TWW then
		return GetSpells_v2()
	else
		return GetSpells_v1()
	end
end

--- @param spellId integer
--- @return SpellLibrary.Spell?
function SpellLibrary:GetSpellById(spellId)
	return GetSpells()[spellId]
end

--- @param name string
--- @return SpellLibrary.Spell?
function SpellLibrary:GetSpellByName(name)
	for _, spell in pairs(GetSpells()) do
		if spell.name == name then
			return spell
		end
	end

	return nil
end

function SpellLibrary:GetSpells()
	return pairs(GetSpells())
end

Addon.SpellLibrary = SpellLibrary
