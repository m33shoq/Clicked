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

local L = LibStub("AceLocale-3.0"):NewLocale("Clicked", "enUS", true)

if not L then
	return
end

L["Clicked"] = true
L["Unable to register unit frame: %s"] = true
L["Clicked is not compatible with %s and requires one of the two to be disabled."] = true
L["Keep %s"] = true
L["Upgraded profile from version %s to version %s"] = true
L["You are in combat, the binding configuration is in read-only mode."] = true
L["Clicked Binding Configuration"] = true
L["Cast %s"] = true
L["Use %s"] = true
L["Cancel %s"] = true
L["Run custom macro"] = true
L["Target the unit"] = true
L["Open the unit menu"] = true
L["UNBOUND"] = true
L["Loaded"] = true
L["Unloaded"] = true
L["Key"] = true
L["ABC"] = true
L["Targets"] = true
L["Create"] = true
L["Duplicate"] = true
L["Copy Data"] = true
L["Paste Data"] = true
L["Select"] = true
L["Pick from spellbook"] = true
L["Remove rank"] = true
L["Are you sure you want to delete this binding?"] = true
L["Are you sure you want to delete this group and ALL bindings it contains? This will delete %s bindings."] = true
L["Click and press a key to bind, or ESC to clear the binding."] = true
L["Search..."] = true
L["New Group"] = true
L["Action"] = true
L["Action Groups"] = true
L["Type"] = true
L["Targets"] = true
L["Macro conditions"] = true
L["Load conditions"] = true
L["Status"] = true
L["Create a new binding"] = true
L["Simple Binding"] = true
L["Clickcast Binding"] = true
L["Healer Binding"] = true
L["Custom Macro (advanced)"] = true
L["Convert to"] = true
L["Group"] = true
L["Group %d"] = true
L["Group Name and Icon"] = true
L["The left and right mouse button can only activate when hovering over unit frames."] = true
L["Click on a spell book entry to select it."] = true
L["Right click to use the max rank."] = true
L["Enter an item name, item ID, or equipment slot number."] = true
L["If the input field is empty you can also shift-click an item from your bags to auto-fill."] = true
L["This macro will only execute when hovering over unit frames, in order to interact with the selected target use the [@mouseover] conditional."] = true
L["This mode will directly append the macro text onto an automatically generated command generated by other bindings using the specified keybind. Generally, this means that it will be the last section of a '/cast' command."] = true
L["With this mode you're not writing a macro command. You're adding parts to an already existing command, so writing '/cast Holy Light' will not work, in order to cast Holy Light simply type 'Holy Light'."] = true
L["Bindings using a mouse button and the Mouseover target will not activate when hovering over a unit frame, enable the Unit Frame Target to enable unit frame clicks."] = true
L["Macro Name and Icon (optional)"] = true
L["Options"] = true
L["Shared Options"] = true
L["External Integrations"] = true
L["Create WeakAura"] = true
L["Beta"] = true
L["On this target"] = true
L["And"] = true
L["Or"] = true
L["Or (inactive)"] = true
L["Quick start"] = true
L["Automatically import from spellbook"] = true
L["Automatically import from action bars"] = true
L["Cast a spell"] = true
L["Cast a spell on a unit frame"] = true
L["Use an item"] = true
L["Cancel an aura"] = true
L["Run a macro"] = true
L["Append a binding segment"] = true
L["Advanced binding types"] = true
L["Target the unit"] = true
L["Open the unit menu"] = true
L["Target Spell"] = true
L["Enter the spell name or spell ID."] = true
L["Enter the aura name or spell ID."] = true
L["Target Item"] = true
L["Macro Text"] = true
L["Target Aura"] = true
L["Interrupt current cast"] = true
L["Allow this binding to cancel any spells that are currently being cast."] = true
L["Start auto attacks"] = true
L["Allow this binding to start auto attacks, useful for any damaging abilities."] = true
L["Start pet attacks"] = true
L["Allow this binding to start pet attacks."] = true
L["Override queued spell"] = true
L["Allow this binding to override a spell that is queued by the lag-tolerance system, should be reserved for high-priority spells."] = true
L["Exit shapeshift form"] = true
L["Allow this binding to automatically exit your shapeshift form."] = true
L["Target on cast"] = true
L["Targets the unit you are casting on."] = true
L["Unit Frame Target"] = true
L["Macro Targets"] = true
L["Player (you)"] = true
L["Target of target"] = true
L["Mouseover"] = true
L["Target of mouseover"] = true
L["Unit frame"] = true
L["Cursor"] = true
L["Pet target"] = true
L["Party %s"] = true
L["Arena %s"] = true
L["<No one>"] = true
L["<Remove this target>"] = true
L["Friendly, Hostile"] = true
L["Alive, Dead"] = true
L["Alive"] = true
L["Never load"] = true
L["Talent specialization"] = true
L["Talent selected"] = true
L["PvP talent selected"] = true
L["War Mode"] = true
L["Form"] = true
L["Stance"] = true
L["Player Name-Realm"] = true
L["Spell known"] = true
L["In group"] = true
L["Player in group"] = true
L["War Mode enabled"] = true
L["War Mode disabled"] = true
L["Specialization %s"] = true
L["Talent %s/%s"] = true
L["Talent %s"] = true
L["PvP Talent %s"] = true
L["Stance %s"] = true
L["Humanoid Form"] = true
L["In combat"] = true
L["Not in combat"] = true
L["Not in a group"] = true
L["In a party"] = true
L["In a raid group"] = true
L["In a party or raid group"] = true
L["Pet exists"] = true
L["No pet"] = true
L["Stealth"] = true
L["In Stealth"] = true
L["Not in Stealth"] = true
L["Mounted"] = true
L["Not mounted"] = true
L["Flying"] = true
L["Not flying"] = true
L["Flyable"] = true
L["Not flyable"] = true
L["Advanced Flyable"] = true
L["Not advanced flyable"] = true
L["Swimming"] = true
L["Not swimming"] = true
L["Outdoors"] = true
L["Indoors"] = true
L["Not channeling"] = true
L["Bonus bar"] = true
L["Not bonus bar"] = true
L["Primary Specialization"] = true
L["Secondary Specialization"] = true
L["Instance type"] = true
L["No Instance"] = true
L["Zone name(s)"] = true
L["Semicolon separated, use an exclamation mark (%s) to negate a zone condition, for example:"] = true
L["%s will be active if you're not in Oribos"] = true
L["%s will be active if you're in Durotar or Orgrimmar"] = true
L["Durotar"] = true
L["Orgrimmar"] = true
L["Oribos"] = true
L["Item equipped"] = true
L["This will not update when in combat, so swapping weapons or shields during combat does not work."] = true
L["Scenario"] = true
L["Dungeon"] = true
L["Raid"] = true
L["On"] = true
L["Single"] = true
L["Multiple"] = true
L["Not loaded"] = true
L["Generated hovercast macro"] = true
L["Generated macro"] = true
L["Unit frame macro"] = true
L["%d related binding(s)"] = true
L["For Dragonriding, use bonus bar %s"] = true
L["For Soar, use bonus bar %s"] = true
L["Profiles"] = true
L["Frame Blacklist"] = true
L["If you are using custom unit frames you may have to adjust a setting within the unit frame configuration panel to enable support for this, and potentially even a UI reload."] = true
L["Enable minimap icon"] = true
L["Enable or disable the minimap icon."] = true
L["Enable addon compartment button"] = true
L["Enable or disable the addon compartment button."] = true
L["Show abilities in unit tooltips"] = true
L["If enabled unit tooltips will be augmented to show abilities and keybinds that can be used on the target."] = true
L["Cast on key down rather than key up"] = true
L["This option will make bindings trigger on the 'down' portion of a button press rather than the 'up' portion."] = true
L["The frame blacklist can be used if you want to exclude specific unit frames from click-cast functionality."] = true
L["To add a unit frame to the blacklist, simply select it from the dropdown below. To remove a unit frame from the blacklist, uncheck the box next to the item."] = true
L["This will take effect immediately."] = true
L["Selected"] = true
L["Add a unit frame"] = true
L["Blizzard"] = true
L["ElvUI"] = true
L["Grid2"] = true
L["VuhDo"] = true
L["Gladius"] = true
L["Import external profile data into your current profile, or export the current profile into a sharable format."] = true
L["Immediately share the current profile with another player. The target player must be on the same realm as you (or a connected realm), and allow for profile sharing."] = true
L["Import"] = true
L["Export"] = true
L["Target player"] = true
L["Share"] = true
L["Allow profile sharing"] = true
L["Sending profile to %s, progress %d/%d (%d%%)"] = true
L["Unable to send a message to %s. Make sure that they are online, have allowed profile sharing, and are on the same realm or a connected realm."] = true
L["Waiting for acknowledgement from %s"] = true
L["Profile import successful, do you want to apply this profile? This will overwrite the current profile."] = true
L["Bound to %s"] = true
L["Abilities"] = true
L["Arena"] = true
L["Battleground"] = true
L["Cancel"] = true
L["Channeling"] = true
L["Class"] = true
L["Combat"] = true
L["Continue"] = true
L["Dead"] = true
L["Default"] = true
L["Delete"] = true
L["Focus"] = true
L["Friendly"] = true
L["Hostile"] = true
L["Macro"] = true
L["New"] = true
L["No"] = true
L["None"] = true
L["Off"] = true
L["Other"] = true
L["Target"] = true
L["Pet"] = true
L["Race"] = true
L["Yes"] = true
L["Add"] = true
L["Bind unassigned modifier keys automatically"] = true
L["If enabled, modifier key combinations that aren't bound will be bound to the main key, for example, binding 'Q' will also bind 'SHIFT-Q', 'AlT-Q', and 'CTRL-Q'."] = true
L["Also bound to:"] = true
L["Search Filters"] = true
L["Prefix your search with k: to search for a specific key only, for example:"] = true
L["k:Q will only show bindings bound to Q"] = true
L["k:ALT-A will only show bindings bound to ALT-A"] = true
L["Nothing"] = true
L["Everything"] = true
L["Mixed..."] = true
L["Invert"] = true
L["Review"] = true
L["Paste import string here"] = true
L["Export Binding"] = true
L["Export Group"] = true
L["Export Profile"] = true
L["Import Profile"] = true
L["Replacing bindings in profile: %s"] = true
L["Exporting '%s'"] = true
L["Copy and share this text"] = true
L["Import Bindings"] = true
L["Importing binding '%s'"] = true
L["Importing group '%s' with %d bindings"] = true
L["Importing %d groups with a total of %d bindings"] = true
L["Importing bindings into: %s"] = true
L["Import keybinds"] = true
L["Invalid import string: Expected a binding or group"] = true
L["Invalid import string: Expected a profile"] = true
L["Failed to decode"] = true
L["Failed to decompress"] = true
L["Failed to deserialize"] = true
L["Change scope"] = true
L["Profile"] = true
L["Imported Clicked profile from %s"] = true
L["Profile specific bindings"] = true
L["Global"] = true
L["Global bindings"] = true
L["The behavior of the self-cast modifier has changed in Dragonflight, bindings using the '%s' key modifier may not work correctly. It is recommended to disable it by setting it to 'NONE' in the options menu."] = true
L["X"] = true
L["Not"] = true
L["Select talents"] = true
