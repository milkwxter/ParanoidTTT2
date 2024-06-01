if SERVER then
	AddCSLuaFile()

	resource.AddFile("materials/vgui/ttt/perks/hud_parachute.png")
end

ITEM.hud = Material("vgui/ttt/perks/hud_parachute.png")
ITEM.EquipMenuData = {
	type = "item_passive",
	name = "Dead Man's Switch",
	desc = "Upon your death, everyone will be notified."
}
ITEM.material = "vgui/ttt/perks/dms.png"