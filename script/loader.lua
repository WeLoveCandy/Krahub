loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Anti-Cheat"))()

game:GetService("RunService").RenderStepped:connect(
    function()
        if _G.Disabled then
            for i, v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                    pcall(
                        function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.AuraSize, _G.AuraSize, _G.AuraSize)
                            v.Character.HumanoidRootPart.Transparency = 100
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end
                    )
                end
            end
        end
    end
)

spawn(
    function()
        while task.wait() do
            pcall(
                function()
                    game:GetService "VirtualUser":Button1Down(Vector2.new(0.9, 0.9))
                    game:GetService "VirtualUser":Button1Up(Vector2.new(0.9, 0.9))

                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.name == "Katana" then
                            v.Parent = game.Players.LocalPlayer.Character
                        end
                    end
                end
            )
        end
    end
)

spawn(
    function()
        while task.wait(0.1) do
            pcall(
                function()
                    local Player = game.Players.LocalPlayer
                    local cpos = Player.Character.HumanoidRootPart.CFrame
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Name ~= Player.Name then
                            local i = 10
                            repeat
                                wait(0.5)
                                i = i - 1
                                local CFrameEnd = CFrame.new(v.Character.HumanoidRootPart.position)
                                local Time = 0.5
                                local tween =
                                    game:GetService("TweenService"):Create(
                                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                                    TweenInfo.new(Time),
                                    {CFrame = CFrameEnd}
                                )
                                tween:Play()
                                tween.Completed:Wait(E)
                            until i == 0 or game.Players[v.Name].Character.Humanoid.Health == 0
                        end
                    end
                end
            )
        end
    end
)
spawn(
    function()
        while task.wait(3.5) do
            pcall(
                function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                        game:GetService("ReplicatedStorage").RemoteTriggers.SpawnIn:FireServer()
                    end
                end
            )
        end
    end
)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)

while wait() do
     pcall(function()
       for i,v in pairs(game.Players:GetChildren()) do
            if not v.Character.Head:FindFirstChild("ESP") then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                BillboardGui.Parent = v.Character.Head
                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                BillboardGui.Active = true
                BillboardGui.Name = "ESP"
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1.000
                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                TextLabel.Font = Enum.Font.GothamBold
                TextLabel.Text = v.Name
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextScaled = true
                TextLabel.TextSize = 14.000
                TextLabel.TextStrokeTransparency = 0.000
                TextLabel.TextWrapped = true
            end
        end
    end) 
end
