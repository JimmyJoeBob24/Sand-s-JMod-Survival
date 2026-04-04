SHOP = SHOP or {} 
backdrop = Color(10, 10, 10, 210) 
ButtonBuy = Color(50, 25, 0, 225)
SHOP.items = {
    //,
}

SHOP.machines = {
    {
        name = "Crafting Table",
        classname = "ent_jack_gmod_ezprimitivebench",
        price = 1250,
        description = "Saves You The Trouble of Making another one!",
        icon = "entities/ent_jack_gmod_ezprimitivebench.png",
    }
}
SHOP.tools = {
    {
        name = "ToolBox",
        classname = "wep_jack_gmod_eztoolbox",
        price = 1500,
        description = "Romania Simulator 2011",
        icon = "entities/ent_jack_gmod_eztoolbox.png",
    }, 
    {
        name = "Axe",
        classname = "wep_jack_gmod_ezaxe",
        price = 150,
        description = "All that Wood aint Gunna Chop Itself!",
        icon = "entities/ent_jack_gmod_ezaxe.png",
    },
    {
        name = "Pick-Axe",
        classname = "wep_jack_gmod_ezpickaxe",
        price = 500,
        description = "DIGGY, DIGGY HOLE!",
        icon = "entities/ent_jack_gmod_ezpickaxe.png",
    },
}
SHOP.meds = {
    {
        name = "IFAK Packet",
        classname = "ent_jack_gmod_ezifakpacket",
        price = 150,
        description = "YEOUCH!",
        icon = "entities/ent_jack_gmod_ezifakpacket.png",
    },    
}
SHOP.guns = {
    --Hewo 0w0
}