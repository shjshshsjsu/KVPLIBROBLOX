-- 'MyGUI' kitaplığını URL'den yükle
local MyGUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/shjshshsjsu/KVPLIBROBLOX/main/Lib.lua"))()

-- GUI çerçevesini oluştur
local guiFrame = MyGUI:CreateFrame("Siyah Temalı GUI", UDim2.new(0, 300, 0, 200))

-- GUI'ye bir metin ekleyebilirsiniz
local guiText = Instance.new("TextLabel")
guiText.Parent = guiFrame
guiText.Size = UDim2.new(1, 0, 1, 0)
guiText.Text = "Merhaba, bu siyah temalı GUI!"
guiText.TextColor3 = Color3.new(1, 1, 1)
guiText.BackgroundTransparency = 1 -- Arka plan şeffaf

-- Butonu oluştur ve fonksiyonu bağla
MyGUI:CreateButton(guiFrame, "Butona Tıkla", function()
    print("Butona tıklandı!")
    -- İstediğiniz ek işlemleri burada gerçekleştirebilirsiniz
end)
