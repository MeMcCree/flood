AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:Initialize()
	self:SetSolid(SOLID_NONE)
  self:SetNoDraw(true)
  self:DrawShadow(false)
end

function ENT:OnStageEnd()
  self:TriggerOutput("onstageend", self)
end

function ENT:KeyValue(k, v)
	k = string.lower(k)

	if (string.Left(k, 2) == "on") then
		self:StoreOutput(k, v)
	end
end