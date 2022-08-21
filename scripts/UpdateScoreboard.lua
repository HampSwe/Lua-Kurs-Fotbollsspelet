workspace.Scores.BlueScore.Changed:Connect(function()
	workspace.Map.Scoreboard.SurfaceGui.Frame.BlueScoreLabel.Text = tostring(workspace.Scores.BlueScore.Value)
end)

workspace.Scores.RedScore.Changed:Connect(function()
	workspace.Map.Scoreboard.SurfaceGui.Frame.RedScoreLabel.Text = tostring(workspace.Scores.RedScore.Value)
end)
