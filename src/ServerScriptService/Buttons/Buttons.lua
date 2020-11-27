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

    -- local pageNum = 1

    function updateFrameItems(props)

        local clonedScene2 = props.clonedScene
        local numPages2 = props.numPages
        local sceneConfig2 = props.sceneConfig
        local pn = props.pn
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
        print('incrementPage')
        local clonedScene1 = props.clonedScene
        local numPages1 = props.numPages
        local sceneConfig1 = props.sceneConfig
        -- local pageNum1 = props.pageNum
        local pn = props.pn
        print('pn.value' .. ' - start');
        print(pn.value);
        print('pn.value' .. ' - end');
        print('numPages1' .. ' - start');
        print(numPages1);
        print('numPages1' .. ' - end');
        if pn.value < numPages1 then
            pn.value = pn.value + 1
            updateFrameItems({
                pageNum = pn.value,
                clonedScene = clonedScene1,
                pn = pn,
                numPages = numPages1,
                sceneConfig = sceneConfig1
            })
        end
        -- if pageNum1 < numPages1 then
        --     pageNum1 = pageNum1 + 1
        --     updateFrameItems({
        --         pageNum = pageNum1,
        --         clonedScene = clonedScene1,
        --         numPages = numPages1,
        --         sceneConfig = sceneConfig1
        --     })
        -- end
    end

    function decrementPage()
        -- if pageNum > 1 then
        --     pageNum = pageNum - 1
        --     updateFrameItems({
        --         pageNum = pageNum,
        --         clonedScene = clonedScene,
        --         numPages = numPages
        --     })
        -- end
    end

    local pn = {value = 1}
    local function onIncrementPage()
        print('clonedScene' .. ' - start');
        print(clonedScene);
        print('clonedScene' .. ' - end');
        print('sceneConfig.name' ..
                  ' - start------------------------------------>>');
        print(sceneConfig.name);
        incrementPage({
            pn = pn,
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
    prevButton.MouseButton1Click:Connect(decrementPage)
end
return module
