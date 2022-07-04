local rp = game:GetService("ReplicatedStorage")

local Katana = rp:WaitForChild("Katana") 

local cframes ={
	["Right Arm"] = CFrame.new(0,-1,0),
	["RightHand"] = CFrame.new(0,0,0)
}

Katana.OnServerEvent:Connect(function(Player,isEquipped)
	local Character = Player.Character
	local Humanoid = Character.Humanoid
	
	if isEquipped then 
		local Katana = Character:FindFirstChild("Katana")
		if Katana then 
			local SideWeld = Katana.PrimaryPart:FindFirstChild("SideWeld")
			if SideWeld then
				SideWeld:Destroy()
				if Humanoid.RigType == Enum.HumanoidRigType.R15 then 
					Katana:SetPrimaryPartCFrame(Character:WaitForChild("RightHand").CFrame * cframes["RightHand"])
				end
				local HandWeld = Instance.new("ManualWeld")
				HandWeld.Name = "HandWeld"
				HandWeld.Part0 = Katana.PrimaryPart
				if Humanoid.RigType == Enum.HumanoidRigType.R15 then 
					HandWeld.Part1 = Character:WaitForChild("RightHand")
				end
				HandWeld.C0 = HandWeld.Part0.CFrame:ToObjectSpace(HandWeld.Part1.CFrame)
				HandWeld.Parent = HandWeld.Part0
			end
		end
		
	elseif not isEquipped then
		local Katana = Character:FindFirstChild("Katana")
		if Katana then 
			local HandWeld = Katana.PrimaryPart:FindFirstChild("HandWeld")
			if HandWeld then 
				HandWeld:Destroy()
				
				local Case = Character:FindFirstChild("Case")
				if Case then
					Katana:SetPrimaryPartCFrame(Case.Case.CFrame * CFrame.new(0,-0.2,-4))
					
					local weld2 = Instance.new("ManualWeld")
					weld2.Name = "SideWeld"
					weld2.Part0 = Katana.PrimaryPart
					weld2.Part1 = Case.PrimaryPart
					weld2.C0 = weld2.Part0.CFrame:ToObjectSpace(weld2.Part1.CFrame)
					weld2.Parent = weld2.Part0
				end
			end
		end
	end
	
end)