local airPrevThink = airPrevThink or 0
local airTickTime = .1
local airLostPerTick = 2.5
local airAddPerTick = 2.5

hook.Add("Think", "airThink", function()
	if (CurTime() - airPrevThink <= airTickTime) then return end
	airPrevThink = CurTime()

	for _, v in ipairs(player.GetAll()) do
		if (!v:Alive()) then continue end

		if (v:WaterLevel() != 3) then
			v:AddAir(airAddPerTick, 0, 100)
		else
			v:SubAir(airLostPerTick, 0, v:GetMaxAir())
		end
	end
end)

local hpLossPrevThink = hpLossPrevThink or 0
local hpLossTickTime = 1
local hpLostPerTick = 10

hook.Add("Think", "hpLossThink", function()
	if (CurTime() - hpLossPrevThink <= hpLossTickTime) then return end
	hpLossPrevThink = CurTime()

	for _, v in ipairs(player.GetAll()) do
		if (!v:Alive()) then continue end

		if (v:WaterLevel() == 3 and v:GetAir() == 0) then
      RestartStage()
    end
	end
end)