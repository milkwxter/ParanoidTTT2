if SERVER then
	AddCSLuaFile()
	util.AddNetworkString("ttt2_para_death")
	resource.AddFile("materials/vgui/ttt/perks/dms.png")
end

ITEM.hud = Material("vgui/ttt/perks/dms.png")
ITEM.EquipMenuData = {
	type = "item_passive",
	name = "lang_para_dms_name",
	desc = "lang_para_dms_desc"
}
ITEM.material = "vgui/ttt/perks/dms.png"
ITEM.CanBuy = {}
ITEM.limited = true

if SERVER then
	-- Add the wallhacks on your dead body
	hook.Add("TTTOnCorpseCreated", "ParaAddedDeadBody", function(rag, ply)
		if not IsValid(rag) or not IsValid(ply) then return end

		-- check if the guy who died actually has our item
		if not ply:HasEquipmentItem("item_ttt_dms") then return end

		-- send net message to clients so they know he died
		SendFullStateUpdate()
		net.Start("ttt2_para_death")
		net.Broadcast()

		local mvObject = rag:AddMarkerVision("corpse_para")
		mvObject:SetOwner(ROLE_PARANOID)
		mvObject:SetVisibleFor(VISIBLE_FOR_ALL)
		mvObject:SyncToClients()
	end)
	
	-- Remove the wallhacks on dead bodies
	hook.Add("EntityRemoved", "ParaRemovedDeadBody", function(ent)
		if not IsValid(ent) or ent:GetClass() ~= "prop_ragdoll" then return end

		ent:RemoveMarkerVision("corpse_para")
	end)
end

-- actual wallhacks part
if CLIENT then
	local TryT = LANG.TryTranslation
	local ParT = LANG.GetParamTranslation

	local materialCorpse = Material("vgui/ttt/tid/tid_big_corpse")

	hook.Add("TTT2RenderMarkerVisionInfo", "HUDDrawMarkerVisionVultCorpse", function(mvData)
		local client = LocalPlayer()
		local ent = mvData:GetEntity()
		local mvObject = mvData:GetMarkerVisionObject()

		if not client:IsTerror() or not mvObject:IsObjectFor(ent, "corpse_para") then return end

		local distance = math.Round(util.HammerUnitsToMeters(mvData:GetEntityDistance()), 1)

		mvData:EnableText()

		mvData:AddIcon(materialCorpse)
		mvData:SetTitle(TryT("lang_para_body_text"))

		mvData:AddDescriptionLine(ParT("marker_vision_distance", {distance = distance}))
		mvData:AddDescriptionLine(TryT(mvObject:GetVisibleForTranslationKey()), COLOR_SLATEGRAY)
	end)
end