local module = {}

module.questConfigs = {
    {
        questTitle = "News From Suesse Ville",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {row = 0, col = 2},
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
                coordinates = {row = 0, col = 2},
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
    }
}
return module

