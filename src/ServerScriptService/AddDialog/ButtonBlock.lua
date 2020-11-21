local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)

local module = {}

renderButtonBlock = function(props)
    local parent = props.parent
    local sibling = props.sibling
    local incrementPage = props.incrementPage

    local newPartHeight = 2
    local bottomOffset = 0.1

    local distanceY = sibling.Size.Y / 2 + newPartHeight / 2 + bottomOffset
    local siblingSizeCopy = Vector3.new(sibling.Size.X / 2, newPartHeight,
                                        sibling.Size.Z)

    local buttonBlockProps = {
        name = 'buttonBlock',
        parent = parent,
        size = siblingSizeCopy,
        position = sibling.Position +
            Vector3.new(-sibling.Size.X / 4, -distanceY, -parent.Size.Z),
        color = BrickColor.new("Light red")
    }

    local buttonBlock = Part.createPartWithVectors(buttonBlockProps)
    local sgui = Instance.new("SurfaceGui", buttonBlock)
    sgui.SizingMode = "PixelsPerStud"

    local textButton = Instance.new("TextButton", sgui)
    textButton.Size = UDim2.new(1, 0, 1, 0)
    textButton.BackgroundColor3 = Color3.new(1, 1, 1)
    textButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
    textButton.Font = Enum.Font.SourceSans
    textButton.TextColor3 = Color3.new(0, 0, 0)
    textButton.TextSize = 40
    textButton.Text = "Next Page"

    local function onActivated() incrementPage() end

    textButton.MouseButton1Click:Connect(onActivated)
    return buttonBlock
end

module.renderButtonBlock = renderButtonBlock
return module

----
