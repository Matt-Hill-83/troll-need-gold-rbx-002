local module = {}

module.questConfigs = {
    {
        sceneConfigs = {
            {
                name = "stump",
                frames = {
                    {
                        dialogs = {
                            {char = "mongoFlying01", text = "Today is the day!"},
                            {char = "taffy01", text = "Today is what day?"},
                            {
                                char = "mongoFlying01",
                                text = "Today is the cup cake party!"
                            }, {char = "taffy01", text = "Today?"}, {
                                char = "mongoFlying01",
                                text = "Yes.  The cup cake party at straw berry lake is today!"
                            }, {
                                char = "taffy01",
                                text = "We just need to go to cup cake hill and get the cup cakes."
                            }, {char = "mongoFlying01", text = ""},
                            {char = "taffy01", text = ""}
                        },
                        characters01 = {
                            {name = "mongoFlying01"}, {name = "taffy01"}
                        },
                        characters02 = {{name = "empty"}}
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
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "taffy01", text = "We planned it all out."},
                            {
                                char = "mongoFlying01",
                                text = "Nothing can possibly go wrong!"
                            },
                            {char = "taffy01", text = "You can say that again!"},
                            {
                                char = "mongoFlying01",
                                text = "Nothing can possibly go..."
                            }
                        },
                        characters01 = {
                            {name = "taffy01"}, {name = "mongoFlying01"}
                        },
                        characters02 = {{name = "jam01"}}
                    }
                },
                coordinates = {col = 1, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "tree",
                frames = {
                    {
                        dialogs = {
                            {char = "goblinKing02", text = "MWa ha ha ha ha!"},
                            {
                                char = "goblinKing02",
                                text = "You shall not pass!"
                            }, {char = "taffy01", text = "Yikes!"},
                            {
                                char = "mongo01",
                                text = "Holy mother monkey milk!"
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "Oh no!  A Troll!  Use a people power skill!"
                            }, {char = "taffy01", text = "Which one?"},
                            {char = "mongo01", text = "I can't remember any..."},
                            {char = "mongo01", text = "Think!  Think!"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {char = "goblinKing02", text = "Wait!  I know!"}, {
                                char = "mongo01",
                                text = "What's that thing your mom is always saying to you?"
                            }, {
                                char = "goblinKing02",
                                text = "That all she does is clean up my messes all day?"
                            },
                            {char = "mongo01", text = "No, the other thing..."},
                            {char = "mongo01", text = "That I need a bath?"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "mongo01",
                                text = "No! The thing about sweet talk."
                            },
                            {
                                char = "taffy01",
                                text = "Honey, that's not sweet talk!"
                            }, {
                                char = "mongo01",
                                text = "Yes!  That's the one!  Do some sweet talk to the troll."
                            }, {char = "taffy01", text = "Good thinking!"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "taffy01",
                                text = "Um... Troll.  I like your umm... Club of Doom... thingy..."
                            },
                            {
                                char = "goblinKing02",
                                text = "My cup cakes!  ME! ME! ME!"
                            }, {char = "taffy01", text = "Keep going!"}, {
                                char = "mongo01",
                                text = "And Troll, your pants are really ummmm.... ummmmm... fancy...?"
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "Troll eat cup cakes! Yum! Yum!"
                            }, {
                                char = "taffy01",
                                text = "Wait just a sec! Kalyani, Troll's pants really are fancy..."
                            },
                            {
                                char = "mongo01",
                                text = "Do you think they make them in a 6S...?"
                            },
                            {
                                char = "taffy01",
                                text = "They look like dancing pants..."
                            },
                            {
                                char = "mongo01",
                                text = "Dancing pants on a troll?"
                            },
                            {
                                char = "mongo01",
                                text = "Something does not add up..."
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "I am the troll king! And you may not pass!"
                            },
                            {
                                char = "goblinKing02",
                                text = "I hold the key to cupcake mountain!"
                            }, {
                                char = "mongo01",
                                text = "Taffy, do that thing you do when your mom says to stop watching Netflix..."
                            },
                            {
                                char = "taffy01",
                                text = "Ummm... you mean just ignore her?"
                            },
                            {
                                char = "mongo01",
                                text = "Yeah, that!  Let's try that on the Troll..."
                            }, {
                                char = "taffy01",
                                text = "Look, Troll, I'm just gonna grab a couple of those lemon cup cakes..."
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "mongo01",
                                text = "...hmm...  better make it 3..."
                            }, {
                                char = "mongo01",
                                text = "...oooh..., and Sparkle, you like the mini cakes with the sprinkles..."
                            },
                            {char = "goblinKing02", text = "My cup cakes!!!"},
                            {
                                char = "taffy01",
                                text = "...so that's a half dozen..."
                            },
                            {
                                char = "taffy01",
                                text = "...tell you what, Troll King"
                            }, {
                                char = "taffy01",
                                text = "...I just going to fill up this giant basket with cupcakes, and you can have whatever is left."
                            }, {char = "taffy01", text = ""}
                        },
                        characters01 = {
                            {name = "sparkle01"}, {name = "mongo01"},
                            {name = "taffy01"}
                        },
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "Obey the Troll King!"
                            },
                            {
                                char = "taffy01",
                                text = "Ummm.. ok <air quotes> Troll King..."
                            }, {
                                char = "goblinKing02",
                                text = "Do not \"air quote\" the Troll King! <air quotes>"
                            }, {
                                char = "taffy01",
                                text = "I did not \"air quote\" the troll king... <air quotes>"
                            },
                            {
                                char = "taffy01",
                                text = "Because you... are not the troll king!"
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "I am the Troll King!"
                            },
                            {
                                char = "goblinKing02",
                                text = "I have the ring of Zandar!"
                            },
                            {
                                char = "mongo01",
                                text = "You may have the ring, but do you have the magic?"
                            },
                            {char = "goblinKing02", text = "I have the magic!"},
                            {
                                char = "mongo01",
                                text = "You do not have the magic!"
                            }, {char = "goblinKing02", text = "Do too!"},
                            {char = "mongo01", text = "Prove it!"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {char = "goblinKing02", text = "Rrrrr...."},
                            {char = "goblinKing02", text = "Rrrrr...."},
                            {
                                char = "goblinKing02",
                                text = "By the power of Andakar!"
                            },
                            {char = "cricket01", text = "Cricket= chirp chirp"},
                            {
                                char = "goblinKing02",
                                text = "By the power of Andakar!"
                            },
                            {char = "cricket01", text = "Cricket= chirp chirp"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"},
                            {name = "cricket01"}
                        }
                    }
                },
                coordinates = {col = 2, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 2
            }, {
                name = "barn",
                frames = {
                    {
                        dialogs = {
                            {char = "mongo01", text = "Troll King."},
                            {
                                char = "mongo01",
                                text = "Is that jam on your hand?"
                            },
                            {
                                char = "goblinKing02",
                                text = "Huh? Nooooo...  Jam???"
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {char = "goblinKing02", text = "No!"},
                            {char = "goblinKing02", text = "Not Jam!"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "mongo01",
                                text = "Those pants... And that jam..."
                            },
                            {
                                char = "taffy01",
                                text = "Wait!  I figured it out..."
                            },
                            {char = "mongo01", text = "The Troll King is..."},
                            {char = "taffy01", text = "Graeme!!!"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {char = "taffy01", text = "Just look at his pants!"},
                            {char = "mongo01", text = "..and his hands!"},
                            {
                                char = "babyTroll01",
                                text = "They're all covered with jam."
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "babyTroll01"}
                        }
                    }
                },
                coordinates = {row = 0, col = 3},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 3
            }, {
                name = "pond",
                frames = {
                    {
                        dialogs = {
                            {char = "goblinKing01", text = "Oh man!"},
                            {
                                char = "goblinKing01",
                                text = "I got jam on my brand new pants??"
                            },
                            {
                                char = "goblinKing01",
                                text = "These are fancy pants!"
                            },
                            {char = "goblinKing01", text = "I'm a dancing man!"},
                            {
                                char = "mongo01",
                                text = "Graeme, how you gonna dance with that jam on your fancy pants?"
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "ringOfZandar01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "taffy01",
                                text = "We gotta get him some ants!"
                            }, {char = "mongo01", text = "Huh?"},
                            {char = "taffy01", text = "..for his pants."},
                            {char = "mongo01", text = "..ok..."},
                            {
                                char = "taffy01",
                                text = "We can let the ants eat the jam"
                            },
                            {
                                char = "taffy01",
                                text = "off the fancy pants for Graeme"
                            },
                            {
                                char = "babyTroll01",
                                text = "So he can do the Zam."
                            }, {char = "mongo01", text = "What's the Zam?"},
                            {char = "babyTroll01", text = "The Zam is a dance."}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {char = "mongo01", text = "But... but... but..."},
                            {
                                char = "taffy01",
                                text = "but... ants eat plants..."
                            },
                            {
                                char = "goblinKing01",
                                text = "Not the fancy ants!"
                            },
                            {
                                char = "mongo01",
                                text = "You mean the ants from France?"
                            },
                            {
                                char = "goblinKing01",
                                text = "Yes! The ants from France!"
                            },
                            {char = "goblinKing01", text = "I'm a dancing man."},
                            {char = "goblinKing01", text = "I got fancy pants."}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {{name = "goblinKing01"}}
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing01",
                                text = "We gotta get to France for the fancy ants"
                            },
                            {
                                char = "goblinKing01",
                                text = "To get the jam off my dancing pants."
                            },
                            {
                                char = "mongo01",
                                text = "I don't wanna put a crook in your plans..."
                            }, {
                                char = "mongo01",
                                text = "But I think you need to book in advance, for France"
                            },
                            {
                                char = "taffy01",
                                text = "And can't we just look in the plants for ants?"
                            },
                            {
                                char = "babyTroll01",
                                text = "May be we can teach you the Zam!"
                            }, {char = "mongo01", text = "What's the Zam?"}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing01",
                                text = "The Zam is the dance you do"
                            },
                            {
                                char = "goblinKing01",
                                text = "If you're a fancy dude"
                            }, {char = "babyTroll01", text = "from France"},
                            {char = "goblinKing01", text = "and you"},
                            {char = "goblinKing01", text = "just got"},
                            {char = "goblinKing01", text = "jam on your hands"},
                            {
                                char = "babyTroll01",
                                text = "and it's time to dance"
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "babyTroll01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "goblinKing01",
                                text = "So you flap em in the air"
                            },
                            {char = "mongo01", text = "Like a couple of fans"},
                            {
                                char = "babyTroll01",
                                text = "That are covered with ants!"
                            }
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "babyTroll01"},
                            {name = "ringOfZandar01"}
                        }
                    }, {
                        dialogs = {
                            {char = "taffy01", text = "Graeme, you are fun..."},
                            {char = "mongo01", text = "...but we gotta run."},
                            {
                                char = "goblinKing01",
                                text = "Hey, can I have that jam?"
                            },
                            {
                                char = "taffy01",
                                text = "Hmmmm... I'll trade you for that ring."
                            },
                            {
                                char = "goblinKing01",
                                text = "You can have the ring."
                            },
                            {char = "goblinKing01", text = "It doesn't work..."}
                        },
                        characters01 = {{name = "mongo01"}, {name = "taffy01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "babyTroll01"},
                            {name = "ringOfZandar01"}
                        }
                    }
                },
                coordinates = {col = 4, row = 0},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 4
            }, {
                name = "coop",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "mongoFlying01",
                                text = "We got the cup cakes!"
                            },
                            {
                                char = "taffy01",
                                text = "Yay people power skills!"
                            },
                            {
                                char = "mongoFlying01",
                                text = "Now we go to the party!"
                            }, {char = "taffy01", text = ""}
                        },
                        characters01 = {
                            {name = "taffy01"}, {name = "mongoFlying01"}
                        },
                        characters02 = {{name = "empty"}}
                    }
                },
                coordinates = {row = 1, col = 4},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 4
            }
        },
        gridSize = {rows = 2, cols = 5}
    }, {
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
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
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
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
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
                maxRow = 0,
                maxCol = 3
            }
        },
        gridSize = {rows = 1, cols = 4}
    }, {
        sceneConfigs = {
            {
                name = "slide",
                frames = {
                    {
                        dialogs = {
                            {char = "fiona01", text = "Look a bag!"},
                            {
                                char = "taffy01",
                                text = "Cool.  Is that your bag?"
                            }, {char = "fiona01", text = "No."},
                            {
                                char = "taffy01",
                                text = "So, why did you just put it in your pocket?"
                            }
                        },
                        characters01 = {{name = "fiona01"}, {name = "taffy01"}},
                        characters02 = {{name = "bag"}}
                    }, {
                        dialogs = {
                            {char = "fiona01", text = "Um, I don't know."},
                            {
                                char = "taffy01",
                                text = "So you just walk around and take stuff?"
                            }, {char = "fiona01", text = "Yeah... Cool right?"},
                            {char = "taffy01", text = "Is that okay?"}
                        },
                        characters01 = {{name = "fiona01"}, {name = "taffy01"}},
                        characters02 = {{name = "bag"}}
                    }, {
                        dialogs = {
                            {
                                char = "fiona01",
                                text = "Yeah, it's okay, because this is just a game."
                            },
                            {
                                char = "taffy01",
                                text = "So, this place is a game?"
                            }, {char = "fiona01", text = "Yup.  Weird huh?"}, {
                                char = "fiona01",
                                text = "I mean look, do you even see any pockets in this dress?"
                            },
                            {
                                char = "taffy01",
                                text = "I was about to ask you about that..."
                            }
                        },
                        characters01 = {{name = "fiona01"}, {name = "taffy01"}},
                        characters02 = {{name = "bag"}}
                    }
                },
                coordinates = {col = 3, row = 0},
                showBottomPath = true,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 0,
                maxCol = 3
            }, {
                name = "dog01",
                frames = {
                    {
                        dialogs = {
                            {char = "fiona01", text = "Hi dog!"},
                            {char = "taffy01", text = "Bark Bark!"},
                            {char = "fiona01", text = ""},
                            {
                                char = "taffy01",
                                text = "So, why did you just put it in your pocket?"
                            }
                        },
                        characters01 = {{name = "fiona01"}, {name = "taffy01"}},
                        characters02 = {{name = "bun"}}
                    }
                },
                coordinates = {col = 4, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 4
            }, {
                name = "swing",
                frames = {
                    {
                        dialogs = {
                            {char = "taffy01", text = "Here doggy doggy..."},
                            {char = "chick01", text = "Peep peep!"},
                            {char = "cow01", text = "Moooooo...."},
                            {char = "chick01", text = "Peep peep!"},
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"}
                        },
                        characters01 = {{name = "taffy01"}},
                        characters02 = {
                            {name = "chick01"}, {name = "cow01"}, {name = "elf"}
                        }
                    }
                },
                coordinates = {row = 1, col = 3},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 4
            }, {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "taffy01", text = "Hi dog!"},
                            {char = "dog01", text = "Oh no!"},
                            {
                                char = "dog01",
                                text = "Oh no... Oh no... Oh no..."
                            }, {char = "taffy01", text = "Can I help you?"},
                            {char = "dog01", text = "My space ship..."},
                            {char = "dog01", text = "My space ship is... gone!"}
                        },
                        characters01 = {{name = "taffy01"}},
                        characters02 = {{name = "dog01"}}
                    }, {
                        dialogs = {
                            {
                                char = "taffy01",
                                text = "Your space ship is gone?"
                            },
                            {
                                char = "dog01",
                                text = "Yes.  I left it here. Now it is gone!"
                            },
                            {
                                char = "taffy01",
                                text = "Did you look in the tree?"
                            },
                            {
                                char = "dog01",
                                text = "No.  No, I did not look in the tree..."
                            },
                            {
                                char = "taffy01",
                                text = "We can look in the tree!"
                            }, {char = "taffy01", text = "Tee hee hee!"}
                        },
                        characters01 = {{name = "taffy01"}},
                        characters02 = {{name = "dog01"}}
                    }
                },
                coordinates = {col = 0, row = 2},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 2,
                maxCol = 4
            }, {
                name = "tree01",
                frames = {
                    {
                        dialogs = {
                            {char = "taffy01", text = "Look!  I see balloons!"},
                            {
                                char = "dog01",
                                text = "That is not my space ship!"
                            },
                            {
                                char = "taffy01",
                                text = "I will get the balloons."
                            },
                            {
                                char = "dog01",
                                text = "I must find my space ship!"
                            }
                        },
                        characters01 = {{name = "taffy01"}, {name = "dog01"}},
                        characters02 = {{name = "balloons01"}}
                    }, {
                        dialogs = {
                            {char = "taffy01", text = "May be check the bus..."},
                            {
                                char = "dog01",
                                text = "The bus!  I will go check the bus!"
                            }, {char = "taffy01", text = "Ok.  Bye Bye."},
                            {char = "elf", text = "DO NOT GO IN THE CAVE!!!"}
                        },
                        characters01 = {{name = "taffy01"}, {name = "dog01"}},
                        characters02 = {{name = "balloons01"}, {name = "elf"}}
                    }
                },
                coordinates = {row = 2, col = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 2,
                maxCol = 4
            }, {
                name = "bog",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "taffy01",
                                text = "Hi Fiona.  I like your dog."
                            }, {char = "fiona", text = "Hi name is Angus."},
                            {char = "angus01", text = "Bark Bark!"},
                            {char = "taffy01", text = "Hi doggy."},
                            {char = "fiona", text = "Do you want a balloon?"},
                            {char = "angus01", text = "Bark Bark!"}
                        },
                        characters01 = {{name = "taffy01"}},
                        characters02 = {{name = "angus01"}, {name = "fiona"}}
                    }, {
                        dialogs = {
                            {
                                char = "fiona",
                                text = "Oh no!  Angus is going up!"
                            }, {char = "angusBalloon01", text = "Bark Bark!"},
                            {
                                char = "fiona",
                                text = "Angus, let go of the balloons!"
                            }, {char = "angusBalloon01", text = "Bark Bark!"}
                        },
                        characters01 = {{name = "taffy01"}},
                        characters02 = {
                            {name = "angusBalloon01"}, {name = "fiona"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "fiona",
                                text = "Well... this is not good..."
                            },
                            {
                                char = "taffy01",
                                text = "We need to find your dog!"
                            }
                        },
                        characters01 = {{name = "taffy01"}},
                        characters02 = {
                            {name = "angusBalloon01"}, {name = "fiona"}
                        }
                    }
                },
                coordinates = {col = 2, row = 2},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 2,
                maxCol = 4
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "I am the banana queen!!!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "fiona", text = "Hi Kat."},
                            {
                                char = "kat",
                                text = "Oh hi Fiona, you snuck up on me."
                            }, {char = "fiona", text = "What are you doing?"},
                            {
                                char = "kat",
                                text = "Oh, ummmm... just some stuff."
                            }
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {{name = "fiona"}, {name = "taffy01"}}
                    }, {
                        dialogs = {
                            {char = "fiona", text = "We have a problem!"},
                            {char = "kat", text = "Like a math problem?"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {{name = "fiona"}, {name = "taffy01"}}
                    }, {
                        dialogs = {
                            {char = "fiona", text = "We need to fly."},
                            {char = "kat", text = "Keep talking..."},
                            {
                                char = "taffy01",
                                text = "Angus went up in the sky!"
                            }, {char = "fiona", text = "How can we fly?"},
                            {
                                char = "kat",
                                text = "You need to find Lucy.  She can help you fly."
                            }, {char = "fiona", text = ""},
                            {char = "kat", text = ""}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {{name = "fiona"}, {name = "taffy01"}}
                    }
                },
                coordinates = {col = 3, row = 2},
                showBottomPath = true,
                showRightPath = true,
                showTopPath = true,
                showLeftPath = true,
                maxRow = 2,
                maxCol = 4
            }, {
                name = "lake",
                frames = {
                    {
                        dialogs = {
                            {char = "taffy01", text = "I see a snake."},
                            {
                                char = "fiona01",
                                text = "I see a snake... in a lake!"
                            }, {char = "snake01", text = "Ssssssss......"},
                            {char = "goblin", text = "TROLL NEED GOLD!!!"}
                        },
                        characters01 = {{name = "fiona01"}, {name = "taffy01"}},
                        characters02 = {{name = "snake01"}, {name = "goblin"}}
                    }
                },
                coordinates = {row = 2, col = 4},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 2,
                maxCol = 4
            }, {
                name = "cave",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "goblinKing02",
                                text = "I am the troll king!"
                            },
                            {
                                char = "fiona01",
                                text = "You are the troll king..."
                            },
                            {
                                char = "goblinKing02",
                                text = "I am the troll king!"
                            },
                            {
                                char = "fiona01",
                                text = "You have jam on your pants... troll king."
                            },
                            {char = "goblinKing02", text = "That is not jam."},
                            {char = "fiona01", text = "That is jam..."},
                            {
                                char = "fiona01",
                                text = "...and you are... Graeme!"
                            }
                        },
                        characters01 = {{name = "taffy01"}, {name = "fiona01"}},
                        characters02 = {
                            {name = "goblinKing02"}, {name = "ringOfZandar01"}
                        }
                    }, {
                        dialogs = {
                            {char = "goblinKing01", text = "I am not Graeme!"},
                            {
                                char = "goblinKing01",
                                text = "I am the troll king."
                            },
                            {
                                char = "marli01",
                                text = "Then I will take off this mask..."
                            },
                            {char = "goblinKing01", text = "Ok.  I am Graeme."},
                            {
                                char = "goblinKing01",
                                text = "Can you bring this ring to the swing?"
                            },
                            {
                                char = "fiona01",
                                text = "If you put it on a string."
                            }, {char = "goblinKing01", text = "Ok."},
                            {char = "fiona01", text = ""}
                        },
                        characters01 = {{name = "taffy01"}, {name = "fiona01"}},
                        characters02 = {
                            {name = "goblinKing01"}, {name = "ringOfZandar01"}
                        }
                    }
                },
                coordinates = {col = 3, row = 3},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 3,
                maxCol = 4
            }
        },
        gridSize = {rows = 4, cols = 5}
    }, {
        sceneConfigs = {
            {
                name = "pond",
                frames = {
                    {
                        dialogs = {
                            {char = "liz2", text = "I see a frog."},
                            {char = "liz2", text = "I see a frog... on a log."},
                            {char = "liz2", text = "Tee Hee Hee!"},
                            {
                                char = "kat",
                                text = "Wow Liz, you have good eyes!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "I see a pig."},
                            {char = "liz2", text = "I see a pig... in a wig!"},
                            {char = "liz2", text = "Tee Hee Hee!"},
                            {
                                char = "kat",
                                text = "Liz, could we maybe talk about something else today?"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "I see a goat."},
                            {char = "liz2", text = "I see a goat... in a boat!"},
                            {char = "kat", text = "Oh my gosh Kat! Turn six!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "What'evs girl... I turned six when you were still riding a trycicle."
                            }, {
                                char = "kat",
                                text = "Ha! Good one! Well, I turned six when you were still wearing Sponge Bob training pants!"
                            }, {
                                char = "liz2",
                                text = "Oh yeah, well your mom still drives you around in a backwards car seat!"
                            },
                            {
                                char = "kat",
                                text = "Oh snap! That’s a good one!"
                            },
                            {
                                char = "kat",
                                text = "I’m going to drop that one on the Troll later!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 0,
                maxCol = 0
            }, {
                name = "bog",
                frames = {
                    {
                        dialogs = {
                            {char = "liz2", text = "The Troll?"},
                            {
                                char = "liz2",
                                text = "Do you mean the 'TROLL NEEDS GOLD' Troll?"
                            },
                            {char = "liz2", text = "What’s up with that guy?"},
                            {
                                char = "kat",
                                text = "I know, right? He’s the coolest!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "Yeah, totally..."},
                            {char = "liz2", text = "...but, I don’t get it."},
                            {char = "liz2", text = "What’s his deal?"},
                            {
                                char = "liz2",
                                text = "Why does he always yell= 'TROLL NEED GOLD'?"
                            },
                            {char = "liz2", text = "It’s a valid question."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Really Liz?"}, {
                                char = "kat",
                                text = "Are you seriously asking me why the Troll runs around yelling= 'TROLL NEED GOLD'?"
                            }, {char = "liz2", text = "Yes!"},
                            {char = "kat", text = "You’re not kidding?"}
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
                name = "bees",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Well, I think he’s saying it because he needs gold."
                            },
                            {
                                char = "liz2",
                                text = "Um, yeah. Thanks Albert Einstein."
                            }, {char = "liz2", text = "I get that part."},
                            {char = "kat", text = "Oh."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "I understand that he is literally asking for gold."
                            }, {char = "liz2", text = "I'm six. Remember?"},
                            {char = "kat", text = "Ok."},
                            {char = "liz2", text = "But why does he need gold?"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "Elliot says he doesn't ~need~ gold."
                            },
                            {
                                char = "liz2",
                                text = "The troll probably just ~wants~ gold."
                            },
                            {
                                char = "kat",
                                text = "Wait, is that the kid that says="
                            },
                            {
                                char = "kat",
                                text = "You get what you get and you don't get upset?"
                            }, {char = "kat", text = "Well, I get upset!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Getting upset is my thing!"},
                            {char = "liz2", text = "Calm down Kat."},
                            {
                                char = "kat",
                                text = "Getting upset is my happy place!"
                            },
                            {
                                char = "liz2",
                                text = "Kat, no one is trying to take away your crazy."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }
                },
                coordinates = {col = 2, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 2
            }, {
                name = "swamp",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "But the Troll... What’s his back story?"
                            },
                            {char = "kat", text = "Liz!!!! Noooooooooooo!!!!"},
                            {char = "liz2", text = "Huh?"},
                            {char = "kat", text = "No! No! No! No! No!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "What?"},
                            {char = "kat", text = "Undo! Undo!"},
                            {
                                char = "liz2",
                                text = "Kat, today is not your day to be crazy."
                            }, {char = "liz2", text = "We need to take turns."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Liz, never... ever... ever..."
                            },
                            {
                                char = "kat",
                                text = "...ask for a creature's backstory"
                            },
                            {
                                char = "kat",
                                text = "That's like Rule Number One!"
                            }, {
                                char = "liz2",
                                text = "I thought 'Never stand behind a donkey' was Rule Number One..."
                            }, {char = "kat", text = "Liiiiiiizzzz!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "You asked about the troll's back story."
                            }, {char = "liz2", text = "So?"}, {
                                char = "kat",
                                text = "Now Matt is going to do some loooooong story about the troll."
                            },
                            {
                                char = "kat",
                                text = "Remember how distracted he gets?"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "Wait, what's a back story?"},
                            {
                                char = "kat",
                                text = "It's a story that tells where the creature came from."
                            }, {char = "kat", text = "What's it's name?"},
                            {char = "kat", text = "Where does it live?"},
                            {
                                char = "kat",
                                text = "Did it have a happy child hood?"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "Cool!"},
                            {char = "kat", text = "No! Not cool!"},
                            {char = "kat", text = "The opposite of cool!"},
                            {char = "liz2", text = "Warm?"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Liz, we are trying to find the that sparkly dress!"
                            },
                            {char = "kat", text = "Remember... 'Dress Quest'?"},
                            {
                                char = "kat",
                                text = "I don't even think that's the name of this game anymore."
                            }, {char = "liz2", text = "It's not."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "empty"}}
                    }
                },
                coordinates = {row = 0, col = 3},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 3
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "My point exactly!!!"},
                            {
                                char = "liz2",
                                text = "I think it's Rapping Troll Cave."
                            },
                            {char = "kat", text = "Oh no... here it comes..."},
                            {
                                char = "liz2",
                                text = "Hey look! There's the troll."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "troll01"}, {name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "I didn't see him there before."
                            }, {char = "kat", text = "Oh dear..."},
                            {
                                char = "liz2",
                                text = "I swear he wasn't there 3 seconds ago."
                            }, {char = "liz2", text = "Hello Troll."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "troll01"}, {name = "empty"}}
                    }, {
                        dialogs = {
                            {
                                char = "troll2",
                                text = "TROLL.... SOOOOOO..... SAD..."
                            },
                            {char = "liz2", text = "Oh my goodness! Why...?"},
                            {char = "troll2", text = "BOO HOO!"},
                            {char = "kat", text = "Oh brother..."},
                            {
                                char = "troll2",
                                text = "TODAY.... TROLL BIRTHDAY..."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "troll01"}, {name = "empty"}}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "You poor thing!"},
                            {
                                char = "troll2",
                                text = "TROLL WANT FROOT LOOPS!!!"
                            }, {char = "liz2", text = "Oh my gosh... so sad."},
                            {
                                char = "troll2",
                                text = "TROLL MOM NOT LIKE SUGAR!!!"
                            }, {char = "liz2", text = "I'm so sorry..."},
                            {char = "kat", text = "We gotta go. Bye! Bye!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "troll01"}, {name = "empty"}}
                    }
                },
                coordinates = {col = 4, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 4
            }
        },
        gridSize = {rows = 1, cols = 5}
    }, {
        sceneConfigs = {
            {
                name = "cave",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "katieKooper01",
                                text = "Yay, we are just in time for the rap battle"
                            },
                            {char = "kat", text = "Cool! What's a rap battle?"},
                            {char = "katieKooper01", text = "I don't know."},
                            {char = "katieKooper01", text = "Let's find out!."}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "The trolls don't know we stole the diamond. So just act cool."
                            },
                            {
                                char = "katieKooper01",
                                text = "What! We STOLE the DIAMOND?"
                            }, {char = "kat", text = "Shhhhhhhhhhh!"},
                            {char = "troll01", text = "LOOK GIRLS!"},
                            {char = "troll02", text = "GIRLS TAKE DIAMOND?"},
                            {char = "troll01", text = "TROLLS EAT GIRLS!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "What? Who? Me? Don't be silly. We hate diamonds!"
                            },
                            {
                                char = "katieKooper01",
                                text = "What? Kat, we love diamonds!!!"
                            }, {char = "kat", text = "Katie!!!!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Oh hello trolls. We are not here to take your diamond."
                            },
                            {
                                char = "kat",
                                text = "We are here for....ummmm.... uuuuuhhhh..."
                            },
                            {
                                char = "kat",
                                text = "Katie! Think of something quick!"
                            },
                            {
                                char = "katieKooper01",
                                text = "We're here for the rap battle!"
                            }, {char = "kat", text = "Good save Katie Kooper!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "My friend Kat here is going to show you trolls how to rap!"
                            }, {char = "kat", text = "Katie!!!!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "troll01", text = "RAP BATTLE!"},
                            {char = "troll02", text = "RAP BATTLE!"},
                            {
                                char = "kat",
                                text = "Katie? What in the world are you getting us into."
                            },
                            {
                                char = "katieKooper01",
                                text = "Chill out Kat, it's fine."
                            },
                            {
                                char = "katieKooper01",
                                text = "Just do the rap about the frog on the log."
                            }, {char = "kat", text = "The frog on the log?!?"},
                            {
                                char = "kat",
                                text = "Yeah. The one you did this morning! That was hilarious!"
                            }
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Ugggghhh! Katie! That was not a rap!"
                            },
                            {
                                char = "kat",
                                text = "This morning, I literally, saw a frog on a log."
                            },
                            {
                                char = "katieKooper01",
                                text = "That was so funny! You had me dying!"
                            }, {char = "kat", text = "Katie!!!!"},
                            {
                                char = "kat",
                                text = "Stop Talking! For the first time in your life!"
                            },
                            {
                                char = "kat",
                                text = "Listen to me very closely. There is no rap."
                            }
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}, {name = "empty"}
                        }
                    }, {
                        dialogs = {
                            {char = "kat", text = "This morning..."},
                            {char = "kat", text = "I SAW A FROG..."},
                            {char = "troll01", text = "GIRL SAW FROG???"},
                            {char = "kat", text = "...ON A LOG!"},
                            {char = "troll02", text = "FROG ON LOG!"},
                            {char = "troll01", text = "HA! HA! HOO! HOO!"},
                            {char = "troll01", text = "TROLL LIKE FROG!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}, {name = "empty"}
                        }
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 0,
                maxCol = 0
            }, {
                name = "bog",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "And I'm NOT gonna RAP."},
                            {char = "kat", text = "It's just a silly fad."},
                            {char = "kat", text = "You think your day was bad?"},
                            {
                                char = "kat",
                                text = "Well let me tell you trolls about the day I've had."
                            }, {char = "troll01", text = "FROG ON LOG!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {char = "kat", text = "First we saw a frog"},
                            {char = "kat", text = "The frog was on a log."},
                            {char = "kat", text = "Then there was this dog..."},
                            {
                                char = "kat",
                                text = "...stuck in a bog wearing clogs!"
                            }, {char = "troll01", text = "TROLL LIKE BOG!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {char = "kat", text = "Me and Liz took a walk."},
                            {char = "kat", text = "First we see a mop."},
                            {char = "kat", text = "Then there was this top?"},
                            {char = "kat", text = "Right next to a cop"},
                            {
                                char = "kat",
                                text = "with a frog on a log, drinking pop!"
                            }, {char = "troll01", text = "HA! HA! HOO! HOO!"},
                            {char = "troll02", text = "FROGGY LIKE POP!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "So quit squishin all the fish and sit and listen!"
                            },
                            {
                                char = "kat",
                                text = "Cause I'm the kinda kid that makes the grown ups stop."
                            },
                            {
                                char = "kat",
                                text = "And yell= Honey! Hide the keys to the donut shop!"
                            }, {char = "troll01", text = "DONUT SHOP!"},
                            {
                                char = "kat",
                                text = "You trolls like the Donut Shop?"
                            }, {char = "troll21", text = "DONUT SHOP!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
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
                name = "swamp",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "My parents groan a lot."}, {
                                char = "kat",
                                text = "You hear that rumble? That's my tummy from the soda pop."
                            }, {char = "kat", text = "Call the doc!"},
                            {
                                char = "kat",
                                text = "So we can ask if I'll explode or not!"
                            },
                            {
                                char = "kat",
                                text = "I check my phone a lot, but it won't unlock!"
                            },
                            {
                                char = "kat",
                                text = "Yeah, it's bark, just wait. I'll get it Photoshopped."
                            }
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "I'll see you at my birthday when corona stops."
                            },
                            {
                                char = "kat",
                                text = "And when the party starts rockin..."
                            },
                            {
                                char = "kat",
                                text = "That's just me and Liz squawkin..."
                            },
                            {
                                char = "kat",
                                text = "Like 2 sea gulls that got locked in-"
                            }, {char = "kat", text = "side a donut shop."},
                            {char = "troll01", text = "DONUT SHOP!"}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "They said this was a battle, but you Trolls don't bloop."
                            }, {
                                char = "kat",
                                text = "Fellas, I'm about to tell a troll the stone cold truth."
                            },
                            {
                                char = "kat",
                                text = "Here's some cold stone soup."
                            }, {char = "kat", text = "In an old sewn shoe."}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "And wait, here's a bone for your pooch too!"
                            },
                            {
                                char = "kat",
                                text = "Little kid, you want a cold cone for your loose tooth?"
                            }, {
                                char = "kat",
                                text = "And here's some goop for the hole in your boot where your big hairy toes poke through."
                            }, {
                                char = "kat",
                                text = "And you two. You don't bloop? You ever heard of youTube?"
                            }, {char = "troll01", text = "We don't do it..."},
                            {char = "troll02", text = "...it's too new."}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }
                },
                coordinates = {row = 0, col = 2},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 2
            }, {
                name = "hill",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "Blip Bleep Bloop."},
                            {char = "kat", text = "Flap Flop Floop, Flizz."}
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {char = "kat", text = "I like you trolls a lot"},
                            {char = "kat", text = "But I gotta find Liz."},
                            {char = "troll01", text = "Bye Bye!"},
                            {char = "troll02", text = "See you soon!"},
                            {
                                char = "troll01",
                                text = "Hope you have a nice trip!"
                            }
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "katieKooper01",
                                text = "Kat, you won the Rap battle!"
                            }, {char = "kat", text = "What's a rap battle?"},
                            {
                                char = "kat",
                                text = "Um.... Never mind. Let's go find Liz!"
                            },
                            {
                                char = "troll01",
                                text = "Baby troll wants to come with you."
                            },
                            {
                                char = "kat",
                                text = "Oh dear. Oh no no no no no... come on Matt!"
                            },
                            {
                                char = "katieKooper01",
                                text = "Cuuu----uuuute! OK!"
                            },
                            {
                                char = "kat",
                                text = "Think about pretty dresses Katie. Pretty Dresses!"
                            }
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "troll01",
                                text = "Here is baby troll's diaper pin."
                            }, {
                                char = "kat",
                                text = "Oh no, it's sundown and we don't have the magical stone of Azkabat."
                            },
                            {
                                char = "katieKooper01",
                                text = "It's actually part of the diaper pin"
                            }
                        },
                        characters01 = {{name = "kat"}},
                        characters02 = {
                            {name = "katieKooper01"}, {name = "troll01"},
                            {name = "troll02"}
                        }
                    }
                },
                coordinates = {col = 3, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 3
            }
        },
        gridSize = {rows = 1, cols = 4}
    }
}
return module
