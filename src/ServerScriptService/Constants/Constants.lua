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

local vulcan = {
    displayName = "Vulcan",
    decalId = '5999464799',
    backgroundColorIdx = 1
}

module.characters = {

    -- elf
    -- bun
    -- bee
    -- dog01
    -- dennisTheMenace
    -- katieKooper01
    -- troll01
    -- troll02
    -- rori
    -- vulcan

    raven05 = raven,
    raven04 = raven,
    raven = raven,
    britta = britta,
    britta01 = britta,
    britta04 = britta,
    -- 
    -- 
    bee = {displayName = "Bee", decalId = '5999465084', backgroundColorIdx = 1},
    elf = {displayName = "Elf", decalId = '5991266909', backgroundColorIdx = 1},
    bun = {displayName = "Bun", decalId = '5991343501', backgroundColorIdx = 1},
    dog01 = {
        displayName = "Dog",
        decalId = '5999464941',
        backgroundColorIdx = 1
    },
    dennisTheMenace = {
        displayName = "Dennis the Menace",
        decalId = '5999464873',
        backgroundColorIdx = 1
    },
    katieKooper01 = {
        displayName = "Katie Kooper",
        decalId = '5991267836',
        backgroundColorIdx = 1
    },
    troll01 = {
        displayName = "Troll01",
        decalId = '5999464489',
        backgroundColorIdx = 1
    },
    troll02 = {
        displayName = "Troll02",
        decalId = '5999464489',
        backgroundColorIdx = 1
    },
    rori = {
        displayName = "Rori",
        decalId = '5991267444',
        backgroundColorIdx = 1
    },
    vulcan = vulcan,
    vulcan01 = vulcan,

    -- 
    -- 
    -- 
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
    trollKing01 = {
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
