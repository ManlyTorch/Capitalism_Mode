if game.PlaceId == 4918537844 then
    task.wait(5)
    local Lplr = game.Players.LocalPlayer
    local MainGui = Lplr.PlayerGui:WaitForChild("MainGui")
    if not MainGui.Menu.Frame.Settings.MuteMusic.Selectable then
        print("You already executed the script!")
    else
    	game.ReplicatedStorage.Functions.GetModuleInventory:InvokeServer()
        MainGui.Menu.Frame.Settings.MuteMusic.Selectable = false
        CapitalismConfigButton = Instance.new("TextButton", MainGui.Menu.Frame.Settings)
        CapitalismConfigButton.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
        CapitalismConfigButton.BorderColor3 = Color3.fromRGB(120, 120, 120)
        CapitalismConfigButton.Position = UDim2.new(0.6916, 0, 0.09416, 0)
        CapitalismConfigButton.Size = UDim2.new(0.304503, 0, 0.068417996, 0)
        CapitalismConfigButton.Font = Enum.Font.SourceSans
        CapitalismConfigButton.Text = "Capitalism Config"
        CapitalismConfigButton.TextScaled = true
        CapitalismConfigButton.TextWrapped = true
        CapitalismConfigButton.BorderSizePixel = 1
        CapitalismConfigButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        CapitalismConfigButton.Name = "CapitalismConfigButton"
        ScreenGui = Instance.new("ScreenGui", game.CoreGui)
        ScreenGui.Name = "Capitalism Config"
        CapitalismConfig = Lplr.PlayerGui:WaitForChild("Shop"):Clone()
        CapitalismConfig.Parent = ScreenGui
        CapitalismConfigClose = Instance.new("TextButton", CapitalismConfig.Tabs)
        CapitalismConfigClose.TextScaled = true
        CapitalismConfigClose.Position = UDim2.new(1.005116959064327, 0, 0.8332098948303955, 0)
        CapitalismConfigClose.BackgroundColor3 = Color3.fromRGB(150, 18, 18)
        CapitalismConfigClose.BorderColor3 = Color3.fromRGB(47, 47, 47)
        CapitalismConfigClose.Font = Enum.Font.SourceSansBold
        CapitalismConfigClose.TextColor3 = Color3.fromRGB(255, 255, 255)
        CapitalismConfigClose.Text = "Close"
        CapitalismConfigClose.Size = UDim2.new(1.142178362573099, 0, 0.185159811433248, 0)

        for i, v in pairs(CapitalismConfig:GetChildren()) do
            if v.Name == "LocalScript" then
                v:Destroy()
            elseif v.Name == "ModuleViewerHandler" then
                v:Destroy()
            elseif v.Name == "Info" then
                v:Destroy()
            elseif v.Name == "Notice" then
               v:Destroy()
            end
        end

        local CloseConfigTabs = {
            MainGui.Manage,
            MainGui.Bank,
            MainGui.Edit,
            MainGui.Menu,
            MainGui.Research,
            CapitalismConfigClose,
            MainGui.Menu.Frame.Frame.SpaceAgency,
            MainGui.Menu.Frame.Frame.Feedback
        }

        for i = 1, 8, 1 do
            CloseConfigTabs[i].MouseButton1Click:Connect(function()
                CapitalismConfig.Enabled = false
            end)
        end

        CapitalismConfigButton.MouseButton1Click:Connect(function()
           CapitalismConfig.Enabled = not CapitalismConfig.Enabled
        end)

        for i, v in pairs(CapitalismConfig:GetDescendants()) do
            if v.Name == "Cost" then
                v:Destroy()
            end
        end

        local UIS = game:GetService("UserInputService")
        local Modules = {
            'Earth',
            'Moon',
            'Mars',
            'Venus',
            'AmongUs',
            'Canada',
            'Britain',
            'USA',
            'China',
            'Europe',
            'India',
            'Russia',
            'Japan',
            'BaseStation'
        }

        local Settings = {
            Modules,
            false,
            false
        }

        local filename = "SSI_Capitalism_Settings.txt";

        local function loadSettings()
            local HttpService = game:GetService("HttpService")
            if (readfile and isfile and isfile(filename)) then
                Settings = HttpService:JSONDecode(readfile(filename));
                return true
            else
                return false
            end
        end

        loadSettings()

        local function saveSettings()
            local json;
            local HttpService = game:GetService("HttpService");
            if (writefile) then
                json = HttpService:JSONEncode(Settings);
                writefile(filename, json);
            else
                print("Your executor isn't supported (you can still use the script, settings won't save though)")
            end
        end

        local function LISTADDREMOVE(Module)
            for i, v in pairs(Settings[1]) do
                for i2, v2 in pairs(Module:GetChildren()) do
                    if v2:IsA("TextLabel") then
                        v2.TextColor3 = Color3.fromRGB(255,0,0)
                    end
                    if v2.Name == v then
                        ListToggle = false
                        if v2:IsA("Model") then
                            table.remove(Settings[1], i)
                        end
                    else
                        ListToggle = true
                    end
                end
            end
            if ListToggle then
                for i2, v in pairs(Module:GetChildren()) do
                    if v:IsA("Model") then
                        table.insert(Settings[1], v.Name)
                    elseif v:IsA("TextLabel") then
                        v.TextColor3 = Color3.fromRGB(0,255,0)
                    end
                end
            end
            saveSettings()
        end

        local function UpdateButtonColor(Module)
            for i, v in pairs(Settings[1]) do
                for i2, v2 in pairs(Module:GetChildren()) do
                    if v2:IsA("Model") then
                        if v2.Name == v then
                            g = i
                        end
                    end
                end
            end
            for i, v in pairs(Module:GetChildren()) do
                if v:IsA("Model") then
                    if Settings[1][g] == v.Name then
                        for i2, v2 in pairs(Module:GetChildren()) do
                            if v2:IsA("TextLabel") then
                                v2.TextColor3 = Color3.fromRGB(0,255,0)
                            end
                            
                        end
                    else
                        for i3, v3 in pairs(Module:GetChildren()) do
                            if v3:IsA("TextLabel") then
                                v3.TextColor3 = Color3.fromRGB(255,0,0)
                            end
                        end
                    end
                end
            end
        end

        for i2, v2 in pairs(CapitalismConfig:GetChildren()) do
            if v2.Name ~= "Tabs" and v2.Name ~= "Info" and v2.Name ~= "LocalScript" and v2.Name ~= "ModuleViewerHandler" then
                for i, v in pairs(v2.FixFrame:GetChildren()) do
                    if v.Name ~= "UIGridLayout" and v.Name ~= "UIPadding" then
                        UpdateButtonColor(v)
                        Newbutton = Instance.new("TextButton")
                        GRID = Instance.new("UIGridLayout")
                        Newbutton.Name = v.Name
                        Newbutton.Parent = v.Parent
                        Newbutton.BackgroundTransparency = 1
                        Newbutton.BorderSizePixel = 0
                        Newbutton.TextTransparency = 1
                        GRID.Parent = Newbutton
                        GRID.CellSize = UDim2.new(0, 90, 0, 90)
                        v.Parent = Newbutton
                        v.Parent.MouseButton1Click:Connect(function()
                            LISTADDREMOVE(v)
                        end)
                    end
                end
            end
        end

        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)

        local CapitalismToggle = Instance.new("TextButton")

        CapitalismToggle.Name = "Capitalism Toggle"
        CapitalismToggle.Parent = MainGui.Menu.Frame.Settings
        CapitalismToggle.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
        CapitalismToggle.BorderColor3 = Color3.fromRGB(120, 120, 120)
        CapitalismToggle.Position = UDim2.new(0.6916, 0, 0, 0)
        CapitalismToggle.Size = UDim2.new(0.304503, 0, 0.068417996, 0)
        CapitalismToggle.Selected = true
        CapitalismToggle.Font = Enum.Font.SourceSans
        CapitalismToggle.Text = "Capitalism mode: On"
        CapitalismToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        CapitalismToggle.TextScaled = true
        CapitalismToggle.TextWrapped = true  

        local StationsToggle = Instance.new("TextButton")

        StationsToggle.Name = "Stations Toggle"
        StationsToggle.Parent = MainGui.Menu.Frame.Settings
        StationsToggle.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
        StationsToggle.BorderColor3 = Color3.fromRGB(120, 120, 120)
        StationsToggle.Position = UDim2.new(0.345842, 0, 0.09416, 0)
        StationsToggle.Size = UDim2.new(0.304503, 0, 0.068417996, 0)
        StationsToggle.Selected = true
        StationsToggle.Font = Enum.Font.SourceSans
        StationsToggle.Text = "Stations Toggle: Off"
        StationsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        StationsToggle.TextScaled = true
        StationsToggle.TextWrapped = true
        local TabMainLocations = game.CoreGui["Capitalism Config"].Shop.Tabs
        local Tabs = {
            "Inventory",
            "ISSParts",
            "Gamepass",
            "Ships",
            "Mining",
            "Spacecraft",
            "PowerGeneration",
            "Structural",
            "Other"
        }

        local function Close()
            for i = 1, 9, 1 do
                TabMainLocations.Parent[Tabs[i]].Visible = false
                TabMainLocations[Tabs[i]].TextColor3 = Color3.fromRGB(121, 121, 121)
            end
        end

        for i = 1, 9, 1 do
            TabMainLocations[Tabs[i]].MouseButton1Click:Connect(function()
                Close()
                TabMainLocations.Parent[Tabs[i]].Visible = true
                TabMainLocations[Tabs[i]].TextColor3 = Color3.fromRGB(255, 255, 255)
            end)
        end

        local Buttons = {
            nil,
            CapitalismToggle,
            StationsToggle
        }
        local TeamName = Lplr.Team.Name
        local Stations = game.Workspace.Stations

        local function isItemNOTInList(item, list)
            for _, i in pairs(list) do
                if item == i then
                    return false
                end
            end
            return true
        end

        function RemoveParts(Part)
            task.wait(0.0001)
            if Settings[2] then
                if isItemNOTInList(Part.Name, Settings[1]) then
                    Part:Destroy()
                end
            end
        end

        for i, v in pairs(Stations:GetChildren()) do
            for j, k in pairs(v:GetChildren()) do
                k.ChildAdded:Connect(function(child)
                    RemoveParts(child)
                end)
            end
        end

        local function UpdateButtons(i)
            if Settings[i] == true then
                Buttons[i].Text = Buttons[i].Name..": On"
            else
                Buttons[i].Text = Buttons[i].Name..": Off"
            end
            if Settings[2] then
                for i, v in pairs(Stations:GetChildren()) do
                    if Settings[3] then
                        for j, k in pairs(v:GetChildren()) do
                            for m, l in pairs(k:GetChildren()) do
                                RemoveParts(l)
                            end
                        end
                    else
                        for j, k in pairs(v[TeamName]:GetChildren()) do
                            RemoveParts(k)
                        end
                    end
                end
            end
        end

        for i = 2, 3, 1 do
            UpdateButtons(i)
            Buttons[i].MouseButton1Click:Connect(function()
                Settings[i] = not Settings[i]
                UpdateButtons(i)
                saveSettings()
            end)
        end

		local function UpdateModuleList()
			for i1,v1 in pairs(CapitalismConfig:GetChildren()) do
				if v1.Name ~= "Tabs" then
					for i2,v2 in pairs(v1.FixFrame:GetChildren()) do
						for i3,v3 in pairs(v2:GetChildren()) do
							if v3:IsA("ViewportFrame") then
								v3.Visible = true
							end
						end
					end
				end
			end
		end
		UpdateModuleList()
    end
end
