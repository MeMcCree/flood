local elementsToHide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
  ["CTargetID"] = true
}

hook.Add("HUDShouldDraw", "HideHUD", function(name)
	if (elementsToHide[name]) then
		return false
	end
end)

local drownEffect = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 1,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

local lerpedAir = 100
local lerpedStamina = 100

hook.Add("RenderScreenspaceEffects", "ScreenEffects", function()
  lerpedAir = math.Approach(lerpedAir, LocalPlayer():GetAir(), 1)
  lerpedStamina = math.Approach(lerpedStamina, LocalPlayer():GetStamina(), 1)
  drownEffect["$pp_colour_brightness"] = -0.3 * (1 - lerpedAir / LocalPlayer():GetMaxAir())
  drownEffect["$pp_colour_colour"] = math.Clamp(lerpedAir / LocalPlayer():GetMaxAir(), 0.5, 1)
	DrawColorModify(drownEffect)
  DrawMotionBlur(0.25, (1 - lerpedStamina / LocalPlayer():GetMaxStamina()) * 2, 0.01)
end)

hook.Add("HUDPaint", "DrawHints", function()
	local hints = ents.FindByClass("point_hint")
	for _, hint in ipairs(hints) do
		if (hint:GetEnabled()) then
			local data2d = hint:GetPos():ToScreen()
			if (not data2d.visible) then continue end
			surface.SetMaterial(Material(hint:GetIcon()))
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawTexturedRect(data2d.x - 8 - 16, data2d.y - 8, 16, 16)
			render.SetColorMaterial()
			draw.SimpleText(hint:GetText(), "TargetID", data2d.x, data2d.y, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
	end
end)