-- Load UI Library
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/yourUIlibrary"))()

local Window = Library.CreateLib("OP Auto Farm", "DarkTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Auto Features")

_G.autoFarm = false
_G.autoCollect = false
_G.autoRankUp = false
_G.autoTP = false

Section:NewToggle("Auto Farm", "Farms coins automatically", function(state)
    _G.autoFarm = state
end)

Section:NewToggle("Auto Collect", "Collects all orbs", function(state)
    _G.autoCollect = state
end)

Section:NewToggle("Auto Rank Up", "Buys ranks automatically", function(state)
    _G.autoRankUp = state
end)

Section:NewToggle("Auto Teleport", "Teleports to Safe Zone", function(state)
    _G.autoTP = state
end)

-- Function para sa Auto Farm
spawn(function()
    while true do
        if _G.autoFarm then
            pcall(function()
                local plr = game.Players.LocalPlayer
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) -- Sample position
                game:GetService("ReplicatedStorage").Events.Collect:FireServer()
            end)
        end
        wait(0.5)
    end
end)

-- Function para sa Auto Collect
spawn(function()
    while true do
        if _G.autoCollect then
            pcall(function()
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Part") and v.Name == "Coin" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        wait(0.1)
                    end
                end
            end)
        end
        wait(1)
    end
end)

-- Function para sa Auto Rank Up
spawn(function()
    while true do
        if _G.autoRankUp then
            pcall(function()
                game:GetService("ReplicatedStorage").Events.BuyRank:FireServer()
            end)
        end
        wait(5)
    end
end)

-- Function para sa Auto Teleport
spawn(function()
    while true do
        if _G.autoTP then
            pcall(function()
                local plr = game.Players.LocalPlayer
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(100, 50, 100) -- Safe zone position
            end)
        end
        wait(5)
    end
end)

print("✅ OP Auto Farm GUI Loaded!")