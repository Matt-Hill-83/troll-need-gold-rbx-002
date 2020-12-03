local module = {}

module.questConfigs = {
    {
        questTitle = "--- rbx-002",
        startSceneCoords = {col = 0, row = 1},
        endSceneCoords = {col = 1, row = 0},
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."}
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {{name = "robby01"}}
                    }
                },
                coordinates = {col = 0, row = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 0
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."}
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {{name = "robby01"}}
                    }
                },
                coordinates = {col = 1, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 1
            }, {
                name = "cave",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."},
                            {
                                char = "trollKing01",
                                text = "Mwa...  ha-ha ha-ha ha!!!"
                            }
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {
                            {name = "robby01"}, {name = "trollKing01"}
                        }
                    }
                },
                coordinates = {col = 1, row = 0},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 1
            }
        },
        gridSize = {rows = 2, cols = 2}
    }, {
        questTitle = "--- rbx-001",
        startSceneCoords = {col = 0, row = 1},
        endSceneCoords = {col = 1, row = 0},
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "Did you see the space ship?"},
                            {char = "liz2", text = "I am new here..."},
                            {char = "dog01", text = "I like bees"}
                        },
                        characters01 = {{name = "dog01"}, {name = "kat"}},
                        characters02 = {{name = "liz2"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "yay bees"},
                            {char = "dog01", text = "Bees are fun"},
                            {char = "liz2", text = "We can play with bees!"}
                        },
                        characters01 = {{name = "dog01"}, {name = "kat"}},
                        characters02 = {{name = "liz2"}}
                    }
                },
                coordinates = {col = 0, row = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 0
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."}
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {{name = "robby01"}}
                    }
                },
                coordinates = {col = 1, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 1
            }, {
                name = "cave",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."},
                            {
                                char = "trollKing01",
                                text = "Mwa...  ha-ha ha-ha ha!!!"
                            }
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {
                            {name = "robby01"}, {name = "trollKing01"}
                        }
                    }
                },
                coordinates = {col = 1, row = 0},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 1
            }
        },
        gridSize = {rows = 2, cols = 2}
    }, {
        questTitle = "--- rbx-003",
        startSceneCoords = {row = 0, col = 0},
        endSceneCoords = {col = 2, row = 0},
        sceneConfigs = {
            {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."}
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {{name = "robby01"}}
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
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."}
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {{name = "robby01"}}
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
                name = "cave",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."},
                            {
                                char = "trollKing01",
                                text = "Mwa...  ha-ha ha-ha ha!!!"
                            }
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {
                            {name = "robby01"}, {name = "trollKing01"}
                        }
                    }
                },
                coordinates = {col = 2, row = 0},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 2
            }
        },
        gridSize = {rows = 1, cols = 3}
    }, {
        questTitle = "--- rbx-004",
        startSceneCoords = {col = 0, row = 1},
        endSceneCoords = {row = 0, col = 1},
        sceneConfigs = {
            {
                name = "cave",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."},
                            {
                                char = "trollKing01",
                                text = "Mwa...  ha-ha ha-ha ha!!!"
                            }
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {
                            {name = "robby01"}, {name = "trollKing01"}
                        }
                    }
                },
                coordinates = {row = 0, col = 1},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "home",
                frames = {
                    {
                        dialogs = {
                            {char = "kat", text = "Did you see the space ship?"},
                            {char = "liz2", text = "I am new here..."},
                            {char = "dog01", text = "I like bees"}
                        },
                        characters01 = {{name = "dog01"}, {name = "kat"}},
                        characters02 = {{name = "liz2"}}
                    }, {
                        dialogs = {
                            {char = "kat", text = "yay bees"},
                            {char = "dog01", text = "Bees are fun"},
                            {char = "liz2", text = "We can play with bees!"}
                        },
                        characters01 = {{name = "dog01"}, {name = "kat"}},
                        characters02 = {{name = "liz2"}}
                    }
                },
                coordinates = {col = 0, row = 1},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 1
            }, {
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "dog01",
                                text = "Did you see the space ship?"
                            }, {char = "robby01", text = "I am new here..."}
                        },
                        characters01 = {{name = "dog01"}},
                        characters02 = {{name = "robby01"}}
                    }
                },
                coordinates = {col = 1, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = true,
                maxRow = 1,
                maxCol = 1
            }
        },
        gridSize = {rows = 2, cols = 2}
    }
}
return module
