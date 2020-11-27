local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local InstanceUtils = require(Sss.Source.Utils.U002InstanceUtils)
local Dialog = require(Sss.Source.AddDialog.Dialog)
local Characters = require(Sss.Source.Characters.Characters)

local module = {}

function module.doFrameStuff(props)
    print('doFrameStuff')
    local updateButtonActiveStatus = props.updateButtonActiveStatus
    local clonedScene = props.clonedScene
    local numPages = props.numPages
    local sceneConfig = props.sceneConfig

    local pn = {value = 1}

    function updateFrameItems(props)
        local clonedScene2 = props.clonedScene
        local numPages2 = props.numPages
        local sceneConfig2 = props.sceneConfig
        -- local pn = props.pn
        local buttonPressed = false
        if not buttonPressed then
            buttonPressed = true
            updateButtonActiveStatus({
                pageNum = pn.value,
                clonedScene = clonedScene2,
                numPages = numPages2
            })

            local newFrameConfig = sceneConfig2.frames[pn.value]
            local newSceneProps = {
                frameConfig = newFrameConfig,
                clonedScene = clonedScene2
            }
            Characters.addCharactersToScene(newSceneProps)
            buttonPressed = false
        end
    end

    function incrementPage(props)
        local clonedScene1 = props.clonedScene
        local numPages1 = props.numPages
        local sceneConfig1 = props.sceneConfig

        -- local pn = props.pn
        if pn.value < numPages1 then
            pn.value = pn.value + 1
            updateFrameItems({
                clonedScene = clonedScene1,
                -- pn = pn,
                numPages = numPages1,
                sceneConfig = sceneConfig1
            })
        end

    end

    function decrementPage(props)
        local clonedScene1 = props.clonedScene
        local numPages1 = props.numPages
        local sceneConfig1 = props.sceneConfig

        -- local pn = props.pn
        if pn.value > 1 then
            pn.value = pn.value - 1
            updateFrameItems({
                clonedScene = clonedScene1,
                -- pn = pn,
                numPages = numPages1,
                sceneConfig = sceneConfig1
            })
        end
    end

    local function onIncrementPage()
        incrementPage({
            -- pn = pn,
            clonedScene = clonedScene,
            numPages = numPages,
            sceneConfig = sceneConfig
        })
    end

    local function onDecrementPage()
        decrementPage({
            -- pn = pn,
            clonedScene = clonedScene,
            numPages = numPages,
            sceneConfig = sceneConfig
        })
    end

    local nextButton = Utils.getFirstDescendantByName(clonedScene,
                                                      "NextPageButton")
    nextButton.MouseButton1Click:Connect(onIncrementPage)

    local prevButton = Utils.getFirstDescendantByName(clonedScene,
                                                      "PrevPageButton")
    prevButton.MouseButton1Click:Connect(onDecrementPage)
end
return module
