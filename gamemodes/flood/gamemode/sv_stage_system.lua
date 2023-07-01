CHECKPOINT = CHECKPOINT or NULL

function RestartStage()
  for _, ply in ipairs(player.GetAll()) do
    ply:Spawn()
  end

  local logicStages = ents.FindByClass("logic_stage")
  for _, logic in ipairs(logicStages) do
    logic:OnStageEnd()
  end
end