workspace.ShowScorer.Changed:Connect(function()
	script.Parent.Parent.Visible = workspace.ShowScorer.Value
	
	if workspace.Map:FindFirstChild("SoccerBall") then
		script.Parent.Text = workspace.Map.SoccerBall.LastPlayerTouched.Value .. " scored!"
	end
end)
