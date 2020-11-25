local TextService = game:GetService("TextService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.Utils)
local Constants = require(Sss.Source.Constants.Constants)

local dialogColors = {
    Color3.fromRGB(253, 158, 240), Color3.fromRGB(225, 253, 158),
    Color3.fromRGB(253, 228, 158), Color3.fromRGB(158, 253, 179),
    Color3.fromRGB(158, 215, 253)
}

local module = {}

renderTexts = function(props)
    local parent = props.parent
    local dialogConfigs = props.dialogConfigs

    local pixelsPerStud = 45
    local paddingInPx = pixelsPerStud / 8
    local fontHeight = pixelsPerStud * 41 / 45

    local sgui = Utils.getDescendantByName(parent, "SurfaceGuiTemplate")

    sgui.SizingMode = "PixelsPerStud"

    local scrollingFrame = Utils.getDescendantByName(sgui, "ScrollingFrame")
    local children = scrollingFrame:GetChildren()
    for i, item in pairs(children) do
        if item:IsA('TextLabel') then
            item:Destroy()
            --
        end
    end

    local parentWidth = parent.Size.X * pixelsPerStud - (2 * paddingInPx)
    local parentHeight = parent.Size.Y * pixelsPerStud

    local dialogY = 0
    for i, dialog in ipairs(dialogConfigs) do
        local line = dialogConfigs[i]

        local charName = line['char']
        local dialogText = dialog['text']

        local backgroundColor = dialogColors[4]
        local charConfig = Constants.characters[charName]
        local displayName = Utils.getDisplayNameFromName({name = charName})

        if charConfig then
            backgroundColor = dialogColors[charConfig.backgroundColorIdx]
        end

        if (dialogText ~= "blank" and dialogText ~= "empty") then
            local text = displayName .. ": " .. dialogText
            local font = Enum.Font.Arial
            local innerLabelWidth = parentWidth - (2 * paddingInPx)

            local calcSize = TextService:GetTextSize(text, fontHeight, font,
                                                     Vector2.new(
                                                         innerLabelWidth,
                                                         parentHeight))

            local height = calcSize.Y

            local outerLabel = Instance.new("TextLabel", scrollingFrame)

            local outputLabelProps = {
                Name = "Dialog-" .. i,
                Position = UDim2.new(0, 0, 0, dialogY),
                Size = UDim2.new(0, parentWidth, 0, height + 2 * paddingInPx),

                Text = "",
                Font = font,
                TextSize = fontHeight,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                BorderColor3 = Color3.fromRGB(99, 46, 99),
                BorderSizePixel = 2,
                BackgroundColor3 = backgroundColor,
                TextColor3 = Color3.new(0, 0, 0),
                ZIndex = 1
            }
            Utils.mergeTables(outerLabel, outputLabelProps)

            local innerLabel = outerLabel:Clone()
            innerLabel.Parent = outerLabel
            innerLabel.Name = "Dialog-" .. i
            innerLabel.Text = text
            innerLabel.ZIndex = 2
            innerLabel.Size = UDim2.new(0, innerLabelWidth, 0, height)
            innerLabel.Position = UDim2.new(0, paddingInPx, 0, paddingInPx)
            innerLabel.BackgroundTransparency = 1

            local absoluteHeight = outerLabel.AbsoluteSize.Y
            dialogY = dialogY + (absoluteHeight + 25)

        end
    end

end

module.renderTexts = renderTexts
return module
