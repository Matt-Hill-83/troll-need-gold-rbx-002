local SP = game:GetService("StarterPlayer")
local Sss = game:GetService("ServerScriptService")
local CS = game:GetService("CollectionService")

local module = {touched = false}

local ConfigGame = require(script.Parent.ConfigGame)
-- local ConfigGame = require(script.Parent.ConfigGame)
local LetterFall = require(script.Parent.LetterFall)
local TargetWord = require(script.Parent.TargetWord)
local HandleBrick3 = require(script.Parent.HandleBrick3)

function initLetterFall()
    HandleBrick3.initClickHandler()
    ConfigGame.configGame()
    LetterFall.initGameToggle()
    -- LetterFall.initLetterRack()
    -- TargetWord.initWord()
    -- LetterFall.createBalls()

    local parts = CS:GetTagged("Test")
    print('parts' .. ' - start');
    print('parts' .. ' - start');
    print('parts' .. ' - start');
    print('parts' .. ' - start');
    print('parts' .. ' - start');
    print('parts' .. ' - start');
    print('parts' .. ' - start');
    print(parts);
    print('parts' .. ' - end');

    if parts[1] then
        local part = parts[1]
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

