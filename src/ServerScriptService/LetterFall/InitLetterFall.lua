local SP = game:GetService("StarterPlayer")
local Sss = game:GetService("ServerScriptService")
local CS = game:GetService("CollectionService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {touched = false}

local ConfigGame = require(script.Parent.ConfigGame)
local LetterFall = require(script.Parent.LetterFall)
local TargetWord = require(script.Parent.TargetWord)
local HandleBrick3 = require(script.Parent.HandleBrick3)

function initLetterFall(letterFallFolder)
    HandleBrick3.initClickHandler(letterFallFolder)
    ConfigGame.configGame(letterFallFolder)
    LetterFall.initGameToggle(letterFallFolder)
    -- LetterFall.initLetterRack(letterFallFolder)
    -- TargetWord.initWord(letterFallFolder)
    -- LetterFall.createBalls(letterFallFolder)

    local part =
        Utils.getFirstDescendantByName(letterFallFolder, "LF-SpawnBase")
    -- local part = Utils.getFirstDescendantByName(letterFallFolder, "TestPart")

    if part then
        print('part' .. ' - start');
        print(part);
        print('part' .. ' - end');

        function onPartTouched(otherPart)
            if not module.touched then
                module.touched = true
                print('touched')
                print('touched')
                print('touched')
                print('touched')
                print('touched')
            end
        end

        part.Touched:Connect(onPartTouched)
    end
end

module.initLetterFall = initLetterFall
return module

