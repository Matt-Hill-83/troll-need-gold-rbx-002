local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

function updateButtonActiveStatus(props)
    local pageNum = props.pageNum
    local numPages2 = props.numPages
    local nextButton = props.nextButton
    local prevButton = props.prevButton
    local pageNumLabel = props.pageNumLabel

    local lastPage = pageNum >= numPages2
    nextButton.Active = not lastPage
    nextButton.Text = not lastPage and Constants.buttonLabels.NextPage or "---"

    prevButton.Active = pageNum > 1
    prevButton.Text = prevButton.Active and Constants.buttonLabels.PrevPage or
                          "---"

    pageNumLabel.Text = "Page: " .. pageNum .. " of " .. numPages2

end

function module.doFrameStuff(props)
    local clonedScene = props.clonedScene
    local numPages = props.numPages
    local sceneConfig = props.sceneConfig
    local sceneFolder = props.sceneFolder
    local addCharactersToScene = props.addCharactersToScene
    local renderScreenDialog = props.renderScreenDialog
    local sgui = props.sgui

    local nextButton = Utils.getFirstDescendantByName(sgui, "NextPageButton")
    local prevButton = Utils.getFirstDescendantByName(sgui, "PrevPageButton")
    local pageNumLabel = Utils.getFirstDescendantByName(sgui, "PageNumLabel")

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
                numPages = numPages2,
                nextButton = nextButton,
                prevButton = prevButton,
                pageNumLabel = pageNumLabel
            })

            local newFrameConfig = sceneConfig2.frames[pn.value]
            local newSceneProps = {
                frameConfig = newFrameConfig,
                clonedScene = clonedScene2,
                sceneFolder = sceneFolder
            }

            addCharactersToScene(newSceneProps)
            renderScreenDialog(newSceneProps)
            buttonPressed = false
        end
    end

    function incrementPage(props)
        local clonedScene1 = props.clonedScene
        local numPages1 = props.numPages
        local sceneConfig1 = props.sceneConfig

        local pn = props.pn
        if pn.value < numPages1 then
            pn.value = pn.value + 1
            updateFrameItems({
                clonedScene = clonedScene1,
                pn = pn,
                numPages = numPages1,
                sceneConfig = sceneConfig1
            })
        end

    end

    function decrementPage(props)
        local clonedScene1 = props.clonedScene
        local numPages1 = props.numPages
        local sceneConfig1 = props.sceneConfig

        local pn = props.pn
        if pn.value > 1 then
            pn.value = pn.value - 1
            updateFrameItems({
                clonedScene = clonedScene1,
                pn = pn,
                numPages = numPages1,
                sceneConfig = sceneConfig1
            })
        end
    end

    local pn = {value = 1}

    local function onIncrementPage()
        incrementPage({
            pn = pn,
            clonedScene = clonedScene,
            numPages = numPages,
            sceneConfig = sceneConfig
        })
    end

    local function onDecrementPage()
        decrementPage({
            pn = pn,
            clonedScene = clonedScene,
            numPages = numPages,
            sceneConfig = sceneConfig
        })
    end

    nextButton.MouseButton1Click:Connect(onIncrementPage)
    prevButton.MouseButton1Click:Connect(onDecrementPage)
end
return module
