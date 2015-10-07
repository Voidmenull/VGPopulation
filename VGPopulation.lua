VGPopulation = CreateFrame("Frame",nil);

VGPopulation.Time = 0
VGPopulation.Counter = 0
VGPopulation.End = 0
VGPopulation.Trigger = 0
VGPopulation.Delay = 0.1
VGPopulation.Players = 0
VGPopulation.Mode = 0


function VGPopulation:OnUpdate()
	if VGPopulation.Trigger == 1 and VGPopulation.Mode == 1 and GetTime() >= VGPopulation.Time + VGPopulation.Delay and VGPopulation.Counter >= 1 then
		SendWho(VGPopulation.Zones[VGPopulation.Counter])
		VGPopulation.Time = GetTime()
		VGPopulation.Mode = 2
		
	elseif VGPopulation.Trigger == 1 and VGPopulation.Mode == 2 and GetTime() >= VGPopulation.Time + VGPopulation.Delay and VGPopulation.Counter >= 1 then
		local numWhos = GetNumWhoResults()
		VGPopulation.Players = VGPopulation.Players + numWhos
		DEFAULT_CHAT_FRAME:AddMessage("Players: "..VGPopulation.Players.." -- Progress: "..VGPopulation.Counter.."/"..VGPopulation.End)
		VGPopulation.Time = GetTime()
		VGPopulation.Counter = VGPopulation.Counter + 1
		VGPopulation.Mode = 1
		if VGPopulation.Counter > VGPopulation.End then VGPopulation.Trigger = 0; VGPopulation.Mode = 0 end
	end
end

VGPopulation:SetScript("OnUpdate", VGPopulation.OnUpdate)

VGPopulation.Zones = 
{
	"Elwynn",
	"Morogh",
	"Tirisfal",
	"Modan",	
	"Silverpine",
	"Westfall",
	"Redridge",
	"Duskwood",
	"Hillsbrad",
	"Wetlands",
	"Alterac", -- also pvp wise
	"Arathi", -- also pvp wise
	"Stranglethorn",
	"Badlands",
	"Sorrows",
	"Hinterlands",
	"Searing",
	"Blasted",
	"Steppes",
	"Plaguelands", -- both
	"Blackrock", -- also dungeons
	"Deadwind",
	"Durotar",
	"Mulgore",
	"Teldrassil",
	"Darkshore",
	"Barrens",
	"Stonetalon",
	"Ashenvale",
	"Needles",
	"Desolace",
	"Dustwallow",
	"Feralas",
	"Tanaris",
	"Azshara",
	"Felwood",
	"Un'goro",
	"Winterspring",
	"Silithus",
	"Moonglade",
	"Ragefire",
	"Wailing",
	"Deadmines",
	"Shadowfang",
	"Blackfathom",
	"Stockade",
	"Gnomeregan",
	"Razorfen", -- both dungeons
	"Monastery", -- all dungeons
	"Uldaman",
	"Zul'Farrak",
	"Maraudon",
	"Atal'Hakkar",
	"Dire", -- dungeons
	"Stratholme",
	"Scholomance",
	"Onyxia",
	"Zul'Gurub",
	"Molten",
	"Blackwing",
	"Ahn'Qiraj", -- both dungeons
	"Naxxramas",
	"Warsong",
	-- citys
	"Darnassus",
	"Orgrimmar",
	"Bluff",
	"Undercity",
	"Ironforge",
	"Stormwind"
}

function VGPopulation:CountPopulation()
	VGPopulation.End = getn(VGPopulation.Zones)
	VGPopulation.Players = 0
	VGPopulation.Counter = 1
	VGPopulation.Trigger = 1
	VGPopulation.Mode = 1
end