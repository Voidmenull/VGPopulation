local VGPopulation = CreateFrame("Frame")
VGPopulation:RegisterEvent("WHO_LIST_UPDATE")
VGPopulation:RegisterEvent("ADDON_LOADED")

VGPopulation.Counter = 0
VGPopulation.End = 0
VGPopulation.Trigger = 0
VGPopulation.Players = 0
VGPopulation.Mode = 0


function VGPopulation:OnUpdate()
	if VGPopulation.Trigger == 1 and VGPopulation.Mode == 1 and VGPopulation.Counter >= 1 then
		SendWho(VGPopulation.List[VGPopulation.Counter])
		VGPopulation.Mode = 2
	end
end

function VGPopulation:OnEvent()
	if event == "WHO_LIST_UPDATE" then
		if VGPopulation.Mode == 2 then
			local numWhos = GetNumWhoResults()
			if numWhos >= 50 then DEFAULT_CHAT_FRAME:AddMessage("Wanrning: Count can be incorrect, 50+ players detected",1,0,0) end
			VGPopulation.Players = VGPopulation.Players + numWhos
			VGPopulation.CountFont:SetText("Players Found: "..VGPopulation.Players)
			VGPopulation.TimeFont:SetText("Progress: "..floor((VGPopulation.Counter/VGPopulation.End)*100).." %")	
			VGPopulation.Counter = VGPopulation.Counter + 1
			VGPopulation.Mode = 1
			if VGPopulation.Counter > VGPopulation.End then VGPopulation.Trigger = 0; VGPopulation.Mode = 0; VGPopulation:SetScript("OnUpdate", nil) VGPopulation.Mode = 3 end
		end
	elseif event == "ADDON_LOADED" then
		VGPopulation:CreateUI()
	end
end

function VGPopulation:CreateUI()
	self.Button = CreateFrame("Button",nil,WhoFrame,"UIPanelButtonTemplate")
	self.Button:SetPoint("TOPLEFT",70,-45)
	self.Button:SetWidth(130)
	self.Button:SetHeight(18)
	self.Button:SetText("Count Population")
	self.Button:SetScript("OnClick", function () PlaySound("igMainMenuOptionCheckBoxOn");VGPopulation:CountPopulation() end)
	
	self.CountFont = self.Button:CreateFontString(nil, "OVERLAY")
    self.CountFont:SetPoint("TOPLEFT", self.Button, "TOPRIGHT", 10, 5)
	self.CountFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
	self.CountFont:SetJustifyH("LEFT")
    self.CountFont:SetText("")
	self.CountFont:SetShadowOffset(1, -1)
	
	self.TimeFont = self.Button:CreateFontString(nil, "OVERLAY")
    self.TimeFont:SetPoint("TOPLEFT", self.CountFont, "BOTTOMLEFT", 0, -5)
	self.TimeFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
	self.TimeFont:SetJustifyH("LEFT")
    self.TimeFont:SetText("")
	self.TimeFont:SetShadowOffset(1, -1)
end

VGPopulation:SetScript("OnEvent", VGPopulation.OnEvent)

-- search list
VGPopulation.List =
{	-- orc
	'1-59 r-"Orc" c-"Rogue"',
	'60 r-"Orc" c-"Rogue"',
	'1-59 r-"Orc" c-"Warrior"',
	'60 r-"Orc" c-"Warrior"',
	'1-59 r-"Orc" c-"Hunter"',
	'60 r-"Orc" c-"Hunter"',
	'1-59 r-"Orc" c-"Warlock"',
	'60 r-"Orc" c-"Warlock"',
	'1-59 r-"Orc" c-"Shaman"',
	'60 r-"Orc" c-"Shaman"',
	-- undead
	'1-59 r-"Undead" c-"Priest"',
	'60 r-"Undead" c-"Priest"',
	'1-59 r-"Undead" c-"Rogue"',
	'60 r-"Undead" c-"Rogue"',
	'1-59 r-"Undead" c-"Warrior"',
	'60 r-"Undead" c-"Warrior"',
	'1-59 r-"Undead" c-"Mage"',
	'60 r-"Undead" c-"Mage"',
	'1-59 r-"Undead" c-"Warlock"',
	'60 r-"Undead" c-"Warlock"',
	-- Tauren
	'1-59 r-"Tauren" c-"Warrior"',
	'60 r-"Tauren" c-"Warrior"',
	'1-59 r-"Tauren" c-"Druid"',
	'60 r-"Tauren" c-"Druid"',
	'1-59 r-"Tauren" c-"Hunter"',
	'60 r-"Tauren" c-"Hunter"',
	'1-59 r-"Tauren" c-"Shaman"',
	'60 r-"Tauren" c-"Shaman"',
	-- Troll
	'1-59 r-"Troll" c-"Priest"',
	'60 r-"Troll" c-"Priest"',
	'1-59 r-"Troll" c-"Rogue"',
	'60 r-"Troll" c-"Rogue"',
	'1-59 r-"Troll" c-"Warrior"',
	'60 r-"Troll" c-"Warrior"',
	'1-59 r-"Troll" c-"Mage"',
	'60 r-"Troll" c-"Mage"',
	'1-59 r-"Troll" c-"Hunter"',
	'60 r-"Troll" c-"Hunter"',
	'1-59 r-"Troll" c-"Shaman"',
	'60 r-"Troll" c-"Shaman"',
	-- Human
	'1-59 r-"Human" c-"Priest"',
	'60 r-"Human" c-"Priest"',
	'1-59 r-"Human" c-"Rogue"',
	'60 r-"Human" c-"Rogue"',
	'1-59 r-"Human" c-"Warrior"',
	'60 r-"Human" c-"Warrior"',
	'1-59 r-"Human" c-"Mage"',
	'60 r-"Human" c-"Mage"',
	'1-59 r-"Human" c-"Warlock"',
	'60 r-"Human" c-"Warlock"',
	'1-59 r-"Human" c-"Paladin"',
	'60 r-"Human" c-"Paladin"',
	-- Dwarf
	'60 r-"Dwarf" c-"Priest"',
	'1-59 r-"Dwarf" c-"Priest"',
	'60 r-"Dwarf" c-"Priest"',
	'1-59 r-"Dwarf" c-"Rogue"',
	'60 r-"Dwarf" c-"Rogue"',
	'1-59 r-"Dwarf" c-"Warrior"',
	'60 r-"Dwarf" c-"Warrior"',
	'1-59 r-"Dwarf" c-"Mage"',
	'60 r-"Dwarf" c-"Mage"',
	'1-59 r-"Dwarf" c-"Hunter"',
	'60 r-"Dwarf" c-"Hunter"',
	'1-59 r-"Dwarf" c-"Paladin"',
	'60 r-"Dwarf" c-"Paladin"',
	-- Night elf
	'1-59 r-"Night Elf" c-"Priest"',
	'60 r-"Night Elf" c-"Priest"',
	'1-59 r-"Night Elf" c-"Rogue"',
	'60 r-"Night Elf" c-"Rogue"',
	'1-59 r-"Night Elf" c-"Warrior"',
	'60 r-"Night Elf" c-"Warrior"',
	'1-59 r-"Night Elf" c-"Druid"',
	'60 r-"Night Elf" c-"Druid"',
	'1-59 r-"Night Elf" c-"Hunter"',
	'60 r-"Night Elf" c-"Hunter"',
	-- Gnome
	'1-59 r-"Gnome" c-"Rogue"',
	'60 r-"Gnome" c-"Rogue"',
	'1-59 r-"Gnome" c-"Warrior"',
	'60 r-"Gnome" c-"Warrior"',
	'1-59 r-"Gnome" c-"Mage"',
	'60 r-"Gnome" c-"Mage"',
	'1-59 r-"Gnome" c-"Warlock"',
	'60 r-"Gnome" c-"Warlock"'
}

function VGPopulation:CountPopulation()
	self:SetScript("OnUpdate", VGPopulation.OnUpdate)
	VGPopulation.End = getn(VGPopulation.List)
	VGPopulation.Players = 0
	VGPopulation.Counter = 1
	VGPopulation.Trigger = 1
	VGPopulation.Mode = 1
end