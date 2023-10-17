local MyGUI = {}

function MyGUI:CreateFrame(title, size)
    local frame = Instance.new("Frame")
    frame.Parent = game.Players.LocalPlayer.PlayerGui
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.Size = size or UDim2.new(0, 300, 0, 200)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.new(1, 1, 1)

    local titleText = Instance.new("TextLabel")
    titleText.Parent = frame
    titleText.Size = UDim2.new(1, 0, 0, 20)
    titleText.BackgroundColor3 = Color3.new(0, 0, 0)
    titleText.Text = title or "GUI"
    titleText.TextColor3 = Color3.new(1, 1, 1)
    titleText.BorderSizePixel = 0

    local closeButton = Instance.new("TextButton")
    closeButton.Parent = frame
    closeButton.Position = UDim2.new(1, -20, 0, 0)
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.BackgroundColor3 = Color3.new(0, 0, 0)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.new(1, 1, 1)

    closeButton.MouseButton1Click:Connect(function()
        frame:Destroy()
    end)

    local minimized = false

    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = frame
    toggleButton.Position = UDim2.new(0, 0, 1, -20)
    toggleButton.Size = UDim2.new(1, 0, 0, 20)
    toggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
    toggleButton.BorderSizePixel = 0

    local toggleImage = Instance.new("ImageLabel")
    toggleImage.Parent = toggleButton
    toggleImage.Size = UDim2.new(0, 20, 0, 20)
    toggleImage.Position = UDim2.new(0, 5, 0, 0)
    toggleImage.BackgroundTransparency = 1
    toggleImage.Image = "rbxassetid://123456789" -- Açık durum için resmin asset ID'sini ekleyin
    toggleImage.Visible = not minimized

    local dragging
    local dragStart

    toggleButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        toggleImage.Visible = not minimized
        frame.Size = minimized and UDim2.new(0, 150, 0, 30) or size or UDim2.new(0, 300, 0, 200)
    end)

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position - frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            frame.Position = UDim2.new(0, input.Position.X - dragStart.X, 0, input.Position.Y - dragStart.Y)
        end
    end)

    return frame
end

return MyGUI
