local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "RBX中心（死亡之死）",
    Icon = 0,
    LoadingTitle = "RBX中心",
    LoadingSubtitle = "作者：郝蕾",
    Theme = "Default",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "大中心"
    },

    Discord = {
       Enabled = false,
       Invite = "无邀请链接",
       RememberJoins = true
    },

    KeySystem = false,
    KeySettings = {
       Title = "需要验证",
       Subtitle = "密钥系统",
       Note = "密钥为 death",
       FileName = "密钥",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"1"}
    }
})

-- 玩家Tab
local Tab = Window:CreateTab("玩家", 4483362458)

local PlayerSection = Tab:CreateSection("体力")
Tab:CreateButton({
    Name = "无限体力（支持所有注入器）",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character:GetAttribute("MaxStamina") ~= nil then
            character:SetAttribute("MaxStamina", math.huge)
        elseif player:GetAttribute("MaxStamina") ~= nil then
            player:SetAttribute("MaxStamina", math.huge)
        else
            for _, obj in pairs({character, player, character:FindFirstChildOfClass("Humanoid")}) do
                if obj and obj:GetAttributes() then
                    for name, _ in pairs(obj:GetAttributes()) do
                        if name:lower():find("stamina") then
                            obj:SetAttribute(name, math.huge)
                        end
                    end
                end
            end
        end
        Rayfield:Notify({
            Title = "无限体力",
            Content = "最大体力已设为无限",
            Duration = 3
        })
    end
})

Tab:CreateSection("实用功能")
Tab:CreateButton({
    Name = "穿越杀手专属墙",
    Callback = function()
        local killerOnlyFolder = game:GetService("Workspace"):FindFirstChild("GameAssets"):FindFirstChild("Map"):FindFirstChild("Config"):FindFirstChild("KillerOnly")
        if killerOnlyFolder then
            for _, part in pairs(killerOnlyFolder:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
            Rayfield:Notify({
                Title = "穿墙开启",
                Content = "你现在可以穿过杀手专属墙了",
                Duration = 5.7
            })
        else
            Rayfield:Notify({
                Title = "错误 404",
                Content = "未找到杀手专属文件夹",
                Duration = 3
            })
        end
    end
})

Tab:CreateSection("速度与力量")
local DefaultWalkSpeed = 16
Tab:CreateSlider({
    Name = "移动速度",
    Range = {7, 250},
    Increment = 1,
    Suffix = "速度",
    CurrentValue = DefaultWalkSpeed,
    Flag = "WalkspeedSlider",
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character then
            character:SetAttribute("WalkSpeed", Value)
        end
    end,
})

local DefaultJumpPower = 50
Tab:CreateSection("跳跃力")
local JumpPowerEnabled = false
local JumpPowerSlider
Tab:CreateToggle({
    Name = "启用跳跃力",
    CurrentValue = false,
    Flag = "JumpPowerToggle",
    Callback = function(Value)
        JumpPowerEnabled = Value
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if Value then
                humanoid.JumpPower = JumpPowerSlider.CurrentValue
            else
                humanoid.JumpPower = DefaultJumpPower
            end
        end
    end,
})
JumpPowerSlider = Tab:CreateSlider({
    Name = "跳跃力",
    Range = {50, 300},
    Increment = 5,
    Suffix = "力度",
    CurrentValue = DefaultJumpPower,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        if JumpPowerEnabled then
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value
            end
        end
    end,
})

-- 透视Tab
local ESPTab = Window:CreateTab("透视", 4483362458)
ESPTab:CreateSection("玩家透视")
local ESPEnabled = false
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESP"
ESPFolder.Parent = game.CoreGui

local function CreateESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = player.Name
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Adornee = player.Character.HumanoidRootPart
        billboard.Parent = ESPFolder
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextSize = 18
        nameLabel.Font = Enum.Font.SourceSansBold
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        nameLabel.Parent = billboard
        local playerRole = "未知"
        for _, folder in pairs(game:GetService("Workspace"):GetChildren()) do
            if folder:IsA("Folder") then
                if (folder.Name == "Killer" or folder.Name == "Survivor" or folder.Name == "Ghost") then
                    for _, char in pairs(folder:GetChildren()) do
                        if char.Name == player.Name then
                            playerRole = folder.Name
                            break
                        end
                    end
                end
            end
        end
        if playerRole == "Killer" then
            nameLabel.TextColor3 = Color3.new(1, 0, 0)
        elseif playerRole == "Survivor" then
            nameLabel.TextColor3 = Color3.new(0, 1, 0)
        elseif playerRole == "Ghost" then
            nameLabel.TextColor3 = Color3.new(0, 0, 1)
        else
            nameLabel.TextColor3 = Color3.new(1, 1, 1)
        end
    end
end
local function RemoveESP(player)
    if ESPFolder:FindFirstChild(player.Name) then
        ESPFolder[player.Name]:Destroy()
    end
end
local function UpdateESP()
    if ESPEnabled then
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player ~= game:GetService("Players").LocalPlayer then
                if not ESPFolder:FindFirstChild(player.Name) then
                    CreateESP(player)
                end
            end
        end
    else
        ESPFolder:ClearAllChildren()
    end
end
ESPTab:CreateToggle({
    Name = "玩家透视开关",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        ESPEnabled = Value
        UpdateESP()
        if Value then
            game:GetService("Players").PlayerAdded:Connect(function(player)
                if ESPEnabled then
                    CreateESP(player)
                end
            end)
            game:GetService("Players").PlayerRemoving:Connect(function(player)
                RemoveESP(player)
            end)
        end
    end,
})

ESPTab:CreateSection("阵营透视")
-- 幸存者透视
local SurvivorESPEnabled = false
local SurvivorESPFolder = Instance.new("Folder")
SurvivorESPFolder.Name = "幸存者透视"
SurvivorESPFolder.Parent = game.CoreGui
ESPTab:CreateToggle({
    Name = "幸存者透视",
    CurrentValue = false,
    Flag = "SurvivorESPToggle",
    Callback = function(Value)
        SurvivorESPEnabled = Value
        if Value then
            local teamsFolder = game:GetService("Workspace").GameAssets.Teams
            if teamsFolder and teamsFolder:FindFirstChild("Survivor") then
                for _, player in pairs(teamsFolder.Survivor:GetChildren()) do
                    if player:FindFirstChild("HumanoidRootPart") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = player.Name
                        billboard.AlwaysOnTop = true
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.Adornee = player.HumanoidRootPart
                        billboard.Parent = SurvivorESPFolder
                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Name = "NameLabel"
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Text = player.Name
                        nameLabel.TextSize = 18
                        nameLabel.Font = Enum.Font.SourceSansBold
                        nameLabel.TextStrokeTransparency = 0
                        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        nameLabel.TextColor3 = Color3.new(0, 1, 0)
                        nameLabel.Parent = billboard
                    end
                end
            end
        else
            SurvivorESPFolder:ClearAllChildren()
        end
    end,
})
-- 杀手透视
local KillerESPEnabled = false
local KillerESPFolder = Instance.new("Folder")
KillerESPFolder.Name = "杀手透视"
KillerESPFolder.Parent = game.CoreGui
ESPTab:CreateToggle({
    Name = "杀手透视",
    CurrentValue = false,
    Flag = "KillerESPToggle",
    Callback = function(Value)
        KillerESPEnabled = Value
        if Value then
            local teamsFolder = game:GetService("Workspace").GameAssets.Teams
            if teamsFolder and teamsFolder:FindFirstChild("Killer") then
                for _, player in pairs(teamsFolder.Killer:GetChildren()) do
                    if player:FindFirstChild("HumanoidRootPart") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = player.Name
                        billboard.AlwaysOnTop = true
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.Adornee = player.HumanoidRootPart
                        billboard.Parent = KillerESPFolder
                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Name = "NameLabel"
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Text = player.Name
                        nameLabel.TextSize = 18
                        nameLabel.Font = Enum.Font.SourceSansBold
                        nameLabel.TextStrokeTransparency = 0
                        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        nameLabel.TextColor3 = Color3.new(1, 0, 0)
                        nameLabel.Parent = billboard
                    end
                end
            end
        else
            KillerESPFolder:ClearAllChildren()
        end
    end,
})
-- 幽灵透视
local GhostESPEnabled = false
local GhostESPFolder = Instance.new("Folder")
GhostESPFolder.Name = "幽灵透视"
GhostESPFolder.Parent = game.CoreGui
ESPTab:CreateToggle({
    Name = "幽灵透视",
    CurrentValue = false,
    Flag = "GhostESPToggle",
    Callback = function(Value)
        GhostESPEnabled = Value
        if Value then
            local teamsFolder = game:GetService("Workspace").GameAssets.Teams
            if teamsFolder and teamsFolder:FindFirstChild("Ghost") then
                for _, player in pairs(teamsFolder.Ghost:GetChildren()) do
                    if player:FindFirstChild("HumanoidRootPart") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = player.Name
                        billboard.AlwaysOnTop = true
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.Adornee = player.HumanoidRootPart
                        billboard.Parent = GhostESPFolder
                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Name = "NameLabel"
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Text = player.Name
                        nameLabel.TextSize = 18
                        nameLabel.Font = Enum.Font.SourceSansBold
                        nameLabel.TextStrokeTransparency = 0
                        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        nameLabel.TextColor3 = Color3.new(0, 0, 1)
                        nameLabel.Parent = billboard
                    end
                end
            end
        else
            GhostESPFolder:ClearAllChildren()
        end
    end,
})

-- 其它Tab
local OtherTab = Window:CreateTab("其它", 4483362458)
OtherTab:CreateSection("其它功能")
OtherTab:CreateButton({
    Name = "加载 Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})
OtherTab:CreateButton({
    Name = "加载 Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Nameless-Admin-35212"))()
    end,
})
OtherTab:CreateButton({
    Name = "加载 Octo Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Octo-Spy/refs/heads/main/Main.lua"))()
    end,
})
OtherTab:CreateButton({
    Name = "卸载 Rayfield",
    Callback = function()
        Rayfield:Destroy()
    end,
})

OtherTab:CreateSection("有趣功能")
OtherTab:CreateButton({
    Name = "自杀（角色重生）",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0
        end
    end,
})
OtherTab:CreateButton({
    Name = "防挂机",
    Callback = function()
        local VirtualUser = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
        Rayfield:Notify({
            Title = "防挂机",
            Content = "防挂机功能已开启",
            Duration = 3,
        })
    end,
})
OtherTab:CreateButton({
    Name = "FPS提升器",
    Callback = function()
        local lighting = game:GetService("Lighting")
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        lighting.GlobalShadows = false
        lighting.FogEnd = 9e9
        if terrain then
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
        end
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart")
                or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 0
                v.BlastRadius = 0
            end
        end
        Rayfield:Notify({
            Title = "FPS提升器",
            Content = "FPS提升已应用",
            Duration = 3,
        })
    end,
})

-- 视觉Tab
local VisualTab = Window:CreateTab("视觉", 4483362458)
VisualTab:CreateSection("视觉增强")
VisualTab:CreateSlider({
    Name = "视野角度（FOV）",
    Range = {30, 120},
    Increment = 1,
    Suffix = "°",
    CurrentValue = workspace.CurrentCamera.FieldOfView,
    Flag = "FOVSlider",
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end,
})
VisualTab:CreateSlider({
    Name = "亮度",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = "倍",
    CurrentValue = game:GetService("Lighting").Brightness,
    Flag = "BrightnessSlider",
    Callback = function(Value)
        game:GetService("Lighting").Brightness = Value
    end,
})
VisualTab:CreateSlider({
    Name = "局内时间（一天中的小时）",
    Range = {0, 24},
    Increment = 0.1,
    Suffix = "小时",
    CurrentValue = game:GetService("Lighting").ClockTime,
    Flag = "TimeSlider",
    Callback = function(Value)
        game:GetService("Lighting").ClockTime = Value
    end,
})

-- 战斗Tab
local CombatTab = Window:CreateTab("战斗", 4483362458)
CombatTab:CreateSection("战斗功能")
CombatTab:CreateToggle({
    Name = "杀手自动攻击",
    CurrentValue = false,
    Flag = "AutoClickToggle",
    Callback = function(Value)
        if Value then
            getgenv().AutoClickConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local virtualUser = game:GetService("VirtualUser")
                virtualUser:CaptureController()
                virtualUser:ClickButton1(Vector2.new())
            end)
        else
            if getgenv().AutoClickConnection then
                getgenv().AutoClickConnection:Disconnect()
                getgenv().AutoClickConnection = nil
            end
        end
    end,
})
CombatTab:CreateSlider({
    Name = "攻击范围扩大",
    Range = {1, 20},
    Increment = 0.5,
    Suffix = "倍",
    CurrentValue = 1,
    Flag = "HitboxSlider",
    Callback = function(Value)
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.Size = Vector3.new(Value, Value, Value)
                player.Character.HumanoidRootPart.Transparency = 0.5
                if player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.PlatformStand = false
                    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
        end
        players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
                if player ~= localPlayer then
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    humanoidRootPart.Size = Vector3.new(Value, Value, Value)
                    humanoidRootPart.Transparency = 0.5
                    local humanoid = character:WaitForChild("Humanoid")
                    humanoid.PlatformStand = false
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end)
        end)
        local npcs = workspace:GetDescendants()
        for _, npc in pairs(npcs) do
            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
                if not players:GetPlayerFromCharacter(npc) then
                    npc.HumanoidRootPart.Size = Vector3.new(Value, Value, Value)
                    npc.HumanoidRootPart.Transparency = 0.5
                    npc.Humanoid.PlatformStand = false
                    npc.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
        end
    end,
})

-- FPS计数器
local FPSCounter = Instance.new("TextLabel")
FPSCounter.Name = "FPS计数器"
FPSCounter.Size = UDim2.new(0, 150, 0, 25)
FPSCounter.Position = UDim2.new(0, 10, 0, 10)
FPSCounter.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FPSCounter.BackgroundTransparency = 0.5
FPSCounter.BorderSizePixel = 0
FPSCounter.Text = "FPS：计算中..."
FPSCounter.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSCounter.TextSize = 14
FPSCounter.Font = Enum.Font.SourceSansBold
FPSCounter.Parent = game.CoreGui

local RunService = game:GetService("RunService")
local frames = 0
local timeElapsed = 0
local fpsConnection = RunService.RenderStepped:Connect(function(deltaTime)
    frames = frames + 1
    timeElapsed = timeElapsed + deltaTime
    if timeElapsed >= 1 then
        FPSCounter.Text = "FPS：" .. math.floor(frames / timeElapsed)
        frames = 0
        timeElapsed = 0
    end
end)