local module = {}

module.questConfigs = {
    {
        questTitle = "--- RBX-100 - A Bee in a Tree",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {col = 1, row = 2},
        sceneConfigs = {
            {
                name = "tree",
                frames = {
                    {
                        dialogs = {
                            {char = "katSmiling", text = "A bee.  A bee."},
                            {char = "lizHappy", text = "I see a bee."},
                            {char = "katSmiling", text = "Do you see a bee?"},
                            {
                                char = "lizHappy",
                                text = "I see a bee... in a tree..."
                            },
                            {
                                char = "katSmiling",
                                text = "We see a bee in a tree!"
                            }, {char = "lizHappy", text = "Tee hee hee!"}
                        },
                        characters01 = {
                            {name = "katSmiling"}, {name = "lizHappy"}
                        },
                        characters02 = {{name = "magenta01"}}
                    }, {
                        dialogs = {
                            {char = "lizHappy", text = "I see a dog..."},
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"},
                            {char = "katScared", text = "Um.... Liz..."},
                            {
                                char = "lizHappy",
                                text = "I see a dog. .. on a log!"
                            },
                            {
                                char = "katScared",
                                text = "Liz, that is not a dog..."
                            }
                        },
                        characters01 = {
                            {name = "katScared"}, {name = "lizHappy"}
                        },
                        characters02 = {{name = "elf"}}
                    }, {
                        dialogs = {
                            {char = "lizHappy", text = "Good doggy!"},
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"},
                            {char = "katDismayed", text = "Liz...."},
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"},
                            {
                                char = "katDismayed",
                                text = "Liz... We need to go now!"
                            },
                            {char = "lizHappy", text = "We can go in the cave!"}
                        },
                        characters01 = {
                            {name = "katDismayed"}, {name = "lizHappy"}
                        },
                        characters02 = {{name = "elf"}}
                    }
                },
                coordinates = {row = 0, col = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = false,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }
        },
        gridSize = {rows = 1, cols = 1}
    }
}

return module

