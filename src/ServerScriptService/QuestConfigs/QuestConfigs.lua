local module = {}

module.questConfigs = {
    {
        questTitle = "020 - Rap Battle at Troll Cave",
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
                        characters02 = {{name = "katieKooper01"}}
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
                            {name = "troll02"}
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
                            {name = "troll02"}
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
                            {name = "troll02"}
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
                            {name = "troll02"}
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
                            {name = "troll02"}
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
                            {name = "troll02"}
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
                            {name = "troll02"}
                        }
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
            }
        },
        gridSize = {rows = 1, cols = 4}
    }
}
return module
