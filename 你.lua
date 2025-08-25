--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Cat Hub",
    Text = "欢迎使用",
    Icon = "star",
    Duration = 5
})

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Cat Hub",
    Text = "加载完毕",
    Icon = "star",
    Duration = 8
})

-- Create Main Window
local Window = Library:Window({
    Title = "Cat Hub",
    Desc = "感谢游玩",
    Icon = 105059922903197,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 500, 0, 350)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "打开/关闭"
    }
})

-- Sidebar Vertical Separator
local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(0, 140, 0, 0) -- adjust if needed
SidebarLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 5
SidebarLine.Name = "SidebarLine"
SidebarLine.Parent = game:GetService("CoreGui") -- Or Window.Gui if accessible

-- Tab
local Tab = Window:Tab({Title = "主页", Icon = "star"}) do
    -- Section
    Tab:Section({Title = "By Ccat\nQQ3395858053"})

    -- Button
    Tab:Button({
        Title = "感谢支持",
        Desc = "传送到极速传奇",
        Callback = function()
            print("Button clicked!")
            Window:Notify({
                Title = "Button",
                Desc = "Action performed successfully.",
                Time = 3
            })
        end
    })

    -- Slider
    Tab:Slider({
        Title = "设置速度",
        Min = 0,
        Max = 100,
        Rounding = 0,
        Value = 25,
        Callback = function(val)
            print("Slider:", val)
        end
    })

    -- Code Display
    local CodeBlock = Tab:Code({
        Title = "Example Code",
        Code = "-- This is a code preview\nprint('Hello world')"
    })

    -- Simulate update
    task.delay(5, function()
        CodeBlock:SetCode("-- Updated!\nprint('New content loaded')")
    end)
end

-- Line Separator
Window:Line()

-- Another Tab Example
local Extra = Window:Tab({Title = "极速传奇", Icon = "tag"}) do
    Extra:Section({Title = "传送"})
    
    -- 预设坐标列表
    local teleportLocations = {
        {name = "城市", position = Vector3.new(-534.38, 4.07, 437.75)},
    }
    
    -- 为每个预设位置创建传送按钮
    for _, location in ipairs(teleportLocations) do
        Extra:Button({
            Title = location.name,
            Desc = "点击传送到"..location.name,
            Callback = function()
                -- 获取玩家角色
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    -- 将角色传送到指定坐标
                    character:SetPrimaryPartCFrame(CFrame.new(location.position))
                    
                    -- 显示传送成功通知
                    Window:Notify({
                        Title = "传送成功",
                        Desc = "已传送到"..location.name,
                        Time = 3
                    })
                else
                    -- 角色尚未加载完成时的提示
                    Window:Notify({
                        Title = "错误",
                        Desc = "角色尚未加载完成",
                        Time = 3
                    })
                end
            end
        })
    end
Window:Line()
-- Final Notification
Window:Notify({
    Title = "x2zu",
    Desc = "All components loaded successfully! Credits leak: @x2zu",
    Time = 4
})