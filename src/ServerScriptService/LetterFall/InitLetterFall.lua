local CS = game:GetService("CollectionService")
local RS = game:GetService("ReplicatedStorage")
local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
local HandleClick = require(Sss.Source.LetterFall.HandleClick)
local InitLetterRack = require(Sss.Source.LetterFall.InitLetterRack)
local InitWord = require(Sss.Source.LetterFall.InitWord)

local letterFallFreezeCameraRE = RS:WaitForChild("LetterFallFreezeCameraRE")

local module = {}

-- function configCouchTrigger(miniGameState)
--     local letterFallFolder = miniGameState.letterFallFolder
--     local seat = Utils.getFirstDescendantByName(letterFallFolder, "LFCouchSeat")

--     seat:GetPropertyChangedSignal("Occupant"):Connect(
--         function(miniGameState)
--             local cameraPath1 = Utils.getFirstDescendantByName(letterFallFolder,
--                                                                "ScreenCameraPath1")
--             local cameraPath2 = Utils.getFirstDescendantByName(letterFallFolder,
--                                                                "ScreenCameraPath2")

--             local humanoid = seat.Occupant
--             if humanoid then
--                 local player = Utils.getPlayerFromHumanoid(humanoid)

--                 if player then
--                     currentPlayer = player
--                     letterFallFreezeCameraRE:FireClient(player, cameraPath1,
--                                                         cameraPath2, true)
--                     return
--                 end
--             end

--             -- player leaves seat
--             if currentPlayer then
--                 letterFallFreezeCameraRE:FireClient(currentPlayer, cameraPath1,
--                                                     cameraPath2, false)
--                 currentPlayer = nil
--             end
--         end)

-- end

function initLetterFall(miniGameState)
    LetterFall.initGameToggle(miniGameState)
    InitLetterRack.initLetterRack(miniGameState)
    InitWord.initWord(miniGameState)
    -- configCouchTrigger(miniGameState)
    LetterFallUtils.styleLetterBlocks(miniGameState)
    -- LetterFallUtils.createBalls(miniGameState)
    -- HandleClick.initClickHandler(miniGameState)
end

module.initLetterFall = initLetterFall

return module

