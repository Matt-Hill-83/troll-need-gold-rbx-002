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
            }
        },
        gridSize = {rows = 1, cols = 3}
    }
}
return module

