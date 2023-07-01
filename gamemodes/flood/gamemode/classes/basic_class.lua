DEFINE_BASECLASS("player_default")

local class = {}

class.SlowWalkSpeed = 75
class.WalkSpeed = 125
class.RunSpeed = 250
class.AvoidPlayers = true
class.TeammateNoCollide = true

class.weapons = {}

class.playermodel = "models/player/Group01/male_03.mdl"

function class:SetupDataTables()
    self.Player:NetworkVar("Float", 0, "Air")
    self.Player:NetworkVar("Float", 1, "MaxAir")
    self.Player:NetworkVar("Float", 2, "Stamina")
    self.Player:NetworkVar("Float", 3, "MaxStamina")

    if (SERVER) then
        self.Player:SetAir(100)
        self.Player:SetMaxAir(100)
        self.Player:SetStamina(100)
        self.Player:SetMaxStamina(100)
    end
end

function class:init()
    self.Player:SetModel(self.playermodel)

    self.Player:SetWalkSpeed(self.WalkSpeed)
    self.Player:SetRunSpeed(self.RunSpeed)
    self.Player:SetSlowWalkSpeed(self.SlowWalkSpeed)
    self.Player:SetJumpPower(175)

    self.Player:SetAvoidPlayers(true)
    self.Player:SetNoCollideWithTeammates(true)
    self.Player:SetTeam(0)

    self.Player.drown = false
end

player_manager.RegisterClass("basic_class", class, "player_default")