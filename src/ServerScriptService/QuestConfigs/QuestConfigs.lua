local module = {}

module.questConfigs = {
    {
        questTitle = "--- The Boys from CT - part 01",
        startSceneCoords = {row = 0, col = 0},
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
                                text = "But alas... I need just one more gold to afford the journey..."
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
                                char = "empty",
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
                            },
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
                                char = "luke01",
                                text = "Mom said this was a game..."
                            }, {char = "lucky", text = "Mom lied."},
                            {char = "lucky", text = "...fresh faces!"}
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
                            },
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
                            {char = "cow01", text = "I've just been peeing..."},
                            {
                                char = "chick01",
                                text = "Well, kind of everywhere..."
                            },
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
                            {char = "luke01", text = "Can we play MineCraft?"},
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
                            }, {char = "luke01", text = "I like riddles!"},
                            {char = "luke01", text = "Buried treasure?"}, {
                                char = "lucky01",
                                text = "Besides, I must be off now, if I am to get to the Rap Battle..."
                            }, {char = "luke01", text = "Rap Battle?"},
                            {
                                char = "luke01",
                                text = "Tell us your riddle Lucky!"
                            },
                            {
                                char = "lucky01",
                                text = "Ah, I can see you are clever boys..."
                            },
                            {
                                char = "lucky01",
                                text = "Quickly then, and lean in close."
                            }, {
                                char = "lucky01",
                                text = "If one of the Trolls hears the riddle, then we may as well just dig up the treasure chest and hand it to them."
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
                coordinates = {col = 1, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isStartScene = false,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "cap",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "britta01",
                                text = "Wow.  Are those space shirts?"
                            },
                            {char = "hudson01", text = "Our mom bought them."},
                            {char = "britta01", text = "Your mom is cool!"},
                            {
                                char = "luke01",
                                text = "Are you Sid the Science Kid?"
                            }, {char = "britta01", text = "No."}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "britta01"}, {name = "raven05"}}
                    }, {
                        dialogs = {
                            {
                                char = "hudson01",
                                text = "How do we get out of here?"
                            }, {char = "britta01", text = "Ha!"},
                            {char = "britta01", text = "Good question."},
                            {
                                char = "britta01",
                                text = "There is only one way out."
                            }, {char = "hudson01", text = "We'll take it!"},
                            {char = "luke01", text = "Are you Dora?"}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "britta01"}}
                    }, {
                        dialogs = {
                            {
                                char = "britta01",
                                text = "You need to go through Mount Dracmore."
                            }, {char = "hudson01", text = "ok..."},
                            {
                                char = "britta01",
                                text = "But first, you need to bring the bun to the pan."
                            },
                            {
                                char = "luke01",
                                text = "What are you talking about?"
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "britta01"}}
                    }, {
                        dialogs = {
                            {char = "britta01", text = "Did you get the bun?"},
                            {char = "luke01", text = "What?"},
                            {char = "hudson01", text = "Are you talking to us?"},
                            {
                                char = "britta01",
                                text = "Did you see this sign that said= \"You got the bun\"?"
                            }, {char = "hudson01", text = "No."}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "britta01"}}
                    }, {
                        dialogs = {
                            {
                                char = "britta01",
                                text = "Never mind.  It's not important."
                            },
                            {char = "britta01", text = "Just go to the pan."},
                            {char = "britta01", text = "You will earn 5 gold."}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "britta01"}}
                    }, {
                        dialogs = {
                            {
                                char = "hudson01",
                                text = "We can give one gold to the Leprechaun."
                            }, {char = "britta01", text = "What? No, no no!"},
                            {
                                char = "britta01",
                                text = "Never give the Leprechaun any gold, ever!"
                            },
                            {
                                char = "hudson01",
                                text = "But, his Grand Ma-Ma..."
                            },
                            {
                                char = "britta01",
                                text = "Don't even talk to him."
                            }, {char = "luke01", text = "I like him..."}
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "britta01"}}
                    }, {
                        dialogs = {
                            {char = "hudson01", text = "How do we get home?"},
                            {
                                char = "luke01",
                                text = "Our mom said this was a game."
                            },
                            {
                                char = "britta01",
                                text = "Look, I am on a dress quest."
                            },
                            {
                                char = "britta01",
                                text = "I can help you.  Meet me at the pig in the wig."
                            },
                            {
                                char = "britta01",
                                text = "But you have to bring Hopps!"
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "britta01"}}
                    }
                },
                coordinates = {row = 0, col = 2},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isStartScene = false,
                maxRow = 0,
                maxCol = 2
            }, {
                name = "pan",
                frames = {
                    {
                        dialogs = {
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"},
                            {
                                char = "luke01",
                                text = "Are you a licensed character?"
                            },
                            {
                                char = "elf",
                                text = "Huh? What?  Look, a giant monster!"
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "elf"}}
                    }, {
                        dialogs = {
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"},
                            {char = "luke01", text = "Let's go in the cave."},
                            {char = "hudson01", text = "No way!"},
                            {
                                char = "luke01",
                                text = "I'm going to the rap battle!"
                            }
                        },
                        characters01 = {{name = "luke01"}, {name = "hudson01"}},
                        characters02 = {{name = "elf"}}
                    }
                },
                coordinates = {row = 0, col = 3},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = true,
                isStartScene = false,
                maxRow = 0,
                maxCol = 3
            }
        },
        gridSize = {rows = 1, cols = 4}
    }
}

return module

