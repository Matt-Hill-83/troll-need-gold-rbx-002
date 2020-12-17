local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)

local module = {}

function initLetterFall(letterFallFolder)
    print('------------------------------------------->>>>>>');
    print('------------------------------------------->>>>>>');
    print("initLetterFall")
    print('letterFallFolder' .. ' - start');
    print(letterFallFolder);
    LetterFall.initGameToggle(letterFallFolder)
    LetterFall.createBalls(letterFallFolder)

    local taggedPartsTransparent = CS:GetTagged("Transparent")

    for i, item in ipairs(taggedPartsTransparent) do
        Utils.setItemPropsByInst({
            item = item,
            props = {Transparency = 1}
            -- props = {Transparency = 1, CanCollide = false, Anchored = true}
        })
    end

end

module.initLetterFall = initLetterFall
return module

