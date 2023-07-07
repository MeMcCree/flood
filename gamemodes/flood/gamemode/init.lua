AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_hud.lua")

include("shared.lua")
include("sv_player.lua")
include("sv_air.lua")
include("sv_stamina.lua")
include("sv_stage_system.lua")

util.AddNetworkString("HintSound")