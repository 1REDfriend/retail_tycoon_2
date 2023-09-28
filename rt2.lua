local args = {
    [1] = 1,
    [2] = CFrame.new(1367.4541015625, 7.49800443649292, -2783.7392578125, 0.32416659593582153, 1.821579864724754e-08, -0.9459999203681946, -5.9634053251045316e-09, 1, 1.721211617677909e-08, 0.9459999203681946, 6.179057265853771e-11, 0.32416659593582153)
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpawnVehicle"):InvokeServer(unpack(args))

local args = {
    [1] = 1,
    [2] = CFrame.new(1789.9923095703125, -80.50199890136719, -1900.62744140625, 0.950099766254425, -1.3870554482764419e-08, 0.3119461238384247, 1.4241917867252596e-08, 1, 1.0877247991203376e-09, -0.3119461238384247, 3.4092637601901288e-09, 0.950099766254425)
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpawnVehicle"):InvokeServer(unpack(args))



local args = {
    [1] = workspace:WaitForChild("PlayerVehicles"):WaitForChild("Vehicle_propro050"):WaitForChild("DriveSeat")
}

workspace:WaitForChild("PlayerVehicles"):WaitForChild("Vehicle_propro050"):WaitForChild("DriveScript"):WaitForChild("Enter"):InvokeServer(unpack(args))

local args = {
    [1] = "ProximityPrompts"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("IsGuiAllowed"):InvokeServer(unpack(args))

local args = {
    [1] = 3.878866195678711
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("IncrementDistanceDriven"):FireServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LoadVehicle"):InvokeServer()

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnloadVehicle"):InvokeServer()
workspace:WaitForChild("PlayerVehicles"):WaitForChild("Vehicle_propro050"):WaitForChild("DriveScript"):WaitForChild("Leave"):FireServer()
local args = {
    [1] = 3
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EnteredNewPlot"):FireServer(unpack(args))
