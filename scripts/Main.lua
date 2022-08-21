local playerService = game:GetService("Players")
local status = game.Workspace.Status

local requiredPlayers = 2
local gameLength = 120

-- Väntar på spelare

while true do
	
	workspace.GameStarted.Value = false --extra
	
	status.Value = "Waiting for enough players..."


	while playerService.NumPlayers < requiredPlayers do
		wait(0.1)
	end

	-- Nedräkning från 10

	for i = 10, 0, -1 do
		status.Value = "Starting game in " .. i .. " seconds"
		wait(1)
	end



	-- Flyttar alla spelare till sina start-positioner

	function MovePlayersToStartPos()
		local map = game.Workspace.Map

		for i, player in playerService:GetPlayers() do
			if player.Team == game.Teams.RedTeam then
				player.Character.HumanoidRootPart.Position = map.RedSpawn.Position + Vector3.new(math.random(10), 0, math.random(10))
			else
				player.Character.HumanoidRootPart.Position = map.BlueSpawn.Position + Vector3.new(math.random(10), 0, math.random(10))
			end
		end
	end


	-- Starta spelet
	
	
	-- Extra
	soccerball = game.ServerStorage.SoccerBall:Clone()
	soccerball.Parent = workspace.Map

	MovePlayersToStartPos()
	workspace.Map.SoccerBall.Position = workspace.Map.SoccerBallStart.Position
	workspace.Scores.RedScore.Value = 0
	workspace.Scores.BlueScore.Value = 0

	local time = 0
	workspace.GameStarted.Value = true --extra

	while time < gameLength do
		status.Value = tostring(gameLength - time) .. " seconds left"
		
		wait(1)
		time = time + 1
		
	end

	-- Spelet är klart
	
	soccerball:Destroy() --extra
	
	if workspace.Scores.RedScore.Value > workspace.Scores.BlueScore.Value then
		status.Value = "Red won!"
		_G.ActivateConfetti(game.Teams.RedTeam) --extra
		
	elseif workspace.Scores.RedScore.Value < workspace.Scores.BlueScore.Value then
		status.Value = "Blue won!"
		_G.ActivateConfetti(game.Teams.BlueTeam) --extra
	else
		status.Value = "Draw!"
	end
	
	wait(1)

	for i, player in pairs(playerService:GetPlayers()) do
		player:LoadCharacter()
	end

	wait(5)
	
	
	
	-- Delar in spelare i lag slumpmässigt (EXTRA)

	function ShuffleTeams()
		local players = playerService:GetPlayers()
		local redPlayers = {}
		local bluePlayers = {}
		
		for i, plr in players do
			plr.Team = nil
		end
		
		wait(1)

		for i, plr in players do
			if #redPlayers > #bluePlayers then
				table.insert(bluePlayers, plr)

			elseif #bluePlayers > #redPlayers then
				table.insert(redPlayers, plr)

			else
				local number = math.random(1, 2)

				if number == 1 then
					table.insert(redPlayers, plr)
				else
					table.insert(bluePlayers, plr)
				end
			end
		end

		for i, plr in redPlayers do
			plr.Team = game.Teams.RedTeam
		end

		for i, plr in bluePlayers do
			plr.Team = game.Teams.BlueTeam
		end
	end
	
	
	ShuffleTeams()
	
end
