ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Initialize()
	self:SetTrigger(true)
	if (self.Enabled == nil) then self.Enabled = true end
  self.Players = {}
end

function ENT:AcceptInput(name, caller, activator, arg)
	name = string.lower(name)
	if (name == "enable") then
		self.Enabled = true
		return true
	elseif (name == "disable") then
		self.Enabled = false
		return true
	end
end

function ENT:KeyValue(k, v)
	k = string.lower(k)

	if (k == "disabled") then
		self.Enabled = (tonumber(v) == 0)
  elseif (string.Left(k, 2) == "on") then
		self:StoreOutput(k, v)
	end
end

function ENT:Enter(ent)
	self.Players[ent] = true
  if (table.Count(self.Players) == player.GetCount()) then
    self:TriggerOutput("onallplayers", self)
    self.Enabled = false
  end
end

function ENT:Leave(ent)
	self.Players[ent] = nil
end

function ENT:Touch(ent)
	if (!self.Enabled && ent:IsPlayer()) then
		self:Leave(ent)
	elseif (self.Enabled && ent:IsPlayer()) then
		self:Enter(ent)
	end
end

function ENT:StartTouch(ent)
	if (self.Enabled && ent:IsPlayer() && ent:Alive()) then
		self:Enter(ent)
	end
end

function ENT:EndTouch(ent)
	if (ent:IsPlayer()) then
		self:Leave(ent)
	end
end