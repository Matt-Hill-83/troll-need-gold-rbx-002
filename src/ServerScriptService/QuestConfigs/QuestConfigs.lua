local module = {}

module.questConfigs = {
    {
        questTitle = "8010-dogAndPup-002",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {col = 4, row = 1},
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "Boo Hoo!"},
                            {char = "kat", text = "Boo Hoo Hoo!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 0, col = 0},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = false,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "liz2", text = "Hi Kat!"},
                            {char = "kat", text = "Hi Liz!"},
                            {char = "kat", text = "I am sad!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "You are sad?"},
                            {char = "kat", text = "Yes! I am soooooo sad!"},
                            {char = "liz2", text = "Why?"},
                            {char = "liz2", text = "Why are you soooooooo sad?"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Pup Pup is missing!"},
                            {char = "liz2", text = "Pup Pup is missing?"},
                            {char = "kat", text = "Liz! Can we find Pup Pup?"},
                            {char = "liz2", text = "Yes Kat!"},
                            {char = "liz2", text = "We can find Pup Pup!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "kat", text = "We can look for Pup Pup"},
                            {char = "kat", text = "at the cup!"},
                            {char = "liz2", text = "We can look for Pup Pup"},
                            {char = "liz2", text = "at the cup cup!"},
                            {char = "liz2", text = "Tee Hee Hee!"},
                            {
                                char = "kat",
                                text = "ha! Liz you crack me up! up!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 1, col = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = true,
                showLeftPath = false,
                isEndScene = false,
                isStartScene = false,
                maxRow = 1,
                maxCol = 0
            }, {
                name = "cup",
                frames = {
                    {
                        dialogs = {
                            {char = "elf", text = "DO NOT GO IN THE CAVE!"},
                            {char = "liz2", text = "I see a dog."},
                            {char = "liz2", text = "I see a dog... and a log."},
                            {char = "kat", text = "Liz! That is not a dog."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "elf"}}
                    }, {
                        dialogs = {
                            {char = "elf", text = "DO NOT GO IN THE CAVE!"},
                            {char = "liz2", text = "Hi doggy doggy!"},
                            {char = "kat", text = "Liiiiizzzzzz!"},
                            {char = "kat", text = "That is not a dog!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "elf"}}
                    }
                },
                coordinates = {row = 1, col = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 1,
                maxCol = 1
            }, {
                name = "hill",
                frames = {
                    {
                        dialogs = {
                            {char = "babyTroll01", text = "BOO HOO!"},
                            {char = "kat", text = "oh brother..."},
                            {char = "liz2", text = "I see a troll!"},
                            {char = "babyTroll01", text = "<sniff> <sniff>"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "babyTroll01"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "Oh no!"},
                            {char = "liz2", text = "Baby Troll, are you sad?"},
                            {
                                char = "babyTroll01",
                                text = "BABY TROLL NEED MOMMY!"
                            }, {char = "liz2", text = "We can help the troll!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "babyTroll01"}}
                    }, {
                        dialogs = {
                            {char = "babyTroll01", text = "MOMMY! MOMMY!"},
                            {
                                char = "liz2",
                                text = "Troll, We will find your mommy!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "babyTroll01"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "We can look in the cave!"},
                            {char = "kat", text = "That sounds super safe."},
                            {char = "babyTroll01", text = "Goo Goo!"},
                            {char = "babyTroll01", text = "Gaa Gaa!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "babyTroll01"}}
                    }
                },
                coordinates = {col = 2, row = 1},
                showBottomPath = true,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 1,
                maxCol = 2
            }, {
                name = "lulu01",
                frames = {
                    {
                        dialogs = {
                            {char = "lulu01", text = "My Choo Choo!"},
                            {char = "kat", text = "Hi Lulu!"},
                            {char = "lulu01", text = "Are you mommy?"},
                            {
                                char = "liz2",
                                text = "Lulu, we will find your mommy!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }
                },
                coordinates = {col = 3, row = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 1,
                maxCol = 3
            }, {
                name = "waterfall",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "I see Pup Pup!"},
                            {char = "liz2", text = "Yay!"},
                            {char = "kat", text = "Yay!"},
                            {char = "kat", text = "Pup Pup made a new friend!"},
                            {char = "pup01", text = "Bark! Bark!"},
                            {char = "dog01", text = "Ruff! Ruff!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "pup01"}, {name = "dog01"}}
                    }
                },
                coordinates = {col = 4, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = true,
                isStartScene = false,
                maxRow = 1,
                maxCol = 4
            }, {
                name = "cave",
                frames = {
                    {
                        dialogs = {
                            {char = "babyTroll01", text = "MOMMY"},
                            {char = "troll01", text = "BABY TROLL"},
                            {char = "troll01", text = "GIRLS TAKE GIFT"},
                            {
                                char = "kat",
                                text = "A choo choo... ummmmmm...    ok...."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {
                            {name = "babyTroll01"}, {name = "troll01"},
                            {name = "chooChoo01"}
                        }
                    }, {
                        dialogs = {
                            {char = "liz2", text = "A choo choo!"},
                            {char = "kat", text = "Wow!  What a lovely gift!"},
                            {char = "kat", text = "We can go to the bog."},
                            {
                                char = "liz2",
                                text = "We can go to the bog to look for Pup Pup!."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {
                            {name = "babyTroll01"}, {name = "troll01"},
                            {name = "chooChoo01"}
                        }
                    }
                },
                coordinates = {col = 2, row = 2},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                isEndScene = false,
                isStartScene = false,
                maxRow = 2,
                maxCol = 4
            }
        },
        gridSize = {rows = 3, cols = 5}
    }, {
        questTitle = "8000-dogAndPup-001",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {col = 2, row = 0},
        sceneConfigs = {
            {
                name = "pin",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "Hi Liz!"},
                            {char = "liz2", text = "Hi Kat!"},
                            {char = "kat", text = "I see a pup."},
                            {char = "liz2", text = "I see a pup... and a cup!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "pup01"}, {name = "cup"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "I see a pup... go up!!!"},
                            {char = "liz2", text = "No pup, no!"},
                            {char = "kat", text = "Boo Hoo!"},
                            {char = "liz2", text = "up... up... up..."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "pup01"}, {name = "cup"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "I see a pup."},
                            {char = "liz2", text = "I see a pup... and a pin!"},
                            {char = "kat", text = "Oh no. No pin! No pin!"},
                            {char = "liz2", text = "Pup go POP!"},
                            {char = "kat", text = "Boooooo... Hoooooooo....."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "pup01"}, {name = "cup"}}
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
    }, {
        questTitle = "001 - Troll Need Pet",
        startSceneCoords = {col = 0, row = 0},
        endSceneCoords = {row = 2, col = 2},
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "troll02", text = "GOLD! GOLD!"},
                            {char = "babyTroll01", text = "Daddy! Daddy!"},
                            {char = "troll02", text = "TROLL NEED GOLD!"},
                            {
                                char = "babyTroll01",
                                text = "Baby Troll want pet!"
                            },
                            {char = "troll02", text = "BABY TROLL WANT PET?"},
                            {char = "babyTroll01", text = "Me want pet!"}
                        },
                        characters01 = {
                            {name = "troll02"}, {name = "babyTroll01"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "troll02", text = "BABY TROLL GET FROG."},
                            {char = "babyTroll01", text = "Me want dog!"},
                            {char = "troll02", text = "FROG GOOD PET."},
                            {char = "troll02", text = "BABY TROLL GET FROG."}
                        },
                        characters01 = {
                            {name = "troll02"}, {name = "babyTroll01"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "babyTroll01",
                                text = "Waaaa!  Me want dog!"
                            }, {char = "troll02", text = "FROG GOOD PET."},
                            {char = "babyTroll01", text = "Me want dog!"},
                            {char = "troll02", text = "BABY TROLL GO TO BOG."},
                            {char = "troll02", text = "GET FROG IN BOG."},
                            {char = "babyTroll01", text = "Uuuuugh.... Fine."}
                        },
                        characters01 = {
                            {name = "troll02"}, {name = "babyTroll01"}
                        },
                        characters02 = {}
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = false,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "babyTroll01", text = "Me find bun!"},
                            {char = "cow01", text = "Moooooo!"},
                            {char = "babyTroll01", text = "Me run with bun!"},
                            {char = "cow01", text = "Moooooo!"},
                            {char = "babyTroll01", text = "Fun Fun Fun!"}
                        },
                        characters01 = {{name = "babyTroll01"}},
                        characters02 = {{name = "bun"}, {name = "cow01"}}
                    }
                },
                coordinates = {row = 0, col = 1},
                showBottomPath = true,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "stump",
                frames = {
                    {
                        dialogs = {
                            {char = "babyTroll01", text = "Run run run!"},
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"},
                            {char = "babyTroll01", text = "Fun fun fun!"},
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"}
                        },
                        characters01 = {{name = "babyTroll01"}},
                        characters02 = {{name = "elf"}, {name = "dress06"}}
                    }
                },
                coordinates = {row = 0, col = 2},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 0,
                maxCol = 2
            }, {
                name = "pond",
                frames = {
                    {
                        dialogs = {
                            {char = "babyTroll01", text = "I see a cub!"},
                            {char = "cub", text = "I need my Mommy!"},
                            {char = "babyTroll01", text = "Me need frog!"},
                            {char = "cub", text = "Mommy!!!"},
                            {char = "babyTroll01", text = "Froggy!!!"}
                        },
                        characters01 = {{name = "babyTroll01"}},
                        characters02 = {{name = "cub"}}
                    }
                },
                coordinates = {col = 3, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 0,
                maxCol = 3
            }
        },
        gridSize = {rows = 1, cols = 4}
    }
}
return module
