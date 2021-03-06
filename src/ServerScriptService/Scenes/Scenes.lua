local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local Buttons = require(Sss.Source.Buttons.Buttons)
local Location = require(Sss.Source.Location.Location)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}
getStartPosition = function(props)
    local parent = props.parent
    local child = props.child
    local gridPadding = props.gridPadding

    local childSize = child.Size
    local desiredOffsetFromParentEdge = Vector3.new(-gridPadding / 2, 0,
                                                    -gridPadding / 2)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, 1),
        moveTowardZero = Vector3.new(-1, 1, -1),
        alignToChildFarEdge = Vector3.new(-1, 1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    return RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

function getNewPosition(props)
    local coordinates = props.coordinates
    local gapX = Constants.islandLength + Constants.bridgeLength
    local newX = -(gapX + Constants.buffer) * coordinates.col
    local newZ = coordinates.row *
                     (Constants.islandLength + Constants.bridgeLength +
                         Constants.buffer)
    return Vector3.new(newX, 0, -newZ)
end

function module.addScenes(props)
    local parent = props.parent
    local sceneConfigs = props.sceneConfigs
    local questConfig = props.questConfig
    local gridPadding = props.gridPadding
    local questFolder = props.questFolder

    local sceneTemplateModel = Utils.getFirstDescendantByName(questFolder,
                                                              "SceneTemplate")
    local wallTemplate =
        Utils.getFirstDescendantByName(questFolder, "SceneBase")

    local startPosition = getStartPosition(
                              {
            gridPadding = gridPadding,
            parent = parent,
            child = wallTemplate
        })

    local function hideWall(clonedScene)
        local dialog = Utils.getFirstDescendantByName(clonedScene,
                                                      "WallTemplate")

        local descendants = dialog:GetDescendants()
        for i = 1, #descendants do
            local descendant = descendants[i]
            if descendant:IsA("BasePart") then
                descendant.Transparency = 1
                descendant.CanCollide = true

                -- This is unrelaetd, but needs to happen.
                descendant.Anchored = true
            end
            if descendant:IsA("ScrollingFrame") then
                descendant.Visible = false
            end
            if descendant:IsA("TextLabel") then
                descendant.Visible = false
            end
            if descendant:IsA("TextButton") then
                descendant.Visible = false
            end
        end

    end

    local function unHideWall(clonedScene)
        local dialog = Utils.getFirstDescendantByName(clonedScene,
                                                      "WallTemplate")
        local descendants = dialog:GetDescendants()
        for i = 1, #descendants do
            local descendant = descendants[i]
            if descendant:IsA("BasePart") then
                descendant.Transparency = 0
                descendant.CanCollide = true
            end
            if descendant:IsA("ScrollingFrame") then
                descendant.Visible = true
            end
            if descendant:IsA("TextLabel") then
                descendant.Visible = true
            end
            if descendant:IsA("TextButton") then
                descendant.Visible = true
            end
        end
    end

    local output = {}
    for i, sceneConfig in ipairs(sceneConfigs) do
        local entered = {value = false}
        local numPages = #sceneConfig.frames
        local pageNum = 1

        local newPosition = getNewPosition(
                                {
                coordinates = sceneConfig.coordinates,
                template = wallTemplate
            })

        local clonedScene = Utils.cloneModel(
                                {
                model = sceneTemplateModel,

                position = CFrame.new(newPosition + startPosition),
                suffix = "Clone--" .. i
            })
        clonedScene.Name = clonedScene.Name .. i

        local function regionEnter(plr, clonedScene, entered)
            local buttonPressed = false
            if not buttonPressed then
                buttonPressed = true
                if not entered.value then
                    unHideWall(clonedScene)
                    entered.value = true
                end
                buttonPressed = false
            end
        end

        local function regionExit(plr, clonedScene, entered)
            local buttonPressed = false
            if not buttonPressed then
                buttonPressed = true
                if entered.value then
                    hideWall(clonedScene)
                    entered.value = false
                end
                buttonPressed = false
            end
        end

        -- 
        -- 
        local part = Utils.getFirstDescendantByName(clonedScene,
                                                    "UserDectionRegion")

        local function onPartTouched(otherPart)
            local partParent = otherPart.Parent
            local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                regionEnter(humanoid, clonedScene, entered)
            end
        end

        part.Touched:Connect(onPartTouched)

        local function onPartTouchEnded(otherPart)
            local partParent = otherPart.Parent
            local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                regionExit(humanoid, clonedScene, entered)
            end
        end

        part.TouchEnded:Connect(onPartTouchEnded)

        -- 
        -- 

        local sceneFolder = Utils.getOrCreateFolder(
                                {
                name = clonedScene.Name .. i,
                parent = questFolder
            })

        clonedScene.Parent = sceneFolder

        Bridges.destroyBridges({
            sceneConfig = sceneConfig,
            clonedScene = clonedScene
        })

        local frameConfig = sceneConfig.frames[pageNum]
        local charProps = {
            frameConfig = frameConfig,
            clonedScene = clonedScene,
            sceneFolder = sceneFolder
        }

        Characters.addCharactersToScene(charProps)
        Location.addLocation({scene = clonedScene, sceneConfig = sceneConfig})

        local gameTitleLabel = Utils.getFirstDescendantByName(clonedScene,
                                                              "GameTitleLabel")
        gameTitleLabel.Text = "Quest:   " ..
                                  (questConfig.questTitle or 'Game Title')

        function updateButtonActiveStatus(props)
            local clonedScene2 = props.clonedScene
            local pageNum2 = props.pageNum
            local numPages2 = props.numPages

            local nextButton = Utils.getFirstDescendantByName(clonedScene2,
                                                              "NextPageButton")
            nextButton.Active = pageNum2 < numPages2
            nextButton.Text = nextButton.Active and
                                  Constants.buttonLabels.NextPage or "---"

            local prevButton = Utils.getFirstDescendantByName(clonedScene2,
                                                              "PrevPageButton")
            prevButton.Active = pageNum2 > 1
            prevButton.Text = prevButton.Active and
                                  Constants.buttonLabels.PrevPage or "---"

            local pageNumLabel = Utils.getFirstDescendantByName(clonedScene2,
                                                                "PageNumLabel")
            pageNumLabel.Text = "<b>" .. "Page: " .. "</b>" .. pageNum2 ..
                                    " of " .. numPages2

        end

        updateButtonActiveStatus({
            pageNum = pageNum,
            clonedScene = clonedScene,
            numPages = numPages
        })

        local props2 = {
            updateButtonActiveStatus = updateButtonActiveStatus,
            clonedScene = clonedScene,
            numPages = numPages,
            sceneConfig = sceneConfig,
            sceneFolder = sceneFolder
        }
        Buttons.doFrameStuff(props2)

        hideWall(clonedScene)
        -- local weld = Instance.new("WeldConstraint")
        -- weld.Parent = workspace
        -- weld.Part0 = parent
        -- weld.Part1 = clonedScene.PrimaryPart
        -- weld.Name = 'zzz-scene weld'

        table.insert(output, clonedScene)
    end
    sceneTemplateModel:Destroy()
    return output
end

return module
