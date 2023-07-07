AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:SetupDataTables()
  self:NetworkVar("String", 0, "Text")
  self:NetworkVar("String", 1, "Icon")
  self:NetworkVar("Bool", 2, "Enabled")
  self:NetworkVar("Int", 3, "Duration")
end

function ENT:Initialize()
	self:SetSolid(SOLID_NONE)
  self:SetNoDraw(true)
  self:DrawShadow(false)
end

function ENT:AcceptInput(name, activator, caller, arg)
	name = string.lower(name)

  if (name == "show") then
    self:SetEnabled(true)
    net.Start("HintSound")
    net.Broadcast()
    timer.Simple(self:GetDuration(), function()
      self:SetEnabled(false)
    end)
  end
end

function ENT:KeyValue(k, v)
	k = string.lower(k)

	if (k == "text") then
		self:SetText(v)
  elseif (k == "icon") then
    self:SetIcon(v)
	elseif (k == "duration") then
    local duration = math.Clamp(tonumber(v), 0, math.huge)
    self:SetDuration(duration)
  end
end