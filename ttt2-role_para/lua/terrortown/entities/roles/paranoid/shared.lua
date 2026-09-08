if SERVER then
	AddCSLuaFile()

	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_para.vmt")
	
	-- server only convars
	CreateConVar("ttt2_paranoid_annouce_death", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
	CreateConVar("ttt2_paranoid_show_dead_body", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
end

function ROLE:PreInitialize()
	self.color = Color(80, 173, 59, 255)

	self.abbr = "para"
	self.surviveBonus = 0
	self.scoreKillsMultiplier = 2
	self.scoreTeamKillsMultiplier = -8
	self.unknownTeam = true

	self.defaultTeam = TEAM_INNOCENT

	self.conVarData = {
		pct = 0.12,
		maximum = 1,
		minPlayers = 5,
		credits = 0,
		togglable = true,
		random = 25,
		traitorButton = 0,
		shopFallback = SHOP_DISABLED
	}
end

-- now link this subrole with its baserole
function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_INNOCENT)
end

if SERVER then
	-- give loadout on respawn and rolechange
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentItem("item_ttt_dms")
	end

	-- remove loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:RemoveEquipmentItem("item_ttt_dms")
	end
end