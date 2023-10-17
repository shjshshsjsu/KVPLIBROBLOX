local MyGUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/shjshshsjsu/KVPLIBROBLOX/main/Lib.lua"))()


local guiFrame = MyGUI:CreateFrame("Kvp Lib", UDim2.new(0, 300, 0, 200))


local guiText = Instance.new("TextLabel")
guiText.Parent = guiFrame
guiText.Size = UDim2.new(1, 0, 1, 0)
guiText.Text = "Kvp Lib"
guiText.TextColor3 = Color3.new(1, 1, 1)
guiText.BackgroundTransparency = 1 -- Arka plan şeffaf

MyGUI:CreateButton(guiFrame, "Butona Tıkla", function()
    print("Butona tıklandı!")
    -- İstediğiniz ek işlemleri burada gerçekleştirebilirsiniz
end)
