local module = {}

module.questConfigs = {
    {
        questTitle = "330 Merlinda The Fairy Princess Part3",
        sceneConfigs = {
            {
                name = "swing",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Rori, I'm gonna get real with you."
                            },
                            {
                                char = "rori",
                                text = "We must free the dragons from Maldred's evil spell!"
                            }, {
                                char = "kat",
                                text = "Rori, do you like sparkles and glitter beyond your wildest dreams?"
                            },
                            {
                                char = "rori",
                                text = "Does it shimmer with the power of the dragon stone?"
                            },
                            {char = "kat", text = "Oh yes... Oh yes it does..."},
                            {
                                char = "kat",
                                text = "Now, will you help us steal the dress from the dragon Watta-Lee-Achee?"
                            }, {char = "rori", text = "What class?"},
                            {
                                char = "liz2",
                                text = "K2. No, wait... K1.  Um...  both?"
                            },
                            {
                                char = "rori",
                                text = "I wasn't asking your kindergarten class!"
                            },
                            {char = "rori", text = "What class dragon is it?"},
                            {char = "liz2", text = "Oh... yeah right."},
                            {char = "rori", text = "Never mind."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "rori"}, {name = "vulcan01"}}
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
                name = "lake",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "rori",
                                text = "I think Watta-Lee-Achee is a class 2 lava dragon with a minor healing enchantment."
                            }, {char = "liz2", text = "Doo-Da-Lee-Doo"},
                            {char = "rori", text = "What?"},
                            {char = "kat", text = "Ignore her..."},
                            {
                                char = "rori",
                                text = "Vulcan and I will battle Watta-Lee-Achee..."
                            },
                            {
                                char = "rori",
                                text = "...and free the Dress of Atacama once and for all!!!"
                            }, {char = "kat", text = "Thanks Rori!"},
                            {
                                char = "rori",
                                text = "I will join you on your Quest for the Dress!"
                            }, {char = "liz2", text = "thanks Rori!"},
                            {char = "rori", text = "I will join you..."},
                            {char = "rori", text = "...on your..."},
                            {char = "rori", text = "...Dress Quest!"},
                            {char = "liz2", text = "Doo-Da-Lee-Doo"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "rori"}, {name = "vulcan01"}}
                    }
                },
                coordinates = {col = 1, row = 0},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 1
            }
        },
        gridSize = {rows = 1, cols = 2}
    }, {
        questTitle = "200 - Dennis the Menace",
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "dog01", text = "Yo, what’s up Kat?"},
                            {
                                char = "kat",
                                text = "Nothin’ dog. Just chillin with my girl Liz."
                            }, {
                                char = "dog01",
                                text = "Sweet! Keep it Fresh Kat! I gotta bounce. I’ll catch you on the flip!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "dog01"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Laters!"},
                            {char = "liz2", text = "Bye Bye Pete! Hee Hee!"}, {
                                char = "liz2",
                                text = "Wow Kat, where did you learn all those cool things to say?"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Cool right? It’s called slang."
                            }, {char = "liz2", text = "Wow! I want to learn!"},
                            {
                                char = "liz2",
                                text = "I used to ride the bus with this second grader who knew like a million slangs. Like literally."
                            }, {char = "liz2", text = "Cooooool!!!!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "He’d say Kat, I like you, but sometimes, think you are a couple sandwiches short of a picnic?"
                            },
                            {
                                char = "liz2",
                                text = "Cooooool! What does that mean?"
                            },
                            {
                                char = "liz2",
                                text = "I dunno, but I say it all the time now."
                            },
                            {
                                char = "liz2",
                                text = "Wait, you know a second grader?"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
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
                            {
                                char = "kat",
                                text = "Yeah, this kid Dennis. He’s hilarious."
                            }, {
                                char = "kat",
                                text = "This one time he made me laugh so hard chocolate milk sprayed out of my nose."
                            },
                            {
                                char = "liz2",
                                text = "Wait.. Hold your horses. Back up!"
                            }, {char = "liz2", text = "What?"}, {
                                char = "liz2",
                                text = "Are you talking about Dennis, as in, Dennis the Menace?"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "blank"}, {name = "blank"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Yeah, that’s him."},
                            {
                                char = "liz2",
                                text = "You know Dennis the Menace?"
                            }, {
                                char = "liz2",
                                text = "The kid who runs up slides the wrong way and has a slingshot hanging out of his back pocket?"
                            }, {
                                char = "kat",
                                text = "Yeah, totally. He’s super chill. We should go hang out with him."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "blank"}, {name = "blank"}}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "He is like the coolest kid in the Magic Forest!"
                            }, {char = "kat", text = "For sure."}, {
                                char = "liz2",
                                text = "Zombie said his parents grounded him until he turns 13!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "blank"}, {name = "blank"}}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Wait, What does grounded mean?"
                            }, {
                                char = "liz2",
                                text = "Oh sorry. Grounded is when you get in super big trouble and your parents don’t let you out of your room for a week!"
                            },
                            {
                                char = "kat",
                                text = "Oh that. Yeah, he’s definitely grounded."
                            }, {
                                char = "kat",
                                text = "But he sneaks out his bedroom window during nap and plays at the playground."
                            }, {char = "liz2", text = "Wow!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "blank"}, {name = "blank"}}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Come on, let’s go see if he is at the slide."
                            }, {char = "liz2", text = "Fine with me."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {{name = "blank"}, {name = "blank"}}
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
                name = "slide",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "Hi Dennis!"},
                            {
                                char = "dennisTheMenace",
                                text = "Oh hi Kat! What are you up to?"
                            }, {char = "liz2", text = "Just some trouble."}, {
                                char = "dennisTheMenace",
                                text = "Count me in. But keep an eye out for Mr. Wilson."
                            }, {
                                char = "dennisTheMenace",
                                text = "He's not going to be too happy when he finds out what happened to his new shoes!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {
                            {name = "dennisTheMenace"}, {name = "blank"},
                            {name = "dennisTheMenace"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "What happened to his new shoes?"
                            }, {
                                char = "dennisTheMenace",
                                text = "You don't even want to know. Where's the fun at?"
                            }, {
                                char = "kat",
                                text = "Well, there's this new girl named Rori. She needs a place to hide her dragon."
                            },
                            {
                                char = "dennisTheMenace",
                                text = "Well now you are talking my language."
                            }, {
                                char = "dennisTheMenace",
                                text = "Have I ever told you about Mr. Wilson's shed?"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {
                            {name = "dennisTheMenace"}, {name = "blank"},
                            {name = "dennisTheMenace"}
                        }
                    }, {
                        dialogs = {
                            {char = "kat", text = "Keep talking..."}, {
                                char = "dennisTheMenace",
                                text = "It's dustier than a book of manners in a schoolyard, but it might to the trick."
                            },
                            {
                                char = "kat",
                                text = "We will pass that along to Rori."
                            }, {
                                char = "liz2",
                                text = "Dennis, do you have a piece of paper and a pin? Rori said to pin a note to a tree."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {
                            {name = "dennisTheMenace"}, {name = "blank"},
                            {name = "dennisTheMenace"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "dennisTheMenace",
                                text = "I have a ball of lint and this thumb tack, but I'm saving it to make a surprise for Mr. Wilson."
                            }, {char = "liz2", text = "Lucky him!"}, {
                                char = "dennisTheMenace",
                                text = "Yeah, he must have been born under a 4 leaf clover."
                            },
                            {
                                char = "liz2",
                                text = "See you later Dennis the Menace! Hee Hee Hee!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {
                            {name = "dennisTheMenace"}, {name = "blank"},
                            {name = "dennisTheMenace"}
                        }
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
