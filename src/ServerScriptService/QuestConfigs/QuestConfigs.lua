local module = {}

module.questConfigs = {
    {
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "liz2", text = "I see a bee..."},
                            {
                                char = "kat",
                                text = "If we split up, we can find vulcan faster."
                            },
                            {char = "liz2", text = "I see a bee...in a tree!"},
                            {char = "liz2", text = "Tee Hee Hee!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "bee"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Liz, that's not a bee!!!"},
                            {char = "liz2", text = "Come here little Bee! Bee!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "bee"}}
                    }
                },
                coordinates = {row = 0, col = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 0,
                maxCol = 0
            }, {
                name = "stump",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "kat",
                                text = "I'll go investigate that smoke down by the river..."
                            }, {
                                char = "kat",
                                text = "and you look in the village, by those burning stores..."
                            }, {char = "liz2", text = "I see a pug..."},
                            {
                                char = "kat",
                                text = "Then meet back at the log later."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Liz, have you heard anything I just said?"
                            },
                            {char = "liz2", text = "I see a pug...and a mug!"},
                            {char = "kat", text = "Liiiiizzzzz!!!"},
                            {char = "liz2", text = "Ugggh!, yes Kat!"},
                            {
                                char = "liz2",
                                text = "Smoke, river, burning stores, yadda yadda... log."
                            }, {char = "liz2", text = "I'm in the zone Kat"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }
                },
                coordinates = {row = 0, col = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "bog",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "Give a girl some space when she's in the zone!"
                            }, {char = "kat", text = "What zone?"},
                            {char = "liz2", text = "he ryhming zone."},
                            {
                                char = "liz2",
                                text = "It's like everything is just clicking into place."
                            },
                            {char = "kat", text = "Oh yeah, bust some rhymes!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Put A Cat A"},
                            {char = "kat", text = "Put A Cat A"},
                            {char = "liz2", text = "My name is Liz!"},
                            {char = "liz2", text = "It starts with an L."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "Let's go and play with goblin"
                            }, {char = "liz2", text = "At the wishing well."},
                            {char = "kat", text = "Fresh!!!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }
                },
                coordinates = {row = 0, col = 2},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 2
            }
        },
        gridSize = {rows = 1, cols = 3}
    }
}
return module
