local module = {}

module.questConfigs = {
    {
        questTitle = "--- The Boys from CT - part 01",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {col = 3, row = 0},
        sceneConfigs = {
            {
                name = "mop",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "lucky",
                                text = "And once I deliver this 4 leaf clover to my Grand Mama..."
                            },
                            {
                                char = "lucky",
                                text = "She will tell me the answer to elf's riddle."
                            },
                            {
                                char = "lucky",
                                text = "And you and I can unlock the treasure chest..."
                            }, {char = "cow01", text = "Mooo."}, {
                                char = "lucky",
                                text = "But alas... I need just one more gold to pay for the journey..."
                            }
                        },
                        characters01 = {},
                        characters02 = {
                            {name = "lucky"}, {name = "cow01"},
                            {name = "chick01"}
                        }
                    }, {
                        dialogs = {
                            {char = "goat01", text = "Baaaaa..."},
                            {char = "lucky", text = "Oh my poor Grand Mama..."},
                            {char = "cow01", text = "Baaaa."},
                            {
                                char = "lucky",
                                text = "My poor, sick Grand Mama..."
                            }
                        },
                        characters01 = {},
                        characters02 = {
                            {name = "lucky"}, {name = "cow01"},
                            {name = "goat01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "cow01",
                                text = "Listen! What is this I hear?"
                            },
                            {
                                char = "lucky",
                                text = "Did I just hear a... ... a giggle?"
                            }, {char = "cow01", text = "Moooo..."},
                            {char = "chick01", text = "Peep. Peep."}
                        },
                        characters01 = {},
                        characters02 = {
                            {name = "lucky"}, {name = "cow01"},
                            {name = "chick01"}
                        }
                    }, {
                        dialogs = {
                            {char = "lucky", text = "Why yes.  Yes inded!"},
                            {
                                char = "lucky",
                                text = "Lady Luck has smiled upon us!"
                            }, {char = "cow01", text = "Moooo..."},
                            {
                                char = "lucky",
                                text = "and sent us a whole platter of fresh..."
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {char = "luke01", text = "Where are we?"},
                            {char = "hudson01", text = "I have no idea."},
                            {
                                char = "hudson01",
                                text = "Mom said this was a game..."
                            }, {char = "luke01", text = "Nope..."},
                            {
                                char = "lucky",
                                text = "a whole platter of fresh...  ...faces!"
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {char = "lucky01", text = "Well hello lads..."},
                            {
                                char = "hudson01",
                                text = "We are from Connecticut."
                            },
                            {
                                char = "lucky01",
                                text = "Hello Boys from Connecticut."
                            },
                            {
                                char = "lucky01",
                                text = "What brightly colored tunics you wear."
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky01"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {
                                char = "luke01",
                                text = "Our mom bought them for us."
                            },
                            {
                                char = "lucky01",
                                text = "I can see your mom has excellent taste."
                            }, {
                                char = "lucky01",
                                text = "Does every child in Connecticut have a shirt like that?"
                            }, {char = "hudson01", text = "I think so."},
                            {
                                char = "lucky01",
                                text = "Well, perhaps you could lend it to me one day."
                            }, {
                                char = "lucky01",
                                text = "I could use it to scare the chickens out of my pea patch."
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky01"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {char = "hudson01", text = "You have a pea patch?"},
                            {char = "luke01", text = "Cool!"}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky01"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {
                                char = "lucky01",
                                text = "Forgive my manners, let me introduce myself."
                            },
                            {
                                char = "lucky01",
                                text = "My friends call me Lucky."
                            },
                            {
                                char = "hudson01",
                                text = "Our mom is making us do this."
                            },
                            {
                                char = "lucky01",
                                text = "But alas, my Luck seems to have run out"
                            },
                            {char = "luke01", text = "Can we play MineCraft?"}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky01"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {char = "lucky01", text = "Mine Craft?"},
                            {char = "lucky01", text = "Pish-Posh."},
                            {char = "lucky01", text = "Be off with you then."},
                            {
                                char = "lucky01",
                                text = "Go play your video games."
                            }, {
                                char = "lucky01",
                                text = "You don't look like the sort of fellows who would be interested in old riddles and buried treasure."
                            }, {
                                char = "lucky01",
                                text = "You would probably just laugh at me like all the rest..."
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky01"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {char = "luke01", text = "I like riddles!"},
                            {char = "hudson01", text = "Buried treasure?"}, {
                                char = "lucky01",
                                text = "Besides, I must be off now, I need to get to the Rap Battle..."
                            }, {char = "luke01", text = "Rap Battle?"}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky01"}, {name = "cow01"}}
                    }, {
                        dialogs = {
                            {
                                char = "luke01",
                                text = "Tell us your riddle Lucky!"
                            }, {
                                char = "lucky01",
                                text = "Ah, perhaps you boys are more clever than you look..."
                            },
                            {
                                char = "lucky01",
                                text = "Quickly then, and lean in close!"
                            }, {
                                char = "lucky01",
                                text = "If one of the Trolls hears the riddle, they will dig it up themselves."
                            },
                            {
                                char = "cow01",
                                text = "<cut to Troll Tricker quest>"
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "lucky01"}, {name = "cow01"}}
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
            }, {
                name = "mat",
                frames = {
                    {
                        dialogs = {
                            {char = "trollKing01", text = "I am Troll King!"},
                            {char = "trollKing01", text = "Who goes there?"},
                            {char = "luke01", text = "I'm Luke."},
                            {char = "hudson01", text = "I'm Hudson."}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "trollKing01"}, {name = "bun"}}
                    }, {
                        dialogs = {
                            {
                                char = "trollKing01",
                                text = "What fancy shirts Luke and Hudson..."
                            },
                            {char = "luke01", text = "We are from Connecticut."},
                            {
                                char = "trollKing01",
                                text = "Have you come to steal my Jam?"
                            }, {char = "hudson01", text = "No."},
                            {char = "luke01", text = "Maybe..."}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "trollKing01"}}
                    }, {
                        dialogs = {
                            {
                                char = "trollKing01",
                                text = "Or are you here to do the Zam???"
                            }, {char = "hudson01", text = "Neither"},
                            {char = "luke01", text = "Both."},
                            {char = "luke01", text = "What's the Zam?"}, {
                                char = "trollKing01",
                                text = "Hold on.  Let me take this thing off... Someone start the music..."
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "trollKing01"}}
                    }, {
                        dialogs = {
                            {char = "luke01", text = "What's the Zam?"},
                            {
                                char = "trollKing",
                                text = "The Zam is the dance you do"
                            },
                            {
                                char = "trollKing",
                                text = "If you're a fancy dude"
                            },
                            {
                                char = "fancyDudeFromFrance01",
                                text = "from France"
                            }, {char = "trollKing", text = "and you"},
                            {char = "trollKing", text = "just got"},
                            {char = "trollKing", text = "jam on your hands"},
                            {
                                char = "trollKing",
                                text = "But you gotta go dance"
                            },
                            {
                                char = "trollKing",
                                text = "So you flap em in the air"
                            },
                            {
                                char = "fancyDudeFromFrance01",
                                text = "Like a couple of fans"
                            },
                            {
                                char = "trollKing",
                                text = "That are covered with ants!"
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {
                            {name = "trollKing"},
                            {name = "fancyDudeFromFrance01"}
                        }
                    }, {
                        dialogs = {
                            {char = "hudson01", text = "We like the Zam man..."},
                            {char = "luke01", text = "But we need to scram!"},
                            {char = "trollKing", text = "Can I come with you?"}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {
                            {name = "trollKing"},
                            {name = "fancyDudeFromFrance01"}
                        }
                    }
                },
                coordinates = {row = 0, col = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 0,
                maxCol = 1
            }
        },
        gridSize = {rows = 1, cols = 4}
    }
}

return module

