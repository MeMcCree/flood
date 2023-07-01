AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:Initialize()
	self:SetSolid(SOLID_NONE)
  self:SetNoDraw(true)
  self:DrawShadow(false)
end

function ENT:AcceptInput(name, activator, caller, arg)
	name = string.lower(name)

  if (name == "setascurcheckpoint") then
    CHECKPOINT = self
  end
end