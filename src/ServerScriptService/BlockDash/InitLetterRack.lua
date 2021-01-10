local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)

local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function getActiveLetter(miniGameState)
    local alp = miniGameState.activeLetterPosition
    local letterObjs = miniGameState.rackLetterBlockObjs

    local foundLetter = nil
    for _, obj in ipairs(letterObjs) do
        if obj.coords.row == alp.row and obj.coords.col == alp.col then
            foundLetter = obj
            break
        end
    end

    return foundLetter
end

function initLetterRack(miniGameState)
    local miniGameFolder = miniGameState.miniGameFolder

    function styleActiveLetter(props)
        local active = props.active
        local activeLetter = getActiveLetter(miniGameState)
        LetterFallUtils.applyStyleFromTemplate(
            {
                targetLetterBlock = activeLetter.part,
                templateName = active and miniGameState.activeStyle or
                    miniGameState.inActiveStyle,
                miniGameState = miniGameState
            })
    end

    function moveLetterRight()
        print("moveLetterRight")
        styleActiveLetter({active = true})
        local alp = miniGameState.activeLetterPosition
        if alp.row < miniGameState.numRow then alp.row = alp.row + 1 end
        styleActiveLetter({active = false})

    end

    function moveLetterLeft()
        print("moveLetterLeft")
        styleActiveLetter({active = true})
        local alp = miniGameState.activeLetterPosition
        if alp.row > 1 then alp.row = alp.row - 1 end
        styleActiveLetter({active = false})
    end

    function moveLetterUp()
        print("moveLetterUp")
        styleActiveLetter({active = true})
        local alp = miniGameState.activeLetterPosition
        if alp.col < miniGameState.numCol then alp.col = alp.col + 1 end
        styleActiveLetter({active = false})
    end

    function moveLetterDown()
        print("moveLetterDown")
        styleActiveLetter({active = true})
        local alp = miniGameState.activeLetterPosition
        if alp.col > 1 then alp.col = alp.col - 1 end
        styleActiveLetter({active = false})
    end

    local runTimeLetterFolder = LetterFallUtils.getRunTimeLetterFolder(
                                    miniGameState)
    miniGameState.runTimeLetterFolder = runTimeLetterFolder

    local letterBlockFolder = Utils.getFromTemplates("LetterBlockTemplates")
    local letterBlockTemplate = Utils.getFirstDescendantByName(
                                    letterBlockFolder, "LBRack")
    local letterPositioner = Utils.getFirstDescendantByName(miniGameFolder,
                                                            "LetterPositioner")

    local cdRight = Utils.getFirstDescendantByName(miniGameFolder,
                                                   "ArrowRightClickDetector")
    cdRight.MouseClick:Connect(moveLetterRight)

    local cdUp = Utils.getFirstDescendantByName(miniGameFolder,
                                                "ArrowUpClickDetector")
    cdUp.MouseClick:Connect(moveLetterUp)

    local cdLeft = Utils.getFirstDescendantByName(miniGameFolder,
                                                  "ArrowLeftClickDetector")
    cdLeft.MouseClick:Connect(moveLetterLeft)

    local cdDown = Utils.getFirstDescendantByName(miniGameFolder,
                                                  "ArrowDownClickDetector")
    cdDown.MouseClick:Connect(moveLetterDown)

    local spacingFactorX = 1.05
    local spacingFactorZ = 1.05

    local lettersFromWords = {}
    for wordIndex, word in ipairs(miniGameState.words) do
        for letterIndex = 1, #word do
            local letter = string.sub(word, letterIndex, letterIndex)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
        end
    end

    local letterBlocks = {}
    for colIndex = 1, miniGameState.numCol do
        for rowIndex = 1, miniGameState.numRow do
            local rand = Utils.genRandom(1, #lettersFromWords)

            local char = lettersFromWords[rand]
            local newLetter = letterBlockTemplate:Clone()
            newLetter.Size = letterPositioner.Size

            LetterFallUtils.applyStyleFromTemplate(
                {
                    targetLetterBlock = newLetter,
                    templateName = "LBPurpleLight",
                    miniGameState = miniGameState
                })
            local letterId = "ID--R" .. rowIndex .. "C" .. colIndex
            local name = "rackLetter-" .. char .. "-" .. letterId .. "sss"
            newLetter.Name = name

            CS:AddTag(newLetter, LetterFallUtils.tagNames.RackLetter)

            LetterFallUtils.applyLetterText(
                {letterBlock = newLetter, char = char})

            local letterPosX = -newLetter.Size.X * (colIndex - 1) *
                                   spacingFactorX
            local letterPosZ = -newLetter.Size.Z * (rowIndex - 1) *
                                   spacingFactorZ

            local translateCFrameProps =
                {
                    parent = letterPositioner,
                    child = newLetter,
                    offsetConfig = {
                        useParentNearEdge = Vector3.new(-1, 1, -1),
                        useChildNearEdge = Vector3.new(-1, -1, -1),
                        offsetAdder = Vector3.new(letterPosX, 0, letterPosZ)
                    }
                }

            newLetter.CFrame = Utils3.setCFrameFromDesiredEdgeOffset(
                                   translateCFrameProps)

            newLetter.Parent = runTimeLetterFolder
            newLetter.Anchored = true
            table.insert(miniGameState.rackLetterBlockObjs, {
                part = newLetter,
                char = char,
                coords = {row = rowIndex, col = colIndex}
            })

        end
    end

end

module.initLetterRack = initLetterRack

return module
