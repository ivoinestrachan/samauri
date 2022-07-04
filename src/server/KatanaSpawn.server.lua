game.Players.PlayerAdded:Connect(function(Player)
Player.CharacterAdded:Connect(function(Character)
		local Case = script.Case:Clone()
	Case:SetPrimaryPartCFrame(Character.LowerTorso.CFrame)
	Case.Parent = Character
		
local weld = Instance.new("ManualWeld")
	weld.Part0 = Case.PrimaryPart
	weld.Part1 = Character.PrimaryPart
	weld.C0 = weld.Part0.CFrame:ToObjectSpace(weld.Part1.CFrame)
	weld.Parent = weld.Part0
		
		local Sword = script.Katana:Clone()
	Sword:SetPrimaryPartCFrame(Case.Case.CFrame * CFrame.new(0,-0.2,-4))
	Sword.Parent = Character

	local weld2 = Instance.new("ManualWeld")
	weld2.Name = "SideWeld"
		weld2.Part0 = Sword.PrimaryPart
		weld2.Part1 = Case.PrimaryPart
	weld2.C0 = weld2.Part0.CFrame:ToObjectSpace(weld2.Part1.CFrame)
		weld2.Parent = weld2.Part0 
	end)
end)