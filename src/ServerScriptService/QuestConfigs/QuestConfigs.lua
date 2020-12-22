local module = {}

module.questConfigs = {
    {
        questTitle = "News From Seuss Ville",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {col = 2, row = 0},
        sceneConfigs = {
            {
                name = "cap",
                frames = {
                    {
                        dialogs = {
                            {char = "goblinKing01", text = "Tell us the news!"},
                            {char = "will01", text = "Yes the news!"},
                            {char = "angus01", text = "News from Seuss Ville?"}
                        },
                        characters01 = {
                            {name = "snurtch01"}, {name = "will01"},
                            {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "looney01"}, {name = "sillyGoose01"},
                            {name = "smallGoose01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "looney01", text = "I refuse!"},
                            {char = "vesper01", text = "There's new news?"},
                            {char = "looney01", text = "There's NO news!"},
                            {
                                char = "will01",
                                text = "If you wont, then the goose will!"
                            }
                        },
                        characters01 = {
                            {name = "vesper01"}, {name = "will01"},
                            {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "looney01"}, {name = "sillyGoose01"},
                            {name = "smallGoose01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing01",
                                text = "Sorry goose, to intrude"
                            },
                            {
                                char = "will01",
                                text = "On your grickle grass gobbling."
                            },
                            {
                                char = "goblinKing01",
                                text = "But gosh, I'm a goblin"
                            },
                            {
                                char = "will01",
                                text = "And something's all wobbling."
                            }
                        },
                        characters01 = {
                            {name = "will01"}, {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "sillyGoose01"}, {name = "smallGoose01"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "sillyGoose01", text = "I like grass"},
                            {
                                char = "sillyGoose01",
                                text = "Do you guys like grass?"
                            },
                            {
                                char = "empty",
                                text = "We need the new news, Goose!"
                            },
                            {
                                char = "empty",
                                text = "The new news from Seuss Ville!"
                            }
                        },
                        characters01 = {
                            {name = "will01"}, {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "sillyGoose01"}, {name = "smallGoose01"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "sillyGoose01",
                                text = "Look at this, there is grass..."
                            },
                            {
                                char = "sillyGoose01",
                                text = "...literally  like... ...every where!"
                            }
                        },
                        characters01 = {
                            {name = "will01"}, {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "sillyGoose01"}, {name = "smallGoose01"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "goblinKing01", text = "Goose..."},
                            {
                                char = "empty",
                                text = "Do not eat this grass over here."
                            },
                            {
                                char = "empty",
                                text = "Did I tell you about the wet grass?"
                            }
                        },
                        characters01 = {
                            {name = "will01"}, {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "sillyGoose01"}, {name = "smallGoose01"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "goblinKing01", text = "GOOSE!!!"},
                            {
                                char = "empty",
                                text = "Oh hey sorry...  um, what's up."
                            },
                            {
                                char = "empty",
                                text = "Hey do you guys like grass?"
                            }
                        },
                        characters01 = {
                            {name = "will01"}, {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "sillyGoose01"}, {name = "smallGoose01"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing01",
                                text = "Goose, what is the new news from Seuss Ville?"
                            }, {char = "empty", text = "The what what?"},
                            {
                                char = "empty",
                                text = "The new news from Seuss Ville!!!"
                            }, {char = "empty", text = "ummm... ...grass?"}
                        },
                        characters01 = {
                            {name = "will01"}, {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "sillyGoose01"}, {name = "smallGoose01"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "empty", text = "The thing we practiced!"},
                            {char = "empty", text = "..."},
                            {char = "empty", text = "Oh right!"},
                            {char = "empty", text = "..right right right..."}
                        },
                        characters01 = {
                            {name = "will01"}, {name = "goblinKing01"}
                        },
                        characters02 = {
                            {name = "sillyGoose01"}, {name = "smallGoose01"},
                            {name = "empty"}
                        }
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
                name = "stump",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "looney01",
                                text = "It was late one dark night"
                            },
                            {
                                char = "looney01",
                                text = "And I slept by the stump."
                            },
                            {
                                char = "looney01",
                                text = "Not a critter was creeping."
                            },
                            {
                                char = "goblinKing01",
                                text = "Not a WHAP, WIMP, or WHUMP?"
                            }
                        },
                        characters01 = {{name = "empty"}, {name = "looney01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "empty"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "looney01",
                                text = "When a WHOMP from the woods"
                            },
                            {
                                char = "looney01",
                                text = "Made me leap from my bed"
                            },
                            {
                                char = "goblinKing01",
                                text = "In the cave where you slept?"
                            },
                            {
                                char = "looney01",
                                text = "Where I rested my head."
                            }
                        },
                        characters01 = {{name = "empty"}, {name = "looney01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "empty"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "looney01",
                                text = "Two yellow eyes peered in from the dark."
                            },
                            {
                                char = "looney01",
                                text = "\"Um hello... this is my cave!\""
                            },
                            {char = "looney01", text = "I said with some snark"}
                        },
                        characters01 = {{name = "empty"}, {name = "looney01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "empty"},
                            {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "empty", text = "And flipped on the light."},
                            {char = "empty", text = "It was only a shark"},
                            {
                                char = "empty",
                                text = "And alone in the dark with the shark"
                            }, {char = "empty", text = "I remarked="}
                        },
                        characters01 = {{name = "empty"}, {name = "looney01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "empty"},
                            {name = "empty"}
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
            }, {
                name = "goose01",
                frames = {
                    {
                        dialogs = {
                            {char = "goblinKing02", text = "Ah ha ha ha ha ha!"},
                            {
                                char = "slicerDicer01",
                                text = "What's so funny frog boy?"
                            },
                            {
                                char = "goblinKing02",
                                text = "It's your... it's that..."
                            }
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "trollKing01"}
                        },
                        characters02 = {{name = "hopps01"}, {name = "drake"}}
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "...oh my gosh I can't even say it, because I'm laughing so hard."
                            }, {
                                char = "goblinKing02",
                                text = "...it's that puny... light... thingy you are waving at me"
                            }, {char = "slicerDicer01", text = "Ha Ha..."},
                            {
                                char = "slicerDicer01",
                                text = "Laugh it up Lizard Legs!"
                            }, {
                                char = "slicerDicer01",
                                text = "I'm here for the bounty, not for your B roll antics"
                            }
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "trollKing01"}
                        },
                        characters02 = {{name = "hopps01"}, {name = "drake"}}
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "YOUR TOY IS NO MATCH FOR THE TROLL STICK!!!"
                            },
                            {
                                char = "slicerDicer01",
                                text = "Come at me you bog bunny!"
                            },
                            {char = "goblinKing02", text = "Oooooh, spicy..."}
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "trollKing01"}
                        },
                        characters02 = {{name = "hopps01"}, {name = "drake"}}
                    }, {
                        dialogs = {
                            {
                                char = "hopps01",
                                text = "And all my life, it's all I ever wanted to do..."
                            }, {char = "empty", text = "To be a babysitter?"},
                            {
                                char = "empty",
                                text = "Yeah...   it's like... it's my destiny."
                            },
                            {
                                char = "empty",
                                text = "Wow. Hey, wanna see me spin this green thing around?"
                            }, {char = "empty", text = "Ok."}
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "trollKing01"}
                        },
                        characters02 = {{name = "hopps01"}, {name = "drake"}}
                    }, {
                        dialogs = {
                            {
                                char = "empty",
                                text = "I wrote a letter to my mom."
                            }, {char = "empty", text = "Can I read it?"},
                            {
                                char = "empty",
                                text = "Sure, here you go. I used my best guess spelling."
                            }
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "trollKing01"}
                        },
                        characters02 = {{name = "hopps01"}, {name = "drake"}}
                    }, {
                        dialogs = {
                            {char = "empty", text = "DeeR MoM"},
                            {char = "empty", text = "Horse lollipop tuna fish?"},
                            {
                                char = "empty",
                                text = "those are some umm... pretty creative guesses..."
                            }
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "trollKing01"}
                        },
                        characters02 = {{name = "hopps01"}, {name = "drake"}}
                    }, {
                        dialogs = {
                            {
                                char = "drake",
                                text = "Thanks!  Do you think my mom will understand it?"
                            },
                            {char = "empty", text = "Not in a million years."},
                            {char = "empty", text = "Oh rats..."}
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "trollKing01"}
                        },
                        characters02 = {{name = "hopps01"}, {name = "drake"}}
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "You!  Strange grey boy!  Say that again!"
                            }, {char = "drake", text = "Huh?"},
                            {
                                char = "goblinKing02",
                                text = "That thing you said!  Say it again!"
                            },
                            {char = "drake", text = "Horse lollipop tuna fish?"}
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "goblinKing02"}, {name = "hopps01"},
                            {name = "drake"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "empty",
                                text = "That's it.  That's the secret code!"
                            }, {char = "empty", text = "It is real!"}, {
                                char = "empty",
                                text = "When drake was writing his letter, the system saved his password in it's autocomplete index!"
                            }, {
                                char = "empty",
                                text = "Now it just auto-completed the answer to Zorblat's riddle!"
                            },
                            {
                                char = "slicerDicer01",
                                text = "Now, we can finally open the portal!"
                            },
                            {
                                char = "empty",
                                text = "Hey guys!  Watch me spin this green thing around!"
                            }
                        },
                        characters01 = {
                            {name = "slicerDicer01"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "goblinKing02"}, {name = "hopps01"},
                            {name = "drake"}
                        }
                    }
                },
                coordinates = {col = 2, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = true,
                isStartScene = false,
                maxRow = 0,
                maxCol = 2
            }
        },
        gridSize = {rows = 1, cols = 3}
    }, {
        questTitle = "001 - Troll Need Pet",
        startSceneCoords = {row = 0, col = 0},
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
                        characters02 = {{name = "empty"}}
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
                        characters02 = {{name = "empty"}}
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
                        characters02 = {{name = "empty"}}
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
                coordinates = {row = 0, col = 3},
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
    }, {
        questTitle = "100 - Lucky the Leperchaun",
        startSceneCoords = {col = 0, row = 0},
        sceneConfigs = {
            {
                name = "drip",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "oliveRori01cu",
                                text = "Good afternoon, Leperchaun."
                            },
                            {
                                char = "looney01cu",
                                text = "Good day to you, and please, call me Lucky."
                            }, {char = "babyTroll02", text = "Hi Lucky!"}, {
                                char = "looney01cu",
                                text = "Sadly though, I seem to be at the end of my luck."
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01cu"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {char = "babyTroll02", text = "Oh no!"}, {
                                char = "oliveRori01",
                                text = "I'm not quick to trust a leperchaun with a hard luck story."
                            },
                            {
                                char = "oliveRori01",
                                text = "Tell us your game Lucky, or be off with you."
                            },
                            {
                                char = "babyTroll02",
                                text = "I thought all you Leperchauns were lucky..."
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "looney01cu",
                                text = "Ah, run along then, you young folk don't want to hear some old Leperchaun"
                            },
                            {
                                char = "looney01cu",
                                text = "croak on about old riddles and buried treasure."
                            }, {char = "oliveRori01", text = "old riddles...?"},
                            {
                                char = "looney01cu",
                                text = "You'd probably just laugh at me like all the rest."
                            },
                            {
                                char = "babyTroll02",
                                text = "...buried treasure!?"
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "oliveRori01",
                                text = "Share your riddle with us Lucky, and we shall put our heads together and solve it."
                            }, {
                                char = "looney01cu",
                                text = "Well the riddle itself, is a simple one.  But it forms the heart of a tale"
                            }, {
                                char = "babyTroll02",
                                text = "So delightful, yet so dreadful, that I must share with you its back story"
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "looney01cu",
                                text = "So that you then may understand what power the riddle keeps so tightly bound."
                            },
                            {
                                char = "looney01cu",
                                text = "<Lucky tells them the backstory>"
                            }, {
                                char = "looney01cu",
                                text = "\"What is as tall as a house, round as a cup, and all the Queen's kittens can't drink it up?\""
                            },
                            {
                                char = "babyTroll02",
                                text = "Oh no, not this old legend again..."
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "oliveRori01",
                                text = "Are the last 3 dragon eggs are locked in the caves under Mount Dracmore?"
                            }, {
                                char = "oliveRori01",
                                text = "...and only someone wearing the magic ring can open the door?"
                            },
                            {
                                char = "looney01cu",
                                text = "Well not just any magic ring."
                            },
                            {char = "babyTroll02", text = "The Magic Ring..."},
                            {
                                char = "looney01cu",
                                text = "...drum roll please..."
                            }, {char = "looney01cu", text = "...of Andakar!"}, {
                                char = "babyTroll02",
                                text = "The kindergarteners do a play about it every fall."
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "oliveRori01",
                                text = "tall as a house, round as a cup, and all the Queen's kittens can't pull it up..."
                            },
                            {
                                char = "babyTroll02",
                                text = "We all know the answer is a well."
                            }, {
                                char = "looney01cu",
                                text = "This exact plot was on Magic Seahorse Friends S3E5.'"
                            }, {char = "looney01cu", text = "Impossible."},
                            {
                                char = "babyTroll02",
                                text = "She's seen like every show on Bugflix..."
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "babyTroll02",
                                text = "We all know that story is make believe."
                            }, {
                                char = "oliveRori01",
                                text = "Our dads went searching for the ring in that well, when they were kids."
                            },
                            {
                                char = "babyTroll02",
                                text = "Kids have searched that well for 25 years..."
                            },
                            {
                                char = "oliveRori01",
                                text = "...and no one has found the ring."
                            },
                            {
                                char = "looney01cu",
                                text = "Well that's because the ring isn't in the well."
                            }, {char = "empty", text = "Huh?"}
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "looney01cu",
                                text = "When my grandmother was 6, she used to pick apples in troll valley."
                            }, {
                                char = "looney01cu",
                                text = "The trolls tell the same legend we do, but the songs are different, and the riddle is different too."
                            },
                            {
                                char = "looney01cu",
                                text = "This is the real riddle, the troll riddle..."
                            }, {
                                char = "looney01cu",
                                text = "What is as tall as a horse, brown as a pup, run kitten run, you have woken the cub."
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "babyTroll02",
                                text = "Your grandma must have used best guess spelling when she wrote it down!"
                            },
                            {
                                char = "oliveRori01",
                                text = "you have woken the cub...?"
                            },
                            {
                                char = "babyTroll02",
                                text = "That can only mean one thing!"
                            },
                            {
                                char = "oliveRori01",
                                text = "The Ring of Andakar is in Grizzly Cave!"
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "babyTroll02",
                                text = "There's no time to lose."
                            }, {
                                char = "looney01cu",
                                text = "We need to get in the cave before the bears come home to hibernight."
                            },
                            {
                                char = "babyTroll02",
                                text = "That's tonite at mid-nite!"
                            }, {
                                char = "oliveRori01",
                                text = "Well Lucky, I'm sorry to say that I do not believe your tale."
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "oliveRori01",
                                text = "Your fingernails tell me you are a Digging Troll from the North"
                            }, {
                                char = "oliveRori01",
                                text = "...yet your hat band is duck reed, so you must sell goods in the city."
                            }, {
                                char = "oliveRori01",
                                text = "You are walking on the road north out of Turnip Town, with no bed roll on your back"
                            },
                            {
                                char = "oliveRori01",
                                text = "...and your shoes have fresh soles"
                            }
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "oliveRori01",
                                text = "I will guess that you have a long journey planned, but you are making a quick trip to the village to see your mum."
                            },
                            {
                                char = "oliveRori01",
                                text = "How am I doing so far?"
                            },
                            {
                                char = "looney01cu",
                                text = "Fie!  And fiddle sticks!"
                            }, {
                                char = "oliveRori01",
                                text = "And your only interest in us is to swindle a ride across the Black Sands, with your musty riddles and tall tales."
                            }, {char = "looney01cu", text = "Balderdash!"}
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }, {
                        dialogs = {
                            {
                                char = "oliveRori01",
                                text = "Our own adventure awaits, but I shall offer you some free advice Lucky."
                            }, {
                                char = "oliveRori01",
                                text = "Refrain from any Troll Tricking while you are in the valley."
                            }, {
                                char = "oliveRori01",
                                text = "These trolls are proud and you may wind up floating in a stew pot covered in fresh scallions."
                            }, {char = "empty", text = "-----------"},
                            {char = "empty", text = "-----------"},
                            {char = "empty", text = "-----------"},
                            {char = "empty", text = "-----------"},
                            {char = "empty", text = "-----------"}
                        },
                        characters01 = {
                            {name = "babyTroll02"}, {name = "oliveRori01"}
                        },
                        characters02 = {{name = "looney01cu"}}
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = false,
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
        questTitle = "105 - Hey look! Grass!",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {col = 3, row = 0},
        sceneConfigs = {
            {
                name = "hill",
                frames = {
                    {
                        dialogs = {
                            {char = "sillyGoose01", text = "Oh wow!"},
                            {char = "cow01", text = "Mooo!  Mooo!"},
                            {char = "sillyGoose01", text = "Hold on a sec..."},
                            {char = "cow01", text = "Yuuuummm!"},
                            {char = "sillyGoose01", text = "This is..."},
                            {
                                char = "sillyGoose01",
                                text = "This is... grass..."
                            }
                        },
                        characters01 = {{name = "sillyGoose01"}},
                        characters02 = {{name = "cow01"}}
                    }, {
                        dialogs = {
                            {char = "sillyGoose01", text = "I love grass!"},
                            {char = "cow01", text = "Me too!"},
                            {char = "sillyGoose01", text = "Grass is the best!"},
                            {char = "cow01", text = "Buuuurrrp!"},
                            {char = "sillyGoose01", text = "I just..."},
                            {
                                char = "sillyGoose01",
                                text = "I just... love grass!"
                            }
                        },
                        characters01 = {{name = "sillyGoose01"}},
                        characters02 = {{name = "cow01"}}
                    }, {
                        dialogs = {
                            {
                                char = "littleGoose",
                                text = "Mom, mom!  Can we eat grass?"
                            },
                            {char = "queenGoose01", text = "Oh! No no no no!"},
                            {
                                char = "queenGoose01",
                                text = "We do not eat grass!"
                            },
                            {
                                char = "littleGoose",
                                text = "But moooooooommmmm!!!"
                            },
                            {
                                char = "littleGoose",
                                text = "I want to eat grass!"
                            },
                            {
                                char = "queenGoose01",
                                text = "You are not a grass goose."
                            }
                        },
                        characters01 = {{name = "sillyGoose01"}},
                        characters02 = {
                            {name = "littleGoose"}, {name = "queenGoose01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "littleGoose",
                                text = "But that goose eats grass..."
                            }, {
                                char = "queenGoose01",
                                text = "Do not look at that silly goose, you silly goose!"
                            },
                            {char = "queenGoose01", text = "Eat your worms."},
                            {
                                char = "littleGoose",
                                text = "I do not like worms."
                            }
                        },
                        characters01 = {{name = "sillyGoose01"}},
                        characters02 = {
                            {name = "littleGoose"}, {name = "queenGoose01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "queenGoose01",
                                text = "Fine.  Go eat grass."
                            }, {char = "littleGoose", text = "Yay!"}
                        },
                        characters01 = {{name = "sillyGoose01"}},
                        characters02 = {
                            {name = "littleGoose"}, {name = "queenGoose01"}
                        }
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
                name = "stump",
                frames = {
                    {
                        dialogs = {
                            {char = "littleGoose", text = "I like grass too!"},
                            {
                                char = "sillyGoose01",
                                text = "Wait, you like grass?"
                            }, {char = "littleGoose", text = "I love grass!"},
                            {char = "sillyGoose01", text = "Me too!"},
                            {
                                char = "littleGoose",
                                text = "And mom says I can eat it!"
                            }, {char = "sillyGoose01", text = "Me too!"}
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "littleGoose", text = "This grass is wet."},
                            {char = "sillyGoose01", text = "That grass is wet?"},
                            {char = "littleGoose", text = "Yes, it is all wet."},
                            {
                                char = "sillyGoose01",
                                text = "Stop.  Do not eat the wet grass!"
                            }
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "littleGoose", text = "Why not?"},
                            {
                                char = "sillyGoose01",
                                text = "I went pee pee on that grass."
                            }, {char = "littleGoose", text = "Um gross..."},
                            {
                                char = "sillyGoose01",
                                text = "Yes.  I just... I just kinda had to go."
                            }
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "littleGoose",
                                text = "Yuck.  Maybe say that at the start next time.."
                            },
                            {
                                char = "sillyGoose01",
                                text = "Yes.  Right. Good idea."
                            },
                            {
                                char = "littleGoose",
                                text = "Did you go pee pee anywhere else?"
                            },
                            {
                                char = "sillyGoose01",
                                text = "Well, now that I think about it, I go pee..."
                            },
                            {
                                char = "sillyGoose01",
                                text = "um.... kinda every where...."
                            }
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "littleGoose", text = "Wow... and gross."},
                            {
                                char = "sillyGoose01",
                                text = "Yeah... like... every day..."
                            }, {char = "littleGoose", text = "<gasp>"},
                            {char = "sillyGoose01", text = "...all day long..."}
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "littleGoose",
                                text = "Let's pretend we never talked about this."
                            }, {char = "sillyGoose01", text = "Good idea."},
                            {char = "littleGoose", text = "I love grass!"},
                            {char = "sillyGoose01", text = "Me too!"}
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "littleGoose",
                                text = "Want to go look for baby troll?"
                            }, {char = "sillyGoose01", text = "Ok."},
                            {
                                char = "littleGoose",
                                text = "He lives in the bog."
                            }, {char = "sillyGoose01", text = "I love the bog!"}
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "empty"}}
                    }
                },
                coordinates = {col = 1, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "bog",
                frames = {
                    {
                        dialogs = {
                            {char = "littleGoose", text = "I see a bug..."},
                            {
                                char = "sillyGoose01",
                                text = "I see a bug... in a bog!"
                            }, {char = "littleGoose", text = "A big bug?"},
                            {char = "sillyGoose01", text = "A bog bug."}
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "bug"}}
                    }, {
                        dialogs = {
                            {
                                char = "littleGoose",
                                text = "Put the bog bug in the big bag!"
                            }, {char = "sillyGoose01", text = "Ok."}
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "bug"}}
                    }
                },
                coordinates = {col = 2, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 0,
                maxCol = 2
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "sillyGoose01", text = "I see a dog..."},
                            {
                                char = "littleGoose",
                                text = "I see a dog... on a log..."
                            },
                            {char = "sillyGoose01", text = "Hi little doggy."},
                            {char = "littleGoose", text = "Are you lost?"},
                            {char = "angus01", text = "bark! bark!"}
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "angus01"}}
                    }, {
                        dialogs = {
                            {
                                char = "littleGoose",
                                text = "Little doggy, you can play with us."
                            }, {char = "angus01", text = "Ruff Ruff!"},
                            {char = "angus01", text = "Me want mommy!"},
                            {
                                char = "sillyGoose01",
                                text = "We will find your mommy!"
                            }
                        },
                        characters01 = {
                            {name = "sillyGoose01"}, {name = "littleGoose"}
                        },
                        characters02 = {{name = "angus01"}}
                    }
                },
                coordinates = {col = 3, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = true,
                isStartScene = false,
                maxRow = 0,
                maxCol = 3
            }
        },
        gridSize = {rows = 1, cols = 4}
    }, {
        questTitle = "The Boys from Connecticut - part 01",
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
                                text = "My poor, old Grand Mama..."
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
                coordinates = {col = 2, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
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
                coordinates = {col = 3, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = true,
                isStartScene = false,
                maxRow = 0,
                maxCol = 3
            }
        },
        gridSize = {rows = 1, cols = 4}
    }, {
        questTitle = "The Bad Baby Sitter",
        startSceneCoords = {col = 0, row = 0},
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "lucy07", text = "Well well well..."},
                            {char = "freckle01", text = "Hi."},
                            {char = "lucy07", text = "What do we have here?"},
                            {char = "freckle01", text = "My name is Elanor."}
                        },
                        characters01 = {
                            {name = "scribbleDragon01"}, {name = "lucy07"},
                            {name = "freckle01"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "lucy07", text = "Hello Elanor."},
                            {
                                char = "lucy07",
                                text = "Well aren't you a perky little peanut!"
                            }, {char = "freckle01", text = "Tee Hee Hee..."}
                        },
                        characters01 = {
                            {name = "scribbleDragon01"}, {name = "lucy07"},
                            {name = "freckle01"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "lucy07",
                                text = "Now get out of my way, you perky little peanut..."
                            }, {char = "freckle01", text = "...<sniffle> ..."},
                            {
                                char = "lucy07",
                                text = "or I'll chop you into pieces with my sword!"
                            }, {char = "freckle01", text = "Waaaaaaah!!!!!!!"},
                            {char = "freckle01", text = "Mommmmyyyyyyyyyyyy!!!"}
                        },
                        characters01 = {
                            {name = "scribbleDragon01"}, {name = "lucy07"},
                            {name = "freckle01"}
                        },
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "hopps01",
                                text = "I can't make that!  You know I have to babysit until 8=00!"
                            }, {char = "hopps01", text = "No no no!"},
                            {
                                char = "hopps01",
                                text = "...I want to go with you guys..."
                            }
                        },
                        characters01 = {{name = "empty"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"}
                        }
                    }, {
                        dialogs = {
                            {char = "freckle01", text = "Mommmmyyyyyyyyyyyy!!!"},
                            {
                                char = "hopps01",
                                text = "Ugghhh!  Hold on...  These kids are a night mare..."
                            }, {
                                char = "hopps01",
                                text = "Can you little monsters stop hurting each other for 2 minutes so I can talk on the phone?"
                            },
                            {
                                char = "lucy07small",
                                text = "We want you to play with us!"
                            },
                            {char = "hopps01", text = "You are such brats..."}
                        },
                        characters01 = {
                            {name = "lucy07small"}, {name = "freckle01"}
                        },
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "freckle01", text = "Lucinda hurt me."},
                            {
                                char = "hopps01",
                                text = "Lucy!  What did I say about that sword???"
                            }, {char = "lucy07", text = "Stab your sister?"},
                            {
                                char = "hopps01",
                                text = "Give it to me right now!"
                            },
                            {
                                char = "lucy07",
                                text = "You're not the boss of me!"
                            }
                        },
                        characters01 = {{name = "lucy07"}, {name = "freckle01"}},
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "freckle01", text = "She hurt my feelings."},
                            {char = "hopps01", text = "Oh why me?"},
                            {char = "hopps01", text = "Brandon, give me a sec!"},
                            {
                                char = "hopps01",
                                text = "Lucy! Do a repair with your little sister right now!"
                            }, {
                                char = "hopps01",
                                text = "No Brandon, I don't need to go... just give me a sec."
                            }
                        },
                        characters01 = {
                            {name = "lucy07"}, {name = "freckle01"},
                            {name = "empty"}, {name = "empty"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "hopps01",
                                text = "Lucinda Liverwurst LemonCake! You do a repair with your sister this instant!"
                            },
                            {
                                char = "hopps01",
                                text = "...or will make the call!"
                            }, {char = "lucy07", text = "..."},
                            {char = "freckle01", text = "..."}
                        },
                        characters01 = {
                            {name = "lucy07"}, {name = "freckle01"},
                            {name = "empty"}, {name = "empty"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "empty", text = "Yeah."}, {
                                char = "empty",
                                text = "I'll do it.  I'll call Bugflix and tell them to stop work on the new Prancin Ponies movie..."
                            }, {
                                char = "empty",
                                text = "That's the one you like right? Keeper of the Emerald Dragon..."
                            },
                            {
                                char = "empty",
                                text = "I'll call Brad.  I'll tell him to cancel it."
                            }
                        },
                        characters01 = {
                            {name = "lucy07"}, {name = "freckle01"},
                            {name = "empty"}, {name = "empty"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "empty",
                                text = "I miss Brad!   I think I'll call him right now."
                            }, {char = "empty", text = "Nooooooo!!!!"},
                            {char = "empty", text = "Noooooooo!!!!!"},
                            {
                                char = "empty",
                                text = "We'll be good!!! We'll be good!!!"
                            }
                        },
                        characters01 = {
                            {name = "lucy07"}, {name = "freckle01"},
                            {name = "empty"}, {name = "empty"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "hopps01", text = "Not another peep!"},
                            {char = "empty", text = "Zip!"},
                            {char = "empty", text = "Zip!"}
                        },
                        characters01 = {
                            {name = "lucy07"}, {name = "freckle01"},
                            {name = "empty"}, {name = "empty"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "hopps01",
                                text = "Now go do your repair while I call Brandon back."
                            }, {char = "empty", text = "We forget how..."},
                            {
                                char = "empty",
                                text = "Then you should stop hurting each other!"
                            },
                            {char = "empty", text = "Uggghhh, just ask Alexa."},
                            {char = "empty", text = "Yay Alexa!"}
                        },
                        characters01 = {
                            {name = "lucy07"}, {name = "freckle01"},
                            {name = "empty"}, {name = "empty"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "empty"}, {name = "hopps01"},
                            {name = "barkPhone01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "lucy07", text = "You're mean."},
                            {char = "empty", text = "Wow, you figured it out."},
                            {
                                char = "empty",
                                text = "Congratulations, Albert Einstein."
                            },
                            {
                                char = "empty",
                                text = "You should have your own detective show.  Ha!"
                            }
                        },
                        characters01 = {
                            {name = "lucy07"}, {name = "freckle01"},
                            {name = "empty"}, {name = "empty"}, {name = "empty"}
                        },
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "empty"}
                        }
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = false,
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
        questTitle = "Gilbert Gossington is Gone!",
        startSceneCoords = {col = 0, row = 0},
        endSceneCoords = {row = 1, col = 2},
        sceneConfigs = {
            {
                name = "barn",
                frames = {
                    {
                        dialogs = {
                            {char = "goose01", text = "Giillll-beeeeert....."},
                            {char = "goose01", text = "Giiiiil-beeeeert....."},
                            {
                                char = "goose01",
                                text = "oh, Gilbert, my grubby grey-eyed gosling..."
                            }, {
                                char = "goose01",
                                text = "..where in the world have you mis-placed your self?"
                            }, {char = "chick01", text = "Peep!  Peep!"},
                            {char = "goat01", text = "Me-ee-ee-eh!"}
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {{name = "chick01"}, {name = "goat01"}}
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
                name = "coop",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "goose01",
                                text = "Oh good-ness!  A person."
                            },
                            {
                                char = "hopps01",
                                text = "...Brandon, I know!  I know that!  But the trip..."
                            }, {char = "hopps01", text = "LUCY!"}, {
                                char = "hopps01",
                                text = "Put that sword back in that.. that.. other thing... or I will..."
                            }
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "britta04"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "lucy07small",
                                text = "You don't know the name of this!"
                            },
                            {
                                char = "lucy07small",
                                text = "I'm smarter than you!"
                            }, {char = "goose01", text = "Oh dear friend!"}
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "britta04"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "hopps01",
                                text = "And stop hurting your sister!"
                            },
                            {
                                char = "freckle01",
                                text = "Ooooooowwwwww!  She hurt me!!!"
                            },
                            {
                                char = "lucy07small",
                                text = "You said you would play with us!"
                            }
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "freckle01"}
                        }
                    }, {
                        dialogs = {
                            {char = "goose01", text = "oh Sweet salvation!"},
                            {
                                char = "hopps01",
                                text = "<please don't be talking to me...>"
                            }, {char = "goose01", text = "Oh dear friend!"}, {
                                char = "hopps01",
                                text = "<please, please please, please puh-leeeeeeease...  don't be talking to me...>"
                            }, {
                                char = "goose01",
                                text = "Kind stranger!  I'm so fortunate to have found you."
                            }
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "freckle01"}
                        }
                    }, {
                        dialogs = {
                            {char = "hopps01", text = "...oh come ON!!!!!!"},
                            {
                                char = "hopps01",
                                text = "Brandon... hold on for literally just 3 seconds..."
                            },
                            {
                                char = "hopps01",
                                text = "I don't want to call you back!"
                            }, {
                                char = "hopps01",
                                text = "Sweet mother monkey milk!  What can possibly be so important????"
                            }
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "freckle01"}
                        }
                    }, {
                        dialogs = {
                            {char = "goose01", text = "It's Gilbert..."},
                            {char = "lucy07small", text = "Who's Gilbert?"},
                            {char = "goose01", text = "He's... He's..."},
                            {
                                char = "goose01",
                                text = "He's what? What is Gilbert?"
                            },
                            {
                                char = "lucy07small",
                                text = "Spit it out mother goose!"
                            }
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "freckle01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goose01",
                                text = "Gilbert Gossington... is gone!"
                            }, {char = "lucy07small", text = "<gasp>"},
                            {char = "freckle01", text = "<gasp>"}
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "freckle01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "empty",
                                text = "We can find him!  We can find him!"
                            },
                            {char = "empty", text = "Please Franny, please!"},
                            {
                                char = "empty",
                                text = "Franny, are you there?  Rhino just pulled up in his Jeep.  We can pick you up in 10 minutes."
                            }, {char = "barkPhone01", text = "Can we! Can we!"},
                            {
                                char = "empty",
                                text = "Ugggh... Stop it!  Everybody stop it!"
                            }, {
                                char = "empty",
                                text = "Lucy, you can go help find Gilbert Gargamel Goose-hopper, but be back in ten minutes."
                            },
                            {
                                char = "empty",
                                text = "Brandon.  Come pick me up.  I'm ready."
                            }, {char = "empty", text = "-----------"},
                            {char = "empty", text = "-----------"},
                            {char = "empty", text = "-----------"}
                        },
                        characters01 = {{name = "goose01"}},
                        characters02 = {
                            {name = "hopps01"}, {name = "barkPhone01"},
                            {name = "lucy07small"}, {name = "maldara01"}
                        }
                    }
                },
                coordinates = {col = 1, row = 0},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = false,
                isStartScene = false,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "well01",
                frames = {
                    {
                        dialogs = {
                            {char = "hopps01", text = "Hey Franny!"}, {
                                char = "scramper01",
                                text = "Never babysit!  Ever! No matter how much they pay you..."
                            },
                            {
                                char = "hopps01",
                                text = "Those kids are adorable!"
                            },
                            {
                                char = "hopps01",
                                text = "...don't even get me started..."
                            },
                            {
                                char = "skink01",
                                text = "...they are a couple of ticks in pig tails..."
                            }, {char = "saki", text = "To the lake!"},
                            {char = "empty", text = "Tally ho!"}
                        },
                        characters01 = {
                            {name = "empty"}, {name = "empty"},
                            {name = "hopps01"}
                        },
                        characters02 = {
                            {name = "scramper01"}, {name = "skink01"},
                            {name = "saki"}
                        }
                    }, {
                        dialogs = {
                            {char = "hopps01", text = "Did you bring it?"},
                            {char = "scramper01", text = "Yup.  Take a look!"},
                            {
                                char = "hopps01",
                                text = "...the Staff of Truth..."
                            },
                            {
                                char = "hopps01",
                                text = "...it's... it's so......."
                            }, {char = "saki", text = "...enchanting.....?"}
                        },
                        characters01 = {
                            {name = "empty"}, {name = "empty"},
                            {name = "hopps01"}, {name = "staffOfTruth01"}
                        },
                        characters02 = {
                            {name = "scramper01"}, {name = "skink01"},
                            {name = "saki"}
                        }
                    }
                },
                coordinates = {row = 1, col = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = true,
                showLeftPath = false,
                isEndScene = false,
                isStartScene = false,
                maxRow = 1,
                maxCol = 1
            }, {
                name = "lake",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "looney01cu",
                                text = "That's quite a trophy..."
                            },
                            {char = "hopps01", text = "Creepy old leperchaun!"},
                            {
                                char = "scramper01",
                                text = "Wha... What are you doing here?"
                            }, {
                                char = "looney01cu",
                                text = "Ha. Funny story. It was choice time, and I happened to be walking by with my water color set and easel, so I thought I might stop and paint the sun set."
                            }, {
                                char = "hopps01",
                                text = "oh... I didn't know you... wait. ...you don't have any water colors..."
                            },
                            {
                                char = "saki",
                                text = "Where is the Staff small rabbit?"
                            },
                            {
                                char = "looney01cu",
                                text = "Shall we do this the easy way of the hard way?"
                            }
                        },
                        characters01 = {
                            {name = "empty"}, {name = "empty"},
                            {name = "hopps01"}
                        },
                        characters02 = {
                            {name = "scramper01"}, {name = "looney01cu"},
                            {name = "whammer01"}
                        }
                    }
                },
                coordinates = {row = 1, col = 2},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                isEndScene = true,
                isStartScene = false,
                maxRow = 1,
                maxCol = 2
            }
        },
        gridSize = {rows = 2, cols = 3}
    }
}
return module

