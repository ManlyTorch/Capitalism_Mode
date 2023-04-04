local parts = { 
 'BaseStation', 
 '1-Way Hub', 
 '2-Way Hub',
 '4-Way Hub',
 'AdvancedNode',
 'HexBall',
 'HexNode',
 'NormalConverter',
 'Penta-Node',
 'QuadNode',
 'Thin Adapter',
 'Windowed Adapter',
 'TeleportModule',
 'SpaceShipDocking',
 'Miner',
 'TelescopeModule',
 'OrbitalFabricator',
 'OreStorageBig',
  'Earth',
 'Moon',
 'Mars',
 'Venus',
 'AmongUs',
 '',
 '' }

local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local Capitalism = Instance.new("TextButton")

Capitalism.Name = "Capitalism"
Capitalism.Parent = game.Players.LocalPlayer.PlayerGui.MainGui.Menu.Frame.Settings
Capitalism.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Capitalism.BorderColor3 = Color3.fromRGB(121, 121, 121)
Capitalism.Position = UDim2.new(0.699999988, 0, 0, 0)
Capitalism.Size = UDim2.new(0, 199.821, 0, 35.27)
Capitalism.Selected = true
Capitalism.Font = Enum.Font.SourceSans
Capitalism.Text = "Capitalism mode: On"
Capitalism.TextColor3 = Color3.fromRGB(231, 231, 231)
Capitalism.TextSize = 26.555
Capitalism.TextWrapped = true



local function GUI_Script()
	local script = Instance.new('LocalScript', Capitalism)

	local Capitalism = script.Parent
	local ToggleButton = script.Parent.Parent.Capitalism
	local Toggle = true

	local function updateScreen()
		if Toggle == true then
			Capitalism.Text = "Capitalism Mode: On"
		else
			Capitalism.Text = "Capitalism Mode: Off"
		end
	end
	updateScreen()
	
	ToggleButton.MouseButton1Click:Connect(function()
		Toggle = not Toggle
		updateScreen()
	end)
	while task.wait(0.2) and true do
		local plr = game.Players.LocalPlayer
		local Team = game:GetService("Teams")
		local TO = plr.Team.Name

		local Parts = game.Workspace.Stations
		function isItemNOTInList(item, list)
  			for _, i in pairs(list) do
    		 	if item == i then
      				return false
   			 	end
  			end
  			return true
		end
		function RemoveParts(P)
			for _, PC in pairs(P:GetChildren()) do
				PCT = PC:WaitForChild(TO)
				for _, PCTC in pairs(PCT:GetChildren()) do
			      	if isItemNOTInList(PCTC.Name, parts) then
			        	PCTC:Destroy()
			        end
		        end
	    	end
	    end
		while wait(0.0001) and Toggle do
				RemoveParts(Parts)
  			end
		end
	end
coroutine.wrap(GUI_Script)()
