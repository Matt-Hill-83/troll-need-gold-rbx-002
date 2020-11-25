local module = {buffer = 0}

local islandLength = 36
-- local bridgeLength = 31.1
local bridgeLength = 34
module.islandLength = islandLength
module.bridgeLength = bridgeLength
module.totalIslandLength = islandLength + bridgeLength

local raven = {
    displayName = "Raven",
    decalId = '5897424121',
    backgroundColorIdx = 1
}
local britta = {
    displayName = "Britta",
    decalId = '5897433108',
    backgroundColorIdx = 2
}

local mitzy02 = {
    displayName = "Mitzy Meow",
    decalId = '5976876671',
    backgroundColorIdx = 2
}

module.characters = {
    raven04 = raven,
    raven = raven,
    britta = britta,
    britta04 = britta,
    luke01 = {
        displayName = "Luke",
        decalId = '5998961085',
        backgroundColorIdx = 1
    },
    hudson01 = {
        displayName = "Hudson",
        decalId = '5998961874',
        backgroundColorIdx = 3
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
    mitzyMeow01 = mitzy02,
    mitzy02 = mitzy02,
    kat = {displayName = "Kat", decalId = '5977951764', backgroundColorIdx = 3},
    liz2 = {displayName = "Liz", decalId = '5981806423', backgroundColorIdx = 4}
}

return module
