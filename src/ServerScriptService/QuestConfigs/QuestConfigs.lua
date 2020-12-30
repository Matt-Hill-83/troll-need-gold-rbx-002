local module = {}

module.questConfigs = {
    {
        questTitle = "RX-004 - A Frog on a Log",
        words = "BOG,DOG,FOG,HOG,JOG,LOG",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {row = 0, col = 0},
        sceneConfigs = {
            {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "katHappy", text = "Hi kid!"},
                            {
                                char = "lizOptimistic",
                                text = "Will you play with me?"
                            }, {char = "katHappy", text = "Yes?"},
                            {char = "lizOptimistic", text = "Yay!"}
                        },
                        characters01 = {
                            {name = "katHappy"}, {name = "lizOptimistic"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "lizUnsure", text = "I see a hat."},
                            {
                                char = "katSurprised",
                                text = "I see a hat... on a mat!"
                            }, {char = "lizUnsure", text = "Tee hee hee."}
                        },
                        characters01 = {
                            {name = "katSurprised"}, {name = "lizUnsure"}
                        },
                        characters02 = {{name = "hat"}, {name = "mat"}}
                    }, {
                        dialogs = {
                            {char = "lizOptimistic", text = "I see a cat."},
                            {
                                char = "lizOptimistic",
                                text = "I see a cat... on a hat!"
                            }, {char = "katDismayed", text = "Not a cat!!!"}
                        },
                        characters01 = {
                            {name = "katDismayed"}, {name = "lizOptimistic"}
                        },
                        characters02 = {{name = "rat"}, {name = "hat"}}
                    }, {
                        dialogs = {
                            {char = "lizSurprised", text = "Hi kitty kitty..."},
                            {char = "katCringing", text = "That is not a cat!"},
                            {char = "lizSurprised", text = "Good kitty.."},
                            {char = "katCringing", text = "That is a rat!"},
                            {char = "lizSurprised", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {
                                char = "lizSurprised",
                                text = "We can pat the cat."
                            }, {char = "katCringing", text = "Not that cat!"},
                            {
                                char = "lizSurprised",
                                text = "We can chat with the cat."
                            },
                            {
                                char = "katCringing",
                                text = "Do not chat with that cat!"
                            }
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {char = "lizDismayed", text = "Bye kitty!"},
                            {char = "rat", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katLoud"}, {name = "lizDismayed"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }
                },
                coordinates = {row = 0, col = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = true,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }
        },
        gridSize = {rows = 1, cols = 1}
    }, {
        questTitle = "RX-001 - A Cat on a Hat",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {row = 0, col = 0},
        sceneConfigs = {
            {
                name = "tree01",
                frames = {
                    {
                        dialogs = {
                            {char = "katHappy", text = "Hi kid!"},
                            {
                                char = "lizOptimistic",
                                text = "Will you play with me?"
                            }, {char = "katHappy", text = "Yes?"},
                            {char = "lizOptimistic", text = "Yay!"}
                        },
                        characters01 = {
                            {name = "katHappy"}, {name = "lizOptimistic"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "lizUnsure", text = "I see a hat."},
                            {
                                char = "katSurprised",
                                text = "I see a hat... on a mat!"
                            }, {char = "lizUnsure", text = "Tee hee hee."}
                        },
                        characters01 = {
                            {name = "katSurprised"}, {name = "lizUnsure"}
                        },
                        characters02 = {{name = "hat"}, {name = "mat"}}
                    }, {
                        dialogs = {
                            {char = "lizOptimistic", text = "I see a cat."},
                            {
                                char = "lizOptimistic",
                                text = "I see a cat... on a hat!"
                            }, {char = "katDismayed", text = "Not a cat!!!"}
                        },
                        characters01 = {
                            {name = "katDismayed"}, {name = "lizOptimistic"}
                        },
                        characters02 = {{name = "rat"}, {name = "hat"}}
                    }, {
                        dialogs = {
                            {char = "lizSurprised", text = "Hi kitty kitty..."},
                            {char = "katCringing", text = "That is not a cat!"},
                            {char = "lizSurprised", text = "Good kitty.."},
                            {char = "katCringing", text = "That is a rat!"},
                            {char = "lizSurprised", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {char = "rat", text = "We can pat the cat."},
                            {char = "katCringing", text = "Not that cat!"},
                            {
                                char = "lizSurprised",
                                text = "We can chat with the cat."
                            },
                            {
                                char = "katCringing",
                                text = "Do not chat with that cat!"
                            }
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {char = "lizDismayed", text = "Bye kitty!"},
                            {char = "rat", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katLoud"}, {name = "lizDismayed"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }
                },
                coordinates = {row = 0, col = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = true,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }
        },
        gridSize = {rows = 1, cols = 1}
    }, {
        questTitle = "RX-002 - A Bee in a Tree",
        words = "ME,WE,SEE,BEE,HEE,WEE,PEE,FEE,TEE",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {row = 0, col = 0},
        sceneConfigs = {
            {
                name = "bee01",
                frames = {
                    {
                        dialogs = {
                            {char = "katHappy", text = "Hi kid!"},
                            {
                                char = "lizOptimistic",
                                text = "Will you play with me?"
                            }, {char = "katHappy", text = "Yes?"},
                            {char = "lizOptimistic", text = "Yay!"}
                        },
                        characters01 = {
                            {name = "katHappy"}, {name = "lizOptimistic"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "lizUnsure", text = "I see a hat."},
                            {
                                char = "katSurprised",
                                text = "I see a hat... on a mat!"
                            }, {char = "lizUnsure", text = "Tee hee hee."}
                        },
                        characters01 = {
                            {name = "katSurprised"}, {name = "lizUnsure"}
                        },
                        characters02 = {{name = "hat"}, {name = "mat"}}
                    }, {
                        dialogs = {
                            {char = "lizOptimistic", text = "I see a cat."},
                            {
                                char = "lizOptimistic",
                                text = "I see a cat... on a hat!"
                            }, {char = "katDismayed", text = "Not a cat!!!"}
                        },
                        characters01 = {
                            {name = "katDismayed"}, {name = "lizOptimistic"}
                        },
                        characters02 = {{name = "rat"}, {name = "hat"}}
                    }, {
                        dialogs = {
                            {char = "lizSurprised", text = "Hi kitty kitty..."},
                            {char = "katCringing", text = "That is not a cat!"},
                            {char = "lizSurprised", text = "Good kitty.."},
                            {char = "katCringing", text = "That is a rat!"},
                            {char = "lizSurprised", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {
                                char = "lizSurprised",
                                text = "We can pat the cat."
                            }, {char = "katCringing", text = "Not that cat!"},
                            {
                                char = "lizSurprised",
                                text = "We can chat with the cat."
                            },
                            {
                                char = "katCringing",
                                text = "Do not chat with that cat!"
                            }
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {char = "lizDismayed", text = "Bye kitty!"},
                            {char = "rat", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katLoud"}, {name = "lizDismayed"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }
                },
                coordinates = {row = 0, col = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = true,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }
        },
        gridSize = {rows = 1, cols = 1}
    }, {
        questTitle = "RX-003 - A Pug on a Rug",
        words = "BUG,DUG,HUG,JUG,MUG,PUG,RUG,TUG",
        startSceneCoords = {col = 0, row = 0},
        endSceneCoords = {col = 0, row = 0},
        sceneConfigs = {
            {
                name = "bee01",
                frames = {
                    {
                        dialogs = {
                            {char = "katHappy", text = "Hi kid!"},
                            {
                                char = "lizOptimistic",
                                text = "Will you play with me?"
                            }, {char = "katHappy", text = "Yes?"},
                            {char = "lizOptimistic", text = "Yay!"}
                        },
                        characters01 = {
                            {name = "katHappy"}, {name = "lizOptimistic"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "lizUnsure", text = "I see a hat."},
                            {
                                char = "katSurprised",
                                text = "I see a hat... on a mat!"
                            }, {char = "lizUnsure", text = "Tee hee hee."}
                        },
                        characters01 = {
                            {name = "katSurprised"}, {name = "lizUnsure"}
                        },
                        characters02 = {{name = "hat"}, {name = "mat"}}
                    }, {
                        dialogs = {
                            {char = "lizOptimistic", text = "I see a cat."},
                            {
                                char = "lizOptimistic",
                                text = "I see a cat... on a hat!"
                            }, {char = "katDismayed", text = "Not a cat!!!"}
                        },
                        characters01 = {
                            {name = "katDismayed"}, {name = "lizOptimistic"}
                        },
                        characters02 = {{name = "rat"}, {name = "hat"}}
                    }, {
                        dialogs = {
                            {char = "lizSurprised", text = "Hi kitty kitty..."},
                            {char = "katCringing", text = "That is not a cat!"},
                            {char = "lizSurprised", text = "Good kitty.."},
                            {char = "katCringing", text = "That is a rat!"},
                            {char = "lizSurprised", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {
                                char = "lizSurprised",
                                text = "We can pat the cat."
                            }, {char = "katCringing", text = "Not that cat!"},
                            {
                                char = "lizSurprised",
                                text = "We can chat with the cat."
                            },
                            {
                                char = "katCringing",
                                text = "Do not chat with that cat!"
                            }
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {char = "lizDismayed", text = "Bye kitty!"},
                            {char = "rat", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katLoud"}, {name = "lizDismayed"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = true,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }
        },
        gridSize = {rows = 1, cols = 1}
    }, {
        questTitle = "RX-005 - A Pig in a Wig",
        words = "BIG,DIG,FIG,JIG,PIG,RIG,WIG,ZIG",
        startSceneCoords = {col = 0, row = 0},
        endSceneCoords = {col = 0, row = 0},
        sceneConfigs = {
            {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "katHappy", text = "Hi kid!"},
                            {
                                char = "lizOptimistic",
                                text = "Will you play with me?"
                            }, {char = "katHappy", text = "Yes?"},
                            {char = "lizOptimistic", text = "Yay!"}
                        },
                        characters01 = {
                            {name = "katHappy"}, {name = "lizOptimistic"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "lizUnsure", text = "I see a hat."},
                            {
                                char = "katSurprised",
                                text = "I see a hat... on a mat!"
                            }, {char = "lizUnsure", text = "Tee hee hee."}
                        },
                        characters01 = {
                            {name = "katSurprised"}, {name = "lizUnsure"}
                        },
                        characters02 = {{name = "hat"}, {name = "mat"}}
                    }, {
                        dialogs = {
                            {char = "lizOptimistic", text = "I see a cat."},
                            {
                                char = "lizOptimistic",
                                text = "I see a cat... on a hat!"
                            }, {char = "katDismayed", text = "Not a cat!!!"}
                        },
                        characters01 = {
                            {name = "katDismayed"}, {name = "lizOptimistic"}
                        },
                        characters02 = {{name = "rat"}, {name = "hat"}}
                    }, {
                        dialogs = {
                            {char = "lizSurprised", text = "Hi kitty kitty..."},
                            {char = "katCringing", text = "That is not a cat!"},
                            {char = "lizSurprised", text = "Good kitty.."},
                            {char = "katCringing", text = "That is a rat!"},
                            {char = "lizSurprised", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {
                                char = "lizSurprised",
                                text = "We can pat the cat."
                            }, {char = "katCringing", text = "Not that cat!"},
                            {
                                char = "lizSurprised",
                                text = "We can chat with the cat."
                            },
                            {
                                char = "katCringing",
                                text = "Do not chat with that cat!"
                            }
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {char = "lizDismayed", text = "Bye kitty!"},
                            {char = "rat", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katLoud"}, {name = "lizDismayed"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = true,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }
        },
        gridSize = {rows = 1, cols = 1}
    }, {
        questTitle = "RX-006 - A Map in my Cap",
        words = "CAP,GAP,LAP,MAP,NAP,RAP,SAP,TAP,ZAP",
        startSceneCoords = {col = 0, row = 0},
        endSceneCoords = {col = 0, row = 0},
        sceneConfigs = {
            {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {char = "katHappy", text = "Hi kid!"},
                            {
                                char = "lizOptimistic",
                                text = "Will you play with me?"
                            }, {char = "katHappy", text = "Yes?"},
                            {char = "lizOptimistic", text = "Yay!"}
                        },
                        characters01 = {
                            {name = "katHappy"}, {name = "lizOptimistic"}
                        },
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "lizUnsure", text = "I see a hat."},
                            {
                                char = "katSurprised",
                                text = "I see a hat... on a mat!"
                            }, {char = "lizUnsure", text = "Tee hee hee."}
                        },
                        characters01 = {
                            {name = "katSurprised"}, {name = "lizUnsure"}
                        },
                        characters02 = {{name = "hat"}, {name = "mat"}}
                    }, {
                        dialogs = {
                            {char = "lizOptimistic", text = "I see a cat."},
                            {
                                char = "lizOptimistic",
                                text = "I see a cat... on a hat!"
                            }, {char = "katDismayed", text = "Not a cat!!!"}
                        },
                        characters01 = {
                            {name = "katDismayed"}, {name = "lizOptimistic"}
                        },
                        characters02 = {{name = "rat"}, {name = "hat"}}
                    }, {
                        dialogs = {
                            {char = "lizSurprised", text = "Hi kitty kitty..."},
                            {char = "katCringing", text = "That is not a cat!"},
                            {char = "lizSurprised", text = "Good kitty.."},
                            {char = "katCringing", text = "That is a rat!"},
                            {char = "lizSurprised", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {
                                char = "lizSurprised",
                                text = "We can pat the cat."
                            }, {char = "katCringing", text = "Not that cat!"},
                            {
                                char = "lizSurprised",
                                text = "We can chat with the cat."
                            },
                            {
                                char = "katCringing",
                                text = "Do not chat with that cat!"
                            }
                        },
                        characters01 = {
                            {name = "katCringing"}, {name = "lizSurprised"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }, {
                        dialogs = {
                            {char = "lizDismayed", text = "Bye kitty!"},
                            {char = "rat", text = "Meow."}
                        },
                        characters01 = {
                            {name = "katLoud"}, {name = "lizDismayed"}
                        },
                        characters02 = {{name = "rat"}, {name = "rat"}}
                    }
                },
                coordinates = {col = 0, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                isEndScene = true,
                isStartScene = true,
                maxRow = 0,
                maxCol = 0
            }
        },
        gridSize = {rows = 1, cols = 1}
    }
}
return module

