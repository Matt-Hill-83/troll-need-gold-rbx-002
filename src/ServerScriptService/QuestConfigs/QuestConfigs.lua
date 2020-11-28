local module = {}

module.questConfigs = {
    {
        questTitle = "---Roblox-Test-002",
        sceneConfigs = {
            {
                name = "bees",
                frames = {
                    {
                        dialogs = {{char = "raven04", text = "sadf"}},
                        characters01 = {{name = "raven04"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 0, col = 1},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "slide",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "asdf"},
                            {char = "britta04", text = "asdf"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 1, col = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 1
            }, {
                name = "castle",
                frames = {
                    {
                        dialogs = {{char = "raven04", text = "sadf"}},
                        characters01 = {{name = "raven04"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 1, col = 1},
                showBottomPath = true,
                showRightPath = true,
                showTopPath = true,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 1
            }, {
                name = "girl09",
                frames = {
                    {
                        dialogs = {{char = "raven04", text = "asdf"}},
                        characters01 = {{name = "raven04"}},
                        characters02 = {}
                    }
                },
                coordinates = {col = 2, row = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 2
            }, {
                name = "home",
                frames = {
                    {
                        dialogs = {{char = "raven04", text = "asd"}},
                        characters01 = {{name = "raven04"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 1, col = 3},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 3
            }, {
                name = "swing",
                frames = {
                    {
                        dialogs = {{char = "raven04", text = "asdf"}},
                        characters01 = {{name = "raven04"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 2, col = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 2,
                maxCol = 3
            }, {
                name = "coop",
                frames = {
                    {
                        dialogs = {{char = "mitzy02", text = "asdf"}},
                        characters01 = {{name = "mitzy02"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 2, col = 3},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 2,
                maxCol = 3
            }
        },
        gridSize = {rows = 3, cols = 4}
    }, {
        questTitle = "--- R002 - A Bee in a Tree",
        sceneConfigs = {
            {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "I see a dog..."},
                            {
                                char = "britta04",
                                text = "I see a dog... on a log."
                            }, {char = "raven04", text = "Tee hee hee."},
                            {char = "angus01", text = "bark!    bark!"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "cat_king"}}
                    }
                },
                coordinates = {row = 0, col = 6},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 0,
                maxCol = 6
            }, {
                name = "mat",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "I see a dog..."},
                            {
                                char = "britta04",
                                text = "I see a dog... on a log."
                            }, {char = "raven04", text = "Tee hee hee."},
                            {char = "angus01", text = "bark!    bark!"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "angus01"}}
                    }, {
                        dialogs = {
                            {
                                char = "raven04",
                                text = "Now we can go to the log!"
                            }, {char = "britta04", text = "I love the log!"},
                            {char = "britta04", text = "Tee Hee Hee!"},
                            {char = "angus01", text = "bark bark"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "angus01"}}
                    }
                },
                coordinates = {col = 0, row = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 6
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "I see a dog..."},
                            {
                                char = "britta04",
                                text = "I see a dog... on a log."
                            }, {char = "raven04", text = "Tee hee hee."},
                            {char = "angus01", text = "bark!    bark!"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "cat_king"}}
                    }
                },
                coordinates = {col = 1, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 6
            }, {
                name = "mop",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "I see a dog..."},
                            {
                                char = "britta04",
                                text = "I see a dog... on a log."
                            }, {char = "raven04", text = "Tee hee hee."},
                            {char = "angus01", text = "bark!    bark!"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "cat_king"}}
                    }
                },
                coordinates = {col = 3, row = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 6
            }, {
                name = "gold",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "I see a dog..."},
                            {
                                char = "britta04",
                                text = "I see a dog... on a log."
                            }, {char = "raven04", text = "Tee hee hee."},
                            {char = "angus01", text = "bark!    bark!"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "cat_king"}}
                    }
                },
                coordinates = {col = 4, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 6
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "I see a dog..."},
                            {
                                char = "britta04",
                                text = "I see a dog... on a log."
                            }, {char = "raven04", text = "Tee hee hee."},
                            {char = "angus01", text = "bark!    bark!"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "cat_king"}}
                    }
                },
                coordinates = {col = 6, row = 1},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 6
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "raven04", text = "I see a dog..."},
                            {
                                char = "britta04",
                                text = "I see a dog... on a log."
                            }, {char = "raven04", text = "Tee hee hee."},
                            {char = "angus01", text = "bark!    bark!"}
                        },
                        characters01 = {{name = "raven04"}, {name = "britta04"}},
                        characters02 = {{name = "cat_king"}}
                    }
                },
                coordinates = {row = 3, col = 6},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 3,
                maxCol = 6
            }
        },
        gridSize = {rows = 4, cols = 7}
    }
}
return module
