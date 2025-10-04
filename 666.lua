local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "郝蕾脚本"; Text ="正在加载超级无敌牛逼脚本"; Duration = 2; })wait("3")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "郝蕾脚本"; Text ="超级无敌牛逼公益版,收费版加我3131827878,包含了市面上大部分脚本"; Duration = 2; })wait("2")

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "郝蕾脚本"; Text ="载入成功"; Duration = 3; })

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("现在时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Guo61/Cat-/refs/heads/main/main.lua"))()

local Confirmed = false

WindUI:Popup({
    Title = "郝蕾脚本 v2.0",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Content = "By: 郝蕾\nQQ:3131827878 欢迎使用超级无敌牛逼脚本",
    Buttons = {
        {
            Title = "进入",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed
local Window = WindUI:CreateWindow({
    Title = "郝蕾脚本",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = "感谢使用",
    Folder = "郝蕾脚本Hub",
    Size = UDim2.fromOffset(560, 340),
    Transparent = true,
    Theme = "Dark",
    User = { Enabled = true },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})

Window:Tag({
        Title = "v2.0",
        Color = Color3.fromHex("#30ff6a")
    })
Window:Tag({
        Title = "超级无敌牛逼", 
        Color = Color3.fromHex("#315dff")
    })

local Tabs = {
    Info = Window:Tab({ Title = "信息", Icon = "info" }),
    Scripts = Window:Tab({ Title = "脚本合集", Icon = "code" }),
    Universal = Window:Tab({ Title = "通用", Icon = "settings" }),
    Doors = Window:Tab({ Title = "doors", Icon = "gamepad" }),
    Ninja = Window:Tab({ Title = "忍者传奇", Icon = "gamepad" }),
    Prison = Window:Tab({ Title = "越狱", Icon = "gamepad" }),
    Speed = Window:Tab({ Title = "极速传奇", Icon = "gamepad" }),
    Pressure = Window:Tab({ Title = "『压力』", Icon = "gamepad" }),
    Dusty = Window:Tab({ Title = "『尘土飞扬的旅行』", Icon = "gamepad" }),
    DeathBall = Window:Tab({ Title = "『死亡球』", Icon = "gamepad" }),
    CarDealer = Window:Tab({ Title = "『汽车经销大亨』", Icon = "gamepad" }),
    Lumber = Window:Tab({ Title = "『伐木大亨』", Icon = "gamepad" }),
    AX = Window:Tab({ Title = "『AX』", Icon = "gamepad" }),
    Chinese = Window:Tab({ Title = "『市面上大部分汉化』", Icon = "gamepad" }),
}

Window:SelectTab(1)

Tabs.Info:Section({
    Title = "作者信息"
})

Tabs.Info:Label("郝蕾脚本")
Tabs.Info:Label("作者：郝蕾")
Tabs.Info:Label("师傅是ccat---改版")
Tabs.Info:Label("作者qq3131827878")

Tabs.Info:Section({
    Title = "你的信息"
})

Tabs.Info:Label("你的账号:"..player.AccountAge.."世纪")
Tabs.Info:Label("你的注入器:"..identifyexecutor())
Tabs.Info:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
Tabs.Info:Label("服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

Tabs.Scripts:Section({
    Title = "脚本合集"
})

Tabs.Scripts:Button("鱼脚本",function()
 loadstring(game:HelpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,115,104,122,46,97,108,47,126,70,105,115,104,83,99,114,105,112,116,78,101,119})end)())))();
end)

Tabs.Scripts:Button("皮脚本",function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end)

Tabs.Scripts:Button("星河脚本",function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%B2%B3%E6%B5%81%E6%97%A0%E5%AF%86%E9%92%A5.lua"))()
end)

Tabs.Scripts:Button("静心脚本",function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/gggggghjjnbb/main/jdjdd"))()
end)

Tabs.Scripts:Button("冷脚本",function()
 getgenv().Leng="冷脚本QQ群815883059" loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/lenglenglenglenglenglenglenglenglenglenglengleng-cold-script-LBT-H/refs/heads/main/LENG-cold-script-LBT-H.txt"))()
end)

Tabs.Scripts:Button("XK脚本",function()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\121\99\103\99\104\103\121\102\121\116\100\116\116\114\47\115\104\101\110\113\105\110\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\72\69\46\108\117\97\34\41\41\40\41")()
end)

Tabs.Scripts:Button("也是脚本但不知道名",function()
 loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()
 end)
 
Tabs.Scripts:Button("动感星期五",function()
 loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()
 end)

Tabs.Universal:Section({
    Title = "通用"
})

Tabs.Universal:Button("甩人",function()
loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
end)
    
Tabs.Universal:Button("替身",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
end)

Tabs.Universal:Button("爬墙",function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end)

Tabs.Universal:Button("汉化阿尔宙斯自瞄",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()
end)

Tabs.Universal:Button("工具挂",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
end)

Tabs.Universal:Button("甩飞",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/hknvh/main/%E7%94%A9%E9%A3%9E.txt"))()
end)

Tabs.Universal:Button("铁拳",function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
end)

Tabs.Universal:Slider('设置重力', 196.2, 196.2, 1000,function(Value)
        game.Workspace.Gravity = Value
    end)
    
Tabs.Universal:Slider("跳跃高度!", 50, 50, 400, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)

Tabs.Universal:Slider("步行速度!", 16, 16, 400, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

Tabs.Universal:Toggle("夜视",false,function(Value)
if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
end)

Tabs.Universal:Toggle("自动互动", false, function(state)
        if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.25)
            end
        else
            autoInteract = false
        end
    end)

Tabs.Doors:Section({
    Title = "doors"
})

Tabs.Doors:Button("最强汉化",function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

Tabs.Ninja:Section({
    Title = "忍者传奇"
})

Tabs.Ninja:Button("忍者传奇1",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Zyb150933/zyb/main/123'))()
end)

Tabs.Ninja:Button("叶脚本",function()
loadstring(game:HttpGet("https://pastebin.com/raw/5TNsz9mj"))()
end)

Tabs.Ninja:Button("传送",function()
loadstring(game:HttpGet("https://pastebin.com/raw/UzaUDSPK"))()
end)

Tabs.Prison:Section({
    Title = "越狱"
})

Tabs.Prison:Button("越狱",function()
loadstring(game:GetObjects("rbxassetid://3762448307")[1].Source)()
end)

Tabs.Speed:Section({
    Title = "极速传奇"
})

Tabs.Speed:Button("1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/GoodScript/main/LegendOfSpeed(Chinese)"))()
end)

Tabs.Speed:Button("2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/Legend-of-Speed-Auto-/main/GetPet"))()end)

Tabs.Pressure:Section({
    Title = "『压力』"
})

Tabs.Pressure:Button("压力1",function()
loadstring(game:HttpGet("https://pastebin.com/raw/Ej3U4LbA"))()
end)

Tabs.Pressure:Button("压力2",function()
loadstring(game:HttpGet(('https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure')))()
end)

Tabs.Dusty:Section({
    Title = "『尘土飞扬的旅行』"
})

Tabs.Dusty:Button("尘土飞扬的旅行1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AbdouGG/dustytripv1/main/beta"))()
end)

Tabs.Dusty:Button("尘土飞扬的旅行2",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip",true))()
end)

Tabs.DeathBall:Section({
    Title = "『死亡球』"
})

Tabs.DeathBall:Button("死亡球1",function()
loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua",true))()
end)

Tabs.CarDealer:Section({
    Title = "『汽车经销大亨』"
})

Tabs.CarDealer:Button("刷星星",function()
loadstring(game:HttpGet("https://scriptblox.com/raw/LIMITED!-Car-Dealership-Tycoon-Moon-Team-16181"))()
end)

Tabs.CarDealer:Button("汽车经销大亨1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/Car%20Dealership%20Tycoon.lua"))()
end)

Tabs.Lumber:Section({
    Title = "『伐木大亨』"
})

Tabs.Lumber:Button("伐木大亨1",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/LuaWare.lua", true))()
end)

Tabs.AX:Section({
    Title = "『 AX』"
})

Tabs.AX:Button("ax所有功能内有ohio",function()
loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()
end)

Tabs.Chinese:Section({
    Title = "『 市面上大部分汉化』"
})

Tabs.Chinese:Button("99虚空",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/99%E5%A4%9C%E8%99%9A%E7%A9%BA.txt"))()
end)

Tabs.Chinese:Button("死铁轨",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%AD%BB%E9%93%81%E8%BD%A8.lua"))()
end)

Tabs.Chinese:Button("墨水游戏",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%B1%89%E5%8C%96%E5%A2%A8%E6%B0%B4Ringta.txt"))()
end)

Tabs.Chinese:Button("活了7天",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E4%B8%83%E6%97%A5%E7%94%9F%E6%88%90kkk.txt"))()
end)

Tabs.Chinese:Button("汉化大合集",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/VelocityX.lua"))()
end)

Tabs.Chinese:Button("偷走脑红",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/偷走脑红"))()
end)

WindUI:Notify({
    Title = "郝蕾脚本已加载",
    Content = "欢迎使用 v2.0 - WindUI版本",
    Duration = 5
})