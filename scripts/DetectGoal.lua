function MovePlayersToStartPos()
	local playerService = game:GetService("Players")
	local map = game.Workspace.Map

	for i, player in playerService:GetPlayers() do
		if player.Team == game.Teams.RedTeam then
			player.Character.HumanoidRootPart.Position = map.RedSpawn.Position + Vector3.new(math.random(10), 0, math.random(10))
		else
			player.Character.HumanoidRootPart.Position = map.BlueSpawn.Position + Vector3.new(math.random(10), 0, math.random(10))
		end
	end
end

_G.ActivateConfetti = function(team)
	local emitterName
	
	if team == game.Teams.RedTeam then
		emitterName = "ParticleEmitterRed"
	else
		emitterName = "ParticleEmitterBlue"
	end
	
	local cannons = workspace.Map.ConfettiCannons:GetChildren()
	
	for i, cannon in pairs(cannons) do
		local emitter = cannon:FindFirstChild(emitterName)
		emitter.Enabled = true
	end
	
	wait(4)
	
	for i, cannon in pairs(cannons) do
		local emitter = cannon:FindFirstChild(emitterName)
		emitter.Enabled = false
	end
	
	
end


function Restart()	
	
	workspace.Map.SoccerBall.Position = workspace.Map.SoccerBallStart.Position
	workspace.Map.SoccerBall.Velocity = Vector3.new(0, 0, 0)
	MovePlayersToStartPos()

end


workspace.Map.GoalRed.RedGoalDetecter.Touched:Connect(function(hit)
	
	if hit == workspace.Map.SoccerBall then
	
		workspace.Scores.BlueScore.Value = workspace.Scores.BlueScore.Value + 1
		
		Restart()
		
		workspace.ShowScorer.Value = true	
		_G.ActivateConfetti(game.Teams.BlueTeam)
		workspace.ShowScorer.Value = false
		
	end
end)


workspace.Map.GoalBlue.BlueGoalDetecter.Touched:Connect(function(hit)	
	
	if hit == workspace.Map.SoccerBall then

		workspace.Scores.RedScore.Value = workspace.Scores.RedScore.Value + 1
		
		Restart()
		
		workspace.ShowScorer.Value = true		
		_G.ActivateConfetti(game.Teams.RedTeam)
		workspace.ShowScorer.Value = false		

	end
end)
