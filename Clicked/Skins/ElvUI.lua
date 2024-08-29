local AceGUI = LibStub("AceGUI-3.0")

if C_AddOns.GetAddOnEnableState("ElvUI", UnitName("player")) == 0 then
	return
end

local function Initialize()
	local elv = unpack(ElvUI);
	if elv == nil or not elv.private.skins or not elv.private.skins.ace3Enable then
		return
	end

	local originalRegisterAsWidget = AceGUI.RegisterAsWidget
	local originalRegisterAsContainer = AceGUI.RegisterAsContainer

	local skins = elv:GetModule("Skins")

	--- @diagnostic disable-next-line: duplicate-set-field
	AceGUI.RegisterAsWidget = function(self, widget)
		if widget.type == "ClickedToggleHeading" then
			widget.checkbg:CreateBackdrop()
			widget.checkbg.backdrop:SetInside(widget.checkbg, 4, 4)
			widget.checkbg.backdrop:SetFrameLevel(widget.checkbg.backdrop:GetFrameLevel() + 1)

			widget.checkbg:SetTexture()
			widget.highlight:SetTexture()

			hooksecurefunc(widget, "SetDisabled", skins.Ace3_CheckBoxSetDisabled)

			if elv.private.skins.checkBoxSkin then
				skins.Ace3_CheckBoxSetDesaturated(widget.check, widget.check:GetDesaturation())
				hooksecurefunc(widget.check, "SetDesaturated", skins.Ace3_CheckBoxSetDesaturated)

				widget.checkbg.backdrop:SetInside(widget.checkbg, 5, 5)
				widget.check:SetInside(widget.checkbg.backdrop)
				widget.check:SetTexture(elv.Media.Textures.Melli)
				widget.check.SetTexture = elv.noop
			else
				widget.check:SetOutside(widget.checkbg.backdrop, 3, 3)
			end

			widget.checkbg.SetTexture = elv.noop
			widget.highlight.SetTexture = elv.noop
		elseif widget.type == "ClickedAutoFillEditBox" then
			widget.pullout:StripTextures()
			widget.pullout:SetTemplate("Transparent")
		elseif  widget.type == "ClickedBindingImportList" then
			local function RefreshTree(w, fromOnUpdate)
				w.OrignalRefreshTree(w, fromOnUpdate)

				if not elv.private.skins.ace3Enable then
					return
				end

				local status = w.status or w.localstatus
				local groupstatus = status.groups
				local lines = w.lines
				local buttons = w.buttons
				local offset = status.scrollvalue

				for i = offset + 1, #lines do
					local button = buttons[i - offset]

					if button then
						if button.highlight then
							button.highlight:SetVertexColor(1.0, 0.9, 0.0, 0.8)
						end

						if groupstatus[lines[i].identifier] then
							button.toggle:SetNormalTexture(elv.Media.Textures.Minus)
							button.toggle:SetPushedTexture(elv.Media.Textures.Minus)
						else
							button.toggle:SetNormalTexture(elv.Media.Textures.Plus)
							button.toggle:SetPushedTexture(elv.Media.Textures.Plus)
						end

						button.toggle:SetHighlightTexture(elv.ClearTexture)
					end
				end
			end

			if widget.OrignalRefreshTree == nil then
				widget.OrignalRefreshTree = widget.RefreshTree
				widget.RefreshTree = RefreshTree
			end

			widget.treeframe:SetTemplate("Transparent")
			skins:HandleScrollBar(widget.scrollbar)
		elseif widget.type == "ClickedKeyVisualizerButton" then
			widget.frame:StripTextures()
			widget.frame:SetTemplate("Transparent")

			skins:HandleIcon(widget.image)

			widget.image:SetSize(43, 43)

			if widget.backgroundMask ~= nil then
				widget.image:RemoveMaskTexture(widget.backgroundMask)
			end

			local actionbars = elv:GetModule("ActionBars")
			local font, size, flags, _, _, _, _, color = actionbars:GetHotkeyConfig(actionbars.db["bar1"])

			widget.keyName:SetPoint("TOP", 0, -3)
			widget.keyName:SetFont(font, size, flags)
			widget.keyName:SetTextColor(color[1], color[2], color[3])

			widget.extraActionCount:SetPoint("BOTTOMRIGHT", -1, 3)
			widget.extraActionCount:SetFont(font, size, flags)
			widget.extraActionCount:SetTextColor(color[1], color[2], color[3])

			local origSetHighlight = widget.SetHighlight
			local bbr, bbg, bbb = widget.frame:GetBackdropBorderColor()

			widget.SetHighlight = function(s, highlight)
				origSetHighlight(s, highlight)

				local frame = s.frame

				if highlight then
					frame:SetBackdropBorderColor(0, 1, 0)
				else
					frame:SetBackdropBorderColor(bbr, bbg, bbb)
				end
			end
		end

		return originalRegisterAsWidget(self, widget)
	end

	--- @diagnostic disable-next-line: duplicate-set-field
	AceGUI.RegisterAsContainer = function(self, widget)
		if widget.type == "ClickedSimpleGroup" then
			-- Undo everything done by ElvUI
			widget.frame:SetTemplate("NoBackdrop")
			widget.frame:SetBackdropColor(0, 0, 0, 0)
			widget.frame.callbackBackdropColor = nil

			widget.content:ClearAllPoints()
			widget.content:SetPoint("TOPLEFT")
			widget.content:SetPoint("BOTTOMRIGHT")
		elseif widget.type == "ClickedTreeGroup" then
			widget.content:GetParent():SetTemplate("Transparent")
			widget.treeFrame:SetTemplate("Transparent")
			skins:HandleScrollBar(widget.scrollbar)
		end

		return originalRegisterAsContainer(self, widget)
	end
end

if ElvUI ~= nil then
	Initialize()
else
	local function OnEvent(self, event, arg1)
		if event == "ADDON_LOADED" and arg1 == "ElvUI" then
			Initialize()
			self:UnregisterEvent("ADDON_LOADED")
		end
	end

	local loader = CreateFrame("Frame")
	loader:RegisterEvent("ADDON_LOADED")
	loader:SetScript("OnEvent", OnEvent)
end
