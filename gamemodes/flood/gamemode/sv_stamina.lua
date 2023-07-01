local staminaPrevThink = staminaPrevThink or 0
local staminaTickTime = .35
local staminaLostAddPerTick = .5

hook.Add("Think", "staminaThink", function()
	if (CurTime() - staminaPrevThink <= staminaTickTime) then return end
	staminaPrevThink = CurTime()

	for _, v in ipairs(player.GetAll()) do
		if (!v:Alive()) then continue end

		if (v:WaterLevel() == 0) then
      v.drown = false
			v:AddStamina(staminaLostAddPerTick, 0, v:GetMaxStamina())
		else
			v:SubStamina(staminaLostAddPerTick, 0, v:GetMaxStamina())
		end
	end
end)

local pushPrevThink = pushPrevThink or 0
local pushTickTime = 2

hook.Add("Think", "pushThink", function()
  if (CurTime() - pushPrevThink <= pushTickTime) then return end
	pushPrevThink = CurTime()

	for _, v in ipairs(player.GetAll()) do
		if (!v:Alive()) then continue end

		if (v:WaterLevel() != 0 and v:GetStamina() < 100) then
			v.drown = not v.drown
		end
	end
end)

function GM:Move(ply, mv)
  if (ply.drown) then
    mv:SetVelocity(Vector(0, 0, -1) * (1 - math.pow(ply:GetStamina() / ply:GetMaxStamina(), 3)))
    mv:SetOrigin(mv:GetOrigin() + mv:GetVelocity() * 250 * FrameTime())
		return true
  end
end