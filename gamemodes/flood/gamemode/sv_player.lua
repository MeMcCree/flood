local _P = FindMetaTable("Player")

function _P:Init()
  player_manager.SetPlayerClass(self, "basic_class")
  player_manager.RunClass(self, "init")
end

function GM:PlayerSpawn(ply)
  ply:Init()
	if (IsValid(CHECKPOINT)) then
		ply:SetPos(CHECKPOINT:GetPos())
	end
end

function _P:AddAir(amount, n, m)
	clamp = (n != nil)
	self:SetAir(self:GetAir() + amount)
	if (clamp) then
		self:SetAir(math.Clamp(self:GetAir(), n, m))
	end
end

function _P:SubAir(amount, n, m)
	clamp = (n != nil)
	self:SetAir(self:GetAir() - amount)
	if (clamp) then
		self:SetAir(math.Clamp(self:GetAir(), n, m))
	end
end

function _P:AddStamina(amount, n, m)
	clamp = (n != nil)
	self:SetStamina(self:GetStamina() + amount)
	if (clamp) then
		self:SetStamina(math.Clamp(self:GetStamina(), n, m))
	end
end

function _P:SubStamina(amount, n, m)
	clamp = (n != nil)
	self:SetStamina(self:GetStamina() - amount)
	if (clamp) then
		self:SetStamina(math.Clamp(self:GetStamina(), n, m))
	end
end