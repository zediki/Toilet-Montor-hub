print("Loading TSB Cheat 188 satana 666")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/StepBroFurious/Script/main/HydraHubUi.lua'))()

local Window = UILib.new("TSB Cheat 1488 satana 666", LocalPlayer.Name, "Toilet Monster")

local Category1 = Window:Category("Main", "http://www.roblox.com/asset/?id=8395621517")

local SubButton1 = Category1:Button("Category", "")

local Section1 = SubButton1:Section("Debug", "Left")
local Section2 = SubButton1:Section("Combat", "Right")
local Section3 = SubButton1:Section("Misc", "Left")
print("UI Loaded!")


local debugLog = true
local lastWalkSpeed = 16
local lastJumpPower = 50
local lastHealthToTp = 20
local lastDelayToScan = 5
local lastDelay2 = 15
local lastMaxDistance = 30


local function debugLogMsg(msg, msgType)
  if debugLog == true then
    if msgType then
      if msgType == "warn" then
       warn(msg)
      elseif msgType == "print" then
       print(msg)
      else
        warn(msg, msgType)
      end
    else
      warn(msg)
    end
  end
end

local function setHumanoidValue(change, value, last)
  if last then
    if change == "WalkSpeed" then
      humanoid[change] = lastWalkSpeed
    elseif change == "JumpPower" then
      humanoid[change] = lastJumpPower
    end
    return
  end
  local character = LocalPlayer.Character
  local humanoid = character:FindFirstChildOfClass("Humanoid")
  if character and humanoid then
    if humanoid[change] then
      humanoid[change] = value
    end
  end
end

local function teleportTo(method, playerName, CFrameTo)
  if not playerName then debugLogMsg("Unable to teleport to nil object") return end
  if not method or method == "" then
    debugLogMsg("Teleport Method is nil, setting default: Simple")
    method = "Simple"
  end
  
  local target
  
  for _,p in pairs(Players:GetPlayers()) do
      local plrName = string.lower(p.Name)
      if string.match(plrName, string.lower(playerName)) then
          target = p
          break
      end
  end
  if target then
    if method == "Simple" then
      if CFrameTo then
        local localCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        
        if localCharacter then
          if localCharacter.HumanoidRootPart then
            localCharacter.HumanoidRootPart.CFrame = CFrameTo
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer Character is nil")
        end
      else
        local localCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        
        if localCharacter and targetCharacter then
          if localCharacter.HumanoidRootPart and targetCharacter.HumanoidRootPart then
            localCharacter.HumanoidRootPart.CFrame = targetCharacter.HumanoidRootPart.CFrame
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart or TargerCharacter.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer or Targer Character is nil")
        end
      end
    elseif method == "PrimaryPart" then
      if CFrameTo then
        local localCharacter = LocalPlayer.Character
        
        if localCharacter and targetCharacter then
          if localCharacter.HumanoidRootPart then
            localCharacter:SetPrimaryPartCFrame(CFrameTo)
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart or TargerCharacter.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer or Targer Character is nil")
        end
      else
        local localCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        
        if localCharacter and targetCharacter then
          if localCharacter.HumanoidRootPart and targetCharacter.HumanoidRootPart then
            localCharacter:SetPrimaryPartCFrame(targetCharacter.HumanoidRootPart.CFrame)
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart or TargerCharacter.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer or Targer Character is nil")
        end
      end
    end
  end
end
print("Local Functions Loaded!")


Section1:Toggle({

    Title = "Console Debug",

    Description = "Disable rhis for +0.1 fps",

    Default = true
    }, function(value)

      debugLogMsg(value, "print")
      debugLog = value
    end)


Section2:Toggle({

    Title = "Kill stealer",

    Description = "TP to Low HP Player",

    Default = false

    }, function(value)

      debugLogMsg(value, "print")
      while value == true do
       task.wait(lastDelaytoScan)
          for I, otherPlayer in pairs(Players:GetPlayers()) do
              if otherPlayer ~= otherPlayer then
                  if otherPlayer.Character and otherPlayer.Character:FindFirstChildOfClass("Humanoid") then
                      if LocalPlayer.Character.PrimaryPart then
                          if otherPlayer.Character.PrimaryPart then
                              if otherPlayer.Character:FindFirstChildOfClass("Humanoid").Health <= lastHeatlhToTP and otherPlayer.Character:FindFirstChildOfClass("Humanoid").Health ~= (0 and 1) then
                                  debugLogMsg("Player Finded", otherPlayer.Name)
                                  local CFrameToTp = CFraQ2Q()me.new(otherPlayer.Character.PrimaryPart.CFrame.X, otherPlayer.Character.PrimaryPart.CFrame.Y + 20, otherPlayer.Character.PrimaryPart.CFrame.Z)
                                  teleportTo("PrimaryPart", otherPlayer.Name, CFrameToTp)
                                  task.wait(lastDelay2)
                                  debugLogMsg("Teleport successfully to", player.Name)
                              else
                                debugLogMsg(player.Name, "health too many or too week")
                              end
                          else
                            debugLogMsg("Unable to get primary part", otherPlayer.Name)
                          end
                      else
                        debugLogMsg("Unable to get primary part", LocalPlayer.Name)
                      end
                  else
                    debugLogMsg(player.Name, "doest has character or humanoid")
                  end
              else
                debugLogMsg("Bruh")
              end
          end
      end
end)


Section2:Slider({

    Title = "Max Health To TP",

    Description = "",

    Default = 20,

    Min = 0,

    Max = 100
    }, function(value)

      debugLogMsg(value, "print")
      lastHealthToTp = value
end)


Section2:Slider({

    Title = "Delay To Scan all Players",

    Description = "",

    Default = 5,

    Min = 0,

    Max = 100
    }, function(value)

      debugLogMsg(value, "print")
      lastDelayToScan = value
end)


Section2:Textbox({

    Title = "Teleport To",

    Description = "Teleport to Player",

    Default = "toiletMonster666",

    }, function(value)

      print(value)

      teleportTo("PrimaryPart", value)
end)




Section3:Slider({

    Title = "Walkspeed",

    Description = "",

    Default = 16,

    Min = 0,

    Max = 1000
    }, function(value)

      debugLogMsg(value, "print")
      lastWalkSpeed = value
      setHumanoidValue("WalkSpeed", value)
end)

Section3:Slider({

    Title = "JumpPower",

    Description = "",

    Default = 50,

    Min = 0,

    Max = 1000
    }, function(value)

      debugLogMsg(value, "print")
      lastJumpPower = value
      setHumanoidValue("JumpPower", value)
end)


Section3:Keybind({

    Title = "WalkSpeed",

    Description = "",

    Default = Enum.KeyCode.Z,

    }, function(value)

    print(value)
      setHumanoidValue("WalkSpeed", 16, true)
end)

Section3:Keybind({

    Title = "JumpPowe",

    Description = "",

    Default = Enum.KeyCode.X,

    }, function(value)

    print(value)
      setHumanoidValue("JumpPower", 50, true)
end)

print("Functions Loaded!")
print("Script Loaded¡¡¡¡!!!!")print("Loading TSB Cheat 188 satana 666")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/StepBroFurious/Script/main/HydraHubUi.lua'))()

local Window = UILib.new("TSB Cheat 1488 satana 666", LocalPlayer.Name, "Toilet Monster")

local Category1 = Window:Category("Main", "http://www.roblox.com/asset/?id=8395621517")

local SubButton1 = Category1:Button("Category", "")

local Section1 = SubButton1:Section("Debug", "Left")
local Section2 = SubButton1:Section("Combat", "Right")
local Section3 = SubButton1:Section("Misc", "Left")
print("UI Loaded!")


local debugLog = true
local lastWalkSpeed = 16
local lastJumpPower = 50
local lastHealthToTp = 20
local lastDelayToScan = 5
local lastDelay2 = 15
local lastMaxDistance = 30


local function debugLogMsg(msg, msgType)
  if debugLog == true then
    if msgType then
      if msgType == "warn" then
       warn(msg)
      elseif msgType == "print" then
       print(msg)
      else
        warn(msg, msgType)
      end
    else
      warn(msg)
    end
  end
end

local function setHumanoidValue(change, value, last)
  if last then
    if change == "WalkSpeed" then
      humanoid[change] = lastWalkSpeed
    elseif change == "JumpPower" then
      humanoid[change] = lastJumpPower
    end
    return
  end
  local character = LocalPlayer.Character
  local humanoid = character:FindFirstChildOfClass("Humanoid")
  if character and humanoid then
    if humanoid[change] then
      humanoid[change] = value
    end
  end
end

local function teleportTo(method, playerName, CFrameTo)
  if not playerName then debugLogMsg("Unable to teleport to nil object") return end
  if not method or method == "" then
    debugLogMsg("Teleport Method is nil, setting default: Simple")
    method = "Simple"
  end
  
  local target
  
  for _,p in pairs(Players:GetPlayers()) do
      local plrName = string.lower(p.Name)
      if string.match(plrName, string.lower(playerName)) then
          target = p
          break
      end
  end
  if target then
    if method == "Simple" then
      if CFrameTo then
        local localCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        
        if localCharacter then
          if localCharacter.HumanoidRootPart then
            localCharacter.HumanoidRootPart.CFrame = CFrameTo
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer Character is nil")
        end
      else
        local localCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        
        if localCharacter and targetCharacter then
          if localCharacter.HumanoidRootPart and targetCharacter.HumanoidRootPart then
            localCharacter.HumanoidRootPart.CFrame = targetCharacter.HumanoidRootPart.CFrame
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart or TargerCharacter.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer or Targer Character is nil")
        end
      end
    elseif method == "PrimaryPart" then
      if CFrameTo then
        local localCharacter = LocalPlayer.Character
        
        if localCharacter and targetCharacter then
          if localCharacter.HumanoidRootPart then
            localCharacter:SetPrimaryPartCFrame(CFrameTo)
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart or TargerCharacter.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer or Targer Character is nil")
        end
      else
        local localCharacter = LocalPlayer.Character
        local targetCharacter = target.Character
        
        if localCharacter and targetCharacter then
          if localCharacter.HumanoidRootPart and targetCharacter.HumanoidRootPart then
            localCharacter:SetPrimaryPartCFrame(targetCharacter.HumanoidRootPart.CFrame)
          else
            debugLogMsg("LocalPlayer.HumanoidRootPart or TargerCharacter.HumanoidRootPart is nil")
          end
        else
          debugLogMsg("LocalPlayer or Targer Character is nil")
        end
      end
    end
  end
end
print("Local Functions Loaded!")


Section1:Toggle({

    Title = "Console Debug",

    Description = "Disable rhis for +0.1 fps",

    Default = true
    }, function(value)

      debugLogMsg(value, "print")
      debugLog = value
    end)


Section2:Toggle({

    Title = "Kill stealer",

    Description = "TP to Low HP Player",

    Default = false

    }, function(value)

      debugLogMsg(value, "print")
      while value == true do
       task.wait(lastDelaytoScan)
          for I, otherPlayer in pairs(Players:GetPlayers()) do
              if otherPlayer ~= otherPlayer then
                  if otherPlayer.Character and otherPlayer.Character:FindFirstChildOfClass("Humanoid") then
                      if LocalPlayer.Character.PrimaryPart then
                          if otherPlayer.Character.PrimaryPart then
                              if otherPlayer.Character:FindFirstChildOfClass("Humanoid").Health <= lastHeatlhToTP and otherPlayer.Character:FindFirstChildOfClass("Humanoid").Health ~= (0 and 1) then
                                  debugLogMsg("Player Finded", otherPlayer.Name)
                                  local CFrameToTp = CFraQ2Q()me.new(otherPlayer.Character.PrimaryPart.CFrame.X, otherPlayer.Character.PrimaryPart.CFrame.Y + 20, otherPlayer.Character.PrimaryPart.CFrame.Z)
                                  teleportTo("PrimaryPart", otherPlayer.Name, CFrameToTp)
                                  task.wait(lastDelay2)
                                  debugLogMsg("Teleport successfully to", player.Name)
                              else
                                debugLogMsg(player.Name, "health too many or too week")
                              end
                          else
                            debugLogMsg("Unable to get primary part", otherPlayer.Name)
                          end
                      else
                        debugLogMsg("Unable to get primary part", LocalPlayer.Name)
                      end
                  else
                    debugLogMsg(player.Name, "doest has character or humanoid")
                  end
              else
                debugLogMsg("Bruh")
              end
          end
      end
end)


Section2:Slider({

    Title = "Max Health To TP",

    Description = "",

    Default = 20,

    Min = 0,

    Max = 100
    }, function(value)

      debugLogMsg(value, "print")
      lastHealthToTp = value
end)


Section2:Slider({

    Title = "Delay To Scan all Players",

    Description = "",

    Default = 5,

    Min = 0,

    Max = 100
    }, function(value)

      debugLogMsg(value, "print")
      lastDelayToScan = value
end)


Section2:Textbox({

    Title = "Teleport To",

    Description = "Teleport to Player",

    Default = "toiletMonster666",

    }, function(value)

      print(value)

      teleportTo("PrimaryPart", value)
end)




Section3:Slider({

    Title = "Walkspeed",

    Description = "",

    Default = 16,

    Min = 0,

    Max = 1000
    }, function(value)

      debugLogMsg(value, "print")
      lastWalkSpeed = value
      setHumanoidValue("WalkSpeed", value)
end)

Section3:Slider({

    Title = "JumpPower",

    Description = "",

    Default = 50,

    Min = 0,

    Max = 1000
    }, function(value)

      debugLogMsg(value, "print")
      lastJumpPower = value
      setHumanoidValue("JumpPower", value)
end)


Section3:Keybind({

    Title = "WalkSpeed",

    Description = "",

    Default = Enum.KeyCode.Z,

    }, function(value)

    print(value)
      setHumanoidValue("WalkSpeed", 16, true)
end)

Section3:Keybind({

    Title = "JumpPowe",

    Description = "",

    Default = Enum.KeyCode.X,

    }, function(value)

    print(value)
      setHumanoidValue("JumpPower", 50, true)
end)

print("Functions Loaded!")
print("Script Loaded¡¡¡¡!!!!")
