local module = {}

module.questConfigs = {
    {
        questTitle = "RX-007 - A Pug on a Rug",
        words = "I,SEE,A,CAT,IN,A,HAT",
        startSceneCoords = {col = 0, row = 0},
        endSceneCoords = {col = 0, row = 1},
        sceneConfigs = {
            {
                name = "slide",
                frames = {
                    {
                        dialogs = {
                            {char = "girl06", text = "asdf"},
                            {char = "katHappy", text = "asdf"}
                        },
                        characters01 = {{name = "lizBold"}, {name = "katHappy"}},
                        characters02 = {{name = "girl06"}}
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = false,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }, {
                name = "swing",
                frames = {
                    {
                        dialogs = {
                            {char = "mochi04", text = "asdf"},
                            {char = "mochi06", text = "asdf"}
                        },
                        characters01 = {{name = "mochi06"}, {name = "mochi04"}},
                        characters02 = {{name = "chick01"}}
                    }
                },
                coordinates = {col = 0, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                isEndScene = true,
                isStartScene = false,
                maxRow = 1,
                maxCol = 0
            }
        },
        gridSize = {rows = 2, cols = 1}
    }
}

return module

