include("shared.lua")
include("cl_hud.lua")

net.Receive("HintSound", function()
  surface.PlaySound("ambient/levels/canals/drip1.wav")
end)