game:GetService("Players").PlayerAdded:Connect(function(player)
	wait(3)
	
	if workspace.GameStarted.Value then
		if player.Team == game.Teams.RedTeam then
			player.Character.HumanoidRootPart.Position = workspace.Map.RedSpawn.Position
		else
			player.Character.HumanoidRootPart.Position = workspace.Map.BlueSpawn.Position
		end
	end
end)
