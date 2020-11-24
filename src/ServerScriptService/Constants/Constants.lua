local module = {buffer = 0}

local islandLength = 36
-- local bridgeLength = 31.1
local bridgeLength = 34
module.islandLength = islandLength
module.bridgeLength = bridgeLength
module.totalIslandLength = islandLength + bridgeLength

module.characters = {
    raven = {
        displayName = "Raven",
        decalId = '5897424121',
        backgroundColorIdx = 1
    },
    britta = {
        displayName = "Britta",
        decalId = '5897433108',
        backgroundColorIdx = 2
    },
    troll = {
        displayName = "Troll King",
        decalId = '5897428591',
        backgroundColorIdx = 3
    },
    freckle = {
        displayName = "Freckle",
        decalId = '5897430768',
        backgroundColorIdx = 3
    },
    missyMeow01 = {
        displayName = "Missy Meow",
        decalId = '5898504226',
        backgroundColorIdx = 1
    },
    mitzyMeow01 = {
        displayName = "Mitzy Meow",
        decalId = '5976876671',
        backgroundColorIdx = 2
    },
    kat = {displayName = "Kat", decalId = '5977951764', backgroundColorIdx = 3},
    liz2 = {displayName = "Liz", decalId = '5981806423', backgroundColorIdx = 4}
}

return module
