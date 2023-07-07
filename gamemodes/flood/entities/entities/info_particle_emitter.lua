AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:Initialize()
	self:SetSolid(SOLID_NONE)
  self:SetNoDraw(true)
  self:DrawShadow(false)

  self.ParticleName = self.ParticleName or ""
end

function ENT:AcceptInput(name, activator, caller, arg)
	name = string.lower(name)

  if (name == "emitparticle") then
    ParticleEffect(self.ParticleName, self:GetPos(), self:GetAngles())
  end
end

function ENT:KeyValue(k, v)
	k = string.lower(k)

  print(k, v)
	if (k == "particle") then
		self.ParticleName = v
    PrecacheParticleSystem(self.ParticleName)
	end
end