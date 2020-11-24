local TextService = game:GetService("TextService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.Utils)
local Constants = require(Sss.Source.Constants.Constants)

local dialogColors = {
    Color3.fromRGB(253, 158, 240), Color3.fromRGB(225, 253, 158),
    Color3.fromRGB(253, 228, 158), Color3.fromRGB(158, 253, 179),
    Color3.fromRGB(158, 215, 253)
}

local dialogSetup = {
    kat = {left = true, backgroundColorIdx = 1},
    liz2 = {left = true, backgroundColorIdx = 2},
    Britta = {left = true, backgroundColorIdx = 1},
    Raven = {left = true, backgroundColorIdx = 2},
    Freckle = {left = true, backgroundColorIdx = 3}
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
        -- print('charName' .. ': ' .. charName); -- zzz
        -- if (Constants.characters)
        -- local left = dialogSetup['left']

        -- charName = Constants.characters[charName]['displayName'] or charName
        if (Constants.characters[charName]) then
            -- print('Constants.characters[charName]' .. ' - start');
            -- print(Constants.characters[charName]['displayName']);
            -- print('Constants.characters[charName]' .. ' - end');

        end

        local backgroundColor = dialogColors[4]
        local charConfig = dialogSetup[charName]
        if charConfig then
            backgroundColor = dialogColors[charConfig.backgroundColorIdx]
        end

        local text = charName .. ": " .. dialog['text']
        local font = Enum.Font.Arial
        local innerLabelWidth = parentWidth - (2 * paddingInPx)

        local calcSize = TextService:GetTextSize(text, fontHeight, font,
                                                 Vector2.new(innerLabelWidth,
                                                             parentHeight))

        local height = calcSize.Y

        local outerLabel = Instance.new("TextLabel", scrollingFrame)

        outerLabel.Name = "Dialog-" .. i
        outerLabel.Position = UDim2.new(0, 0, 0, dialogY)
        outerLabel.Size = UDim2.new(0, parentWidth, 0, height + 2 * paddingInPx)

        outerLabel.Text = ""
        outerLabel.Font = font
        outerLabel.TextSize = fontHeight
        outerLabel.TextWrapped = true
        outerLabel.TextXAlignment = Enum.TextXAlignment.Left
        outerLabel.TextYAlignment = Enum.TextYAlignment.Top
        outerLabel.BorderColor3 = Color3.fromRGB(99, 46, 99)
        outerLabel.BorderSizePixel = 2
        outerLabel.BackgroundColor3 = backgroundColor
        outerLabel.TextColor3 = Color3.new(0, 0, 0)
        outerLabel.ZIndex = 1

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

module.renderTexts = renderTexts
return module
