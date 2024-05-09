local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/StepBroFurious/Script/main/HydraHubUi.lua'))()

local Window = UILib.new("Toilet Monstor Hub", game.Players.LocalPlayer.Name, "User")

local Category1 = Window:Category("Main", "http://www.roblox.com/asset/?id=8395621517")

local SubButton1 = Category1:Button("Main2", "")

local Section1 = SubButton1:Section("Section", "Left")


local places = {
  [10449761463] = true,
}

Section1:Button({

    Title = "Detect Game",

    ButtonName = "Detect the Game!!",

    Description = "Loading script for this game",
    }, function(value)

    print(value)

      if places[game.PlaceId] and places[game.PlaceId] == true then
        print("https://raw.githubusercontent.com/zediki/Toilet-Montor-hub/main/".. game.PlaceId ..".lua")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zediki/Toilet-Montor-hub/main/".. game.PlaceId ..".lua"))()
      else
        print("Unkown Game")
      end
end)
