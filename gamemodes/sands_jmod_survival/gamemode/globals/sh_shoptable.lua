SHOP = SHOP or {} 
backdrop = Color(10, 10, 10, 210) 
ButtonBuy = Color(50, 25, 0, 225)
SHOP.items = {
    {
        name = "Oil Lantern",
        classname = "ent_jack_gmod_fuellantern",
        price = 500,
        description = "Look ma' Im in Outlast!",
    },
    {
        name = "Bucket",
        classname = "ent_jack_gmod_ezbucket",
        price = 250,
        description = "This is a Bucket... Dear god",
    },
    {
        name = "Respirator",
        classname = "ent_jack_gmod_ezarmor_respirator",
        price = 5200,
        description = "You'll Thank Me later When you don't Get Lung Cancer.",
        icon = "entities/ent_jack_gmod_ezarmor_respirator.png",
    },
    {
        name = "Gas Mask",
        classname = "ent_jack_gmod_ezarmor_gasmask",
        price = 7500,
        description = "I Think this is A bit too Overkill...",
        icon = "entities/ent_jack_gmod_ezarmor_gasmask.png",
    },
    {
        name = "Backpack",
        classname = "ent_jack_gmod_ezarmor_backpack",
        price = 2500,
        description = "I ran Out of Sarcastic Comments...",
        icon = "entities/ent_jack_gmod_ezarmor_backpack.png",
    }
}

SHOP.Machines = {
    {
        name = "Crafting Table",
        classname = "ent_jack_gmod_ezprimitivebench",
        price = 1250,
        description = "Saves You The Trouble of Making another one!",
        icon = "entities/ent_jack_gmod_ezprimitivebench.png",
    }
}
SHOP.Tools = {
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
SHOP.Medical = {
    {
        name = "IFAK Packet",
        classname = "ent_jack_gmod_ezifakpacket",
        price = 150,
        description = "YEOUCH!",
        icon = "entities/ent_jack_gmod_ezifakpacket.png",
    },
    {
        name = "Medkit",
        classname = "ent_jack_gmod_ezmedkit",
        price = 500,
        description = "The Perfect excuse for Pricking Yourself with a Needle You found in a Dumpster!",
        icon = "entities/ent_jack_gmod_ezmedkit.png",
    }, 
}
SHOP.Weapons = {
    {
        name = "The Executioner",
        classname = "ent_jack_gmod_ezweapon_shotrevolver",
        price = 12500,
        description = "This Lil' Fella Is Chambered in 28 Gauge",
        icon = "entities/ent_jack_gmod_ezweapon_shotrevolver.png",
    },
    {
        name = "Old Bastard",
        classname = "ent_jack_gmod_ezweapon_cabr",
        price = 1500,
        description = "This is a Good Old-Fashioned Cap & Ball Revolver.",
        icon = "entities/ent_jack_gmod_ezweapon_cabr.png",
    }
}

SHOP.Armor = {
    {
        name = "Kevlar Vest",
        classname = "ent_jack_gmod_ezarmor_ltorso",
        price = 5000,
        description = "Is A Bulletproof Vest, What more do you want from me?",
        icon = "entities/ent_jack_gmod_ezarmor_ltorso.png",
    }
}