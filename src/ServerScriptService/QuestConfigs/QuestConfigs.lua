local module = {}

module.questConfigs = {
    {
        {
            name = "spaceShip01",
            frames = {
                {
                    dialogs = {
                        {
                            char = "princess_alibera",
                            text = "Uuuuughhhh.... I'm bored."
                        },
                        {
                            char = "squirrel01",
                            text = "Why don't we go on an adventure!"
                        }, {
                            char = "bat",
                            text = "I know you guys can't fly, but why don't we fly to the moon?"
                        },
                        {
                            char = "squirrel01",
                            text = "As long as there won't be any space giants"
                        },
                        {
                            char = "princess_alibera",
                            text = "...and of course, space monsters..."
                        }
                    },
                    characters01 = {
                        {name = "squirrel01"}, {name = "princess_alibera"}
                    },
                    characters02 = {{name = "bat"}}
                }, {
                    dialogs = {
                        {
                            char = "bat",
                            text = "Cool, as long as you guys don't lose me!"
                        }, {char = "squirrel01", text = ""},
                        {char = "princess_alibera", text = ""},
                        {char = "squirrel01", text = ""}
                    },
                    characters01 = {
                        {name = "squirrel01"}, {name = "princess_alibera"}
                    },
                    characters02 = {{name = "bat"}}
                }
            },
            coordinates = {col = 0, row = 0},
            maxRow = 0,
            maxCol = 0
        }, {
            name = "solarSystem01",
            frames = {
                {
                    dialogs = {
                        {char = "princess_alibera", text = ""},
                        {char = "squirrel01", text = ""},
                        {char = "bat", text = ""},
                        {char = "squirrel01", text = ""},
                        {
                            char = "princess_alibera",
                            text = "...and of course, space monsters..."
                        }
                    },
                    characters01 = {
                        {name = "squirrel01"}, {name = "princess_alibera"}
                    },
                    characters02 = {
                        {name = "bat"}, {name = "monster"},
                        {name = "boomALoo01"}
                    }
                }
            },
            coordinates = {col = 1, row = 0},
            maxRow = 0,
            maxCol = 1
        }
    }
}

return module
