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
    }, {
        questTitle = "010 - Troll So Sad",
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
                        characters02 = {}
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
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "I see a goat."},
                            {char = "liz2", text = "I see a goat... in a boat!"},
                            {char = "kat", text = "Oh my gosh Kat! Turn six!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "kat", text = "Really Liz?"}, {
                                char = "kat",
                                text = "Are you seriously asking me why the Troll runs around yelling= 'TROLL NEED GOLD'?"
                            }, {char = "liz2", text = "Yes!"},
                            {char = "kat", text = "You’re not kidding?"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
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
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "Cool!"},
                            {char = "kat", text = "No! Not cool!"},
                            {char = "kat", text = "The opposite of cool!"},
                            {char = "liz2", text = "Warm?"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
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
                        characters02 = {}
                    }
                },
                coordinates = {col = 3, row = 0},
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
                        characters02 = {{name = "troll01"}}
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
                        characters02 = {{name = "troll01"}}
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
                        characters02 = {{name = "troll01"}}
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
                        characters02 = {{name = "troll01"}}
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
        questTitle = "013 - Chocolate Milk",
        sceneConfigs = {
            {
                name = "swing",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "Wait, your parents let you drink chocolate milk?"
                            }, {char = "kat", text = "Yeah, do yours?"},
                            {
                                char = "liz2",
                                text = "Um heck no! Most certainly not!"
                            },
                            {
                                char = "liz2",
                                text = "Wait! How have you never told me this?"
                            }, {
                                char = "kat",
                                text = "I thought everyone’s parents let them drink chocolate milk."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "Oh please! My parents are like the sugar police."
                            }, {char = "kat", text = "Wow!"},
                            {
                                char = "liz2",
                                text = "Can we go over to your house and drink some?"
                            }, {
                                char = "kat",
                                text = "I wish. My big brother drank it all. He’s a total milk-hog."
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
                name = "bees",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "Oh rats! You are so lucky though! My mom says sugar rots your teeth."
                            },
                            {
                                char = "kat",
                                text = "Really? I thought that was cotton candy."
                            },
                            {
                                char = "liz2",
                                text = "Yup, she read it on the internet."
                            },
                            {
                                char = "kat",
                                text = "Oh brother! Good luck with that."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "I know. Right?"}, {
                                char = "kat",
                                text = "Hey have you ever heard of Marshmallow Fluff? My cousin Emily eats it. She showed me on Facetime."
                            },
                            {char = "liz2", text = "Sounds cool! What is it?"},
                            {
                                char = "kat",
                                text = "It’s like that Gloop that we made in summer camp."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "But you can eat it and it tastes like fairy magic."
                            },
                            {
                                char = "kat",
                                text = "You'll never want to eat real food again."
                            },
                            {char = "liz2", text = "We have to go to Boston!"},
                            {char = "kat", text = "I know! For real!"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
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
                name = "log",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Hey, do you still have that Gloop we made?"
                            }, {
                                char = "liz2",
                                text = "Sadly no. Mine grew green fuzz on it and we threw it in the compost."
                            }, {
                                char = "kat",
                                text = "Cool! That’s like something out of Zoe and Sassafras!"
                            },
                            {
                                char = "liz2",
                                text = "I know, I should have done some experiments with it."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "If you are Zoe, does that make me Sassafras?"
                            }, {
                                char = "liz2",
                                text = "Yeah, you sit on my shoulder and talk in a made up language that only kids can understand."
                            }, {
                                char = "kat",
                                text = "That’s not how Sassafrass talks. You’re thinking of Stick from TumbleLeaf."
                            }, {char = "liz2", text = "No I’m not."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
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
                name = "pool",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Well then, Pascal from Tangled."
                            }, {
                                char = "liz2",
                                text = "Uh uh. Hello? I’m six years old, I think I know my TV shows."
                            }, {
                                char = "kat",
                                text = "Oh please! I’ve watched 10 times more TV than you have."
                            },
                            {
                                char = "liz2",
                                text = "Sister, Don’t even go there! Name five Octonauts."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Oh is this what we are doing now? Fine. Bring it. Kwazii, Barnacles, Dashi, Tunip and Professor Inkling."
                            }, {
                                char = "liz2",
                                text = "Who is Kwazaii’s grandfather and where does he live?"
                            },
                            {
                                char = "kat",
                                text = "Trick question. He’s the pirate Calico Jack."
                            },
                            {
                                char = "kat",
                                text = "But no one knows if he is still alive."
                            }, {
                                char = "kat",
                                text = "Because Kwazaii’s adventure up the Amazon River was just a dream."
                            },
                            {
                                char = "liz2",
                                text = "Dang Kat! You’ve got skills!"
                            },
                            {
                                char = "liz2",
                                text = "You can really throw down TV."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
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
                name = "stump",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "kat",
                                text = "Yeah, my cousins figured the password to their mom’s ipad."
                            }, {char = "liz2", text = "What?"},
                            {
                                char = "kat",
                                text = "We watched like every show on Netflix."
                            }, {char = "liz2", text = "But....how?"},
                            {
                                char = "kat",
                                text = "Get this... her password was Emily’s birthday."
                            },
                            {
                                char = "liz2",
                                text = "Oh man! I wish I had parents like that!"
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "kat",
                                text = "I know! That’s like on page 1 of the Kid Book."
                            },
                            {
                                char = "kat",
                                text = "She must be a first time parent..."
                            }, {
                                char = "kat",
                                text = "Anyways, I’m sorry to be the one to tell you this, but Sassafrass talks like a regular normal cat."
                            }, {char = "liz2", text = "No way."},
                            {
                                char = "kat",
                                text = "He’s basically the same as Cat from Peg + Cat."
                            }, {char = "kat", text = "Or Bartleby in True."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 0, col = 4},
                showBottomPath = false,
                showRightPath = true,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 4
            }, {
                name = "waterfall",
                frames = {
                    {
                        dialogs = {
                            {char = "liz2", text = "1,2,3..."},
                            {char = "kat", text = "Hey come on let’s go!"},
                            {char = "liz2", text = "...4,5,6..."},
                            {char = "kat", text = "Yeah! What do ya know"}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {char = "liz2", text = "...7,8,9..."},
                            {char = "kat", text = "What comes next?"},
                            {
                                char = "liz2",
                                text = "10! Yeah, you’re the best!"
                            }, {char = "kat", text = "I love you Peg."},
                            {char = "liz2", text = "I love you Kat."}
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }, {
                        dialogs = {
                            {
                                char = "liz2",
                                text = "So, is it just in a regular container?"
                            }, {char = "kat", text = "What?"},
                            {char = "liz2", text = "The chocolate milk."}, {
                                char = "kat",
                                text = "Yeah, we just keep it in the fridge. Like regular milk."
                            }
                        },
                        characters01 = {{name = "kat"}, {name = "liz2"}},
                        characters02 = {}
                    }
                },
                coordinates = {row = 0, col = 5},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 5
            }
        },
        gridSize = {rows = 1, cols = 6}
    }, {
        questTitle = "222 - Missy Meow and the Mystery of the Missing Muffins",
        sceneConfigs = {
            {
                name = "donutShop01",
                frames = {
                    {
                        dialogs = {
                            {char = "missyMeow01", text = "Meet me."},
                            {char = "silica01", text = "She's Missy."},
                            {char = "missyMeow01", text = "Call me Missy Meow."},
                            {
                                char = "missyMeow01",
                                text = "If you hit me with a mystery"
                            },
                            {char = "silica01", text = "She'll figure it out."}
                        },
                        characters01 = {{name = "missyMeow01"}},
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {char = "britta01", text = "Freezer Fishy?"},
                            {char = "tj001", text = "Missing Muffins?"},
                            {
                                char = "silica01",
                                text = "She can find your kitten cousin"
                            },
                            {
                                char = "silica01",
                                text = "fifteen dozen missing muffins."
                            },
                            {
                                char = "missyMeow01",
                                text = "But I'll need to keep a couple.."
                            },
                            {
                                char = "missyMeow01",
                                text = "...for my cousin ...in case she's coming"
                            }
                        },
                        characters01 = {{name = "missyMeow01"}},
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"},
                            {name = "tj001"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "missyMeow01",
                                text = "This is Mitzy, she's my ritzy cousin"
                            },
                            {char = "mitzyMeow01", text = "They say I'm always"},
                            {char = "mitzyMeow01", text = "scratching, hissing"},
                            {
                                char = "mitzyMeow01",
                                text = "throwing fits, and fussing"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "Okay it's true. But I wish I wasn't!"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "How come all these people push my buttons?"
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "mitzyMeow01",
                                text = "My dad's always saying to stop screaming"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "Last time we were in Target"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "I latched onto his leg"
                            },
                            {char = "mitzyMeow01", text = "like a lost lemur"}
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "missyMeow01",
                                text = "\"We're not leaving!\", I sob"
                            }, {char = "mitzyMeow01", text = "And I'm heaving"},
                            {
                                char = "mitzyMeow01",
                                text = "And I'm trying to stop him"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "by bobbing and weaving"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "Dad, buy me that barbie!  Stop it! I need it!"
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "mitzyMeow01",
                                text = "And through the tears, I can see my snot leaving"
                            }, {
                                char = "mitzyMeow01",
                                text = "a giant splotch on his sleeve and it's getting all over"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "the big pink dog I caught and I'm squeezing..."
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {char = "silica01", text = "He has to buy it now!"},
                            {char = "britta01", text = "The girl's a genius"},
                            {
                                char = "silica01",
                                text = "...my gosh the details..."
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "britta01",
                                text = "So that's how she got Pinky..."
                            },
                            {char = "silica01", text = "Wowww... Just wow..."},
                            {
                                char = "britta01",
                                text = "I need to write this down."
                            },
                            {
                                char = "britta01",
                                text = "Does someone have a pen?"
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "silica01",
                                text = "just use the alphabet blocks."
                            }, {char = "britta01", text = "Oh right."}, {
                                char = "silica01",
                                text = "But you only need the blocks that spell out CRAZY..."
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "missyMeow01",
                                text = "My mom says it's all part of my process"
                            },
                            {
                                char = "missyMeow01",
                                text = "When the tears gush out of my eyes"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "Like those old creaky faucets..."
                            },
                            {
                                char = "missyMeow01",
                                text = "You mean in the art room sink?"
                            },
                            {
                                char = "mitzyMeow01",
                                text = "The one that's splattered with cartoon ink."
                            },
                            {
                                char = "britta01",
                                text = "I thought that was Barb's blue drink..."
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "missyMeow01",
                                text = "My mom says I might grow out of it."
                            },
                            {
                                char = "missyMeow01",
                                text = "So I go in my room and shout a bit."
                            },
                            {
                                char = "missyMeow01",
                                text = "Then I pout and sit."
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
                        }
                    }, {
                        dialogs = {
                            {
                                char = "missyMeow01",
                                text = "But I'm like Elsa, my powers keep increasing."
                            },
                            {
                                char = "missyMeow01",
                                text = "This recent weekend I started speaking Swedish"
                            },
                            {
                                char = "missyMeow01",
                                text = "And now my house is freakin freezing."
                            }
                        },
                        characters01 = {
                            {name = "mitzyMeow01"}, {name = "missyMeow01"}
                        },
                        characters02 = {
                            {name = "silica01"}, {name = "britta01"}
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
                name = "stump",
                frames = {
                    {
                        dialogs = {
                            {char = "goblinKing01", text = "Hi Will"},
                            {
                                char = "will01",
                                text = "Me not Will!  Me baby troll!"
                            },
                            {
                                char = "goblinKing01",
                                text = "Cool.  What is in the bag?"
                            }, {char = "will01", text = "Cup cakes!"},
                            {char = "goblinKing01", text = "I want some!"}
                        },
                        characters01 = {{name = "goblinKing01"}},
                        characters02 = {{name = "will01"}}
                    }
                },
                coordinates = {col = 1, row = 0},
                showBottomPath = true,
                showRightPath = false,
                showTopPath = false,
                showLeftPath = true,
                maxRow = 0,
                maxCol = 1
            }, {
                name = "swift01",
                frames = {
                    {
                        dialogs = {
                            {
                                char = "raven001",
                                text = "make that face again..."
                            }, {char = "britta02", text = "Goo goo gaa gaa!"},
                            {
                                char = "britta03",
                                text = "Oh man, let's go freak some people out!"
                            }
                        },
                        characters01 = {
                            {name = "raven001"}, {name = "raven002"},
                            {name = "raven003"}, {name = "raven004"}
                        },
                        characters02 = {
                            {name = "tag"}, {name = "britta03"},
                            {name = "britta04"}, {name = "britta02"}
                        }
                    }
                },
                coordinates = {col = 1, row = 1},
                showBottomPath = false,
                showRightPath = false,
                showTopPath = true,
                showLeftPath = false,
                maxRow = 1,
                maxCol = 1
            }
        },
        gridSize = {rows = 2, cols = 2}
    }
}

return module
