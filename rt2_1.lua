if _G.SimpleCodeExecuted and type(_G.SimpleCodeShutdown) == "function" then
	print(pcall(_G.SimpleCodeShutdown))
end

--Made by : https://v3rmillion.net/member.php?action=profile&uid=507120
--Go vouch release thread : https://v3rmillion.net/showthread.php?tid=1040650

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Retail Tycoon 2 Cheat") -- Creates the window
local q = library:CreateWindow("Retail Tycoon 2 Unlock Land") -- Creates the window

local folder1 = w:CreateFolder("Dock") -- Creates the folder(U will put here your buttons,etc)
local folder2 = w:CreateFolder("Get position")
local folderq1 = q:CreateFolder("Crack Unlock All Land")

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local plots = workspace.Map.Plots
local LocalPlayer = game:GetService("Players").LocalPlayer
local playerName = LocalPlayer.Character.Name
local playerCarName = "Vehicle_" .. playerName
local player = game.Players.LocalPlayer
local Dock = workspace:FindFirstChild("Map").Landmarks:FindFirstChild("Loading Dock")

function GetPlayerPlot()
    local remotesFolder = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
    local getStatsRemote = remotesFolder:WaitForChild("GetPlotData")
    local result = getStatsRemote:InvokeServer()
    local plotsum = 1
    if type(result) == "table" then
        for key1, value1 in pairs(result) do
            -- print(key1, value1)
            local plot = value1
            for key2, value2 in pairs(value1) do
                -- print(key2, value2)
                if key2 == "Owner" then
                    if value2 == playerName then
                        local plotName = "Plot_"..plotsum
                        print(plotName)
                        return plotName
                    end
                end
            end
            plotsum += 1
        end
    else
        print("Result is not a table")
    end
    wait(1)
end

function teleportToUnloadDock()
    local plot = plots:FindFirstChild(tostring(GetPlayerPlot()))
    local walls = plot.Walls:FindFirstChild("Floor_1"):GetChildren()
    if walls then
        for i,key in ipairs(walls) do
            print(key.Name)
            if key:FindFirstChild("Type").Value == "TruckDoor2" then
                local unloadDock = key:FindFirstChild("Door_1"):FindFirstChild("Handle")
                print("teleportToUnloadDock")
                TeleportToCFrame(unloadDock.CFrame + Vector3.new(20,10,5))
                SpawnCar2(unloadDock.CFrame)
                break
            end
        end
    end
    wait(1)
end

function GetPosition()
    if player.Character then
        -- Get the HumanoidRootPart of the character
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    
        -- Check if the HumanoidRootPart exists
        if humanoidRootPart then
            -- Print the position
            print(humanoidRootPart.CFrame)
            return humanoidRootPart.CFrame
        else
            print("HumanoidRootPart not found.")
        end
    else
        print("Player's character not found.")
    end
end

print(playerCarName)
function SpawnCar()
    local playerCFrame = workspace:FindFirstChild(playerName).HumanoidRootPart.CFrame
    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpawnVehicle"):InvokeServer(1,playerCFrame + Vector3.new(0,2,-10))
    wait(1)
end

function SpawnCar2(CFrame : CFrame)
    local playerCFrame = workspace:FindFirstChild(playerName).HumanoidRootPart.CFrame
    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SpawnVehicle"):InvokeServer(1,CFrame or (playerCFrame + Vector3.new(-20,2,-5)))
    wait(1)
end


function GetInCar()
    local vehicle = workspace.PlayerVehicles:FindFirstChild(playerCarName)
    if vehicle then
        local driveScript = vehicle:WaitForChild("DriveScript")
        driveScript.Leave:FireServer()
        wait(1)
    end
end

function TeleportToCar()
    local vehicle = workspace.PlayerVehicles:FindFirstChild(playerCarName)
    if vehicle then
        local teleportPart = vehicle.PrimaryPart
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = teleportPart.CFrame
        wait(1)
    end
end

function TeleportToCFrame(CFrame : CFrame)
    if CFrame then
        local playerCar = workspace.PlayerVehicles:FindFirstChild(playerCarName)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
        wait(1)
    end
end

function LoadDock()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LoadVehicle"):InvokeServer()
    wait(0.5)
end
function UnLoadDock()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnloadVehicle"):InvokeServer()
    wait(0.5)
end

function AutoDeliveryDock()
    local dock = 6
    local vc3 = Vector3.new(20, 0, 10)
    for i = 1, dock, 1 do
        print("Auto Dock"..i)
        local dockName = "LoadingDock_"..i
        local dockLanding = Dock:FindFirstChild(dockName)
        local dockCFrame = dockLanding:FindFirstChild("ParkingArea").Floor.CFrame + vc3
        TeleportToCFrame(dockCFrame)
        SpawnCar()
        wait(1)
        LoadDock()
        wait(3)
    end
end

folder1:Toggle("Auto Dock" ,function(bool)
    shared.toggle = bool
    if shared.toggle then
        spawn(function()
            while true do
                AutoDeliveryDock()
                wait(2)
                teleportToUnloadDock()
                wait(2)
                UnLoadDock()
                wait(20)
            end
        end)
    end
end)

folder1:Button("spawn car",function()
    SpawnCar()
end)

folder1:Button("Leave Car",function()
    workspace:WaitForChild("PlayerVehicles"):WaitForChild(playerCarName):WaitForChild("DriveScript"):WaitForChild("Leave"):FireServer()
end)

folder1:Button("TP to car",function()
    TeleportToCar()
end)

folder1:Button("TP to Undock",function()
    teleportToUnloadDock()
    wait(2)
    UnLoadDock()
end)

folder2:Button("Get Position",function()
    GetPosition()
end)

folderq1:Button("Unlock Land",function()
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnlockAllLand"):InvokeServer()
end)
