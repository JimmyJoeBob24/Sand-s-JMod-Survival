SHOP = SHOP or {} 
backdrop = Color(10, 10, 10, 210) 
ButtonBuy = Color(50, 25, 0, 225)

SHOP.Resources = {
    {
        name = "Ammo.",
        classname = "ent_jack_gmod_ezammo",
        price = 500,
        description = "25 Units of Ammo.",
        icon = "ez_resource_icons/ammo.png",
        units = 25,
    },
    {
        name = "Food",
        classname = "ent_jack_gmod_eznutrients",
        price = 500,
        description = "25 Units of Food.",
        icon = "ez_resource_icons/nutrients.png",
        units = 125,
    },
    {
        name = "Water",
        classname = "ent_jack_gmod_ezwater",
        price = 200,
        description = "100 Units of Water.",
        icon = "ez_resource_icons/water.png",
        units = 100,
    },
    {
        name = "Battery",
        classname = "ent_jack_gmod_ezbattery",
        price = 100,
        description = "A Battery Holding 25 Units of Power.",
        icon = "ez_resource_icons/power.png",
        units = 25,
    },
    {
        name = "Copper Ingots",
        classname = "ent_jack_gmod_ezcopper",
        price = 325,
        description = "35 Copper Ingots.",
        icon = "ez_resource_icons/copper.png",
        units = 35,
    },
    {
        name = "URANIUM",
        classname = "ent_jack_gmod_ezuranium",
        price = 1000,
        description = "10 Units of Uranium.",
        icon = "ez_resource_icons/uranium.png",
        units = 10,
    },
    {
        name = "Steel Ingots",
        classname = "ent_jack_gmod_ezsteel",
        price = 750,
        description = "15 Steel Ingots.",
        icon = "ez_resource_icons/steel.png",
        units = 15,
    },
    {
        name = "Lead Ingots",
        classname = "ent_jack_gmod_ezlead",
        price = 400,
        description = "20 Lead Ingots.",
        icon = "ez_resource_icons/lead.png",
        units = 20,
    },
}

SHOP.Util = {
    {
        name = "Respirator",
        classname = "ent_jack_gmod_ezarmor_respirator",
        price = 200,
        description = "Protects the user from Toxic Gasses",
        icon = "entities/ent_jack_gmod_ezarmor_respirator.png",
    },
    {
        name = "Gas Mask",
        classname = "ent_jack_gmod_ezarmor_gasmask",
        price = 7500,
        description = "Protects the user from Toxic Gasses Electric Boogaloo",
        icon = "entities/ent_jack_gmod_ezarmor_gasmask.png",
    },
    {
        name = "Backpack",
        classname = "ent_jack_gmod_ezarmor_backpack",
        price = 100,
        description = "Increases the user's carrying capacity",
        icon = "entities/ent_jack_gmod_ezarmor_backpack.png",
    },
}

SHOP.Machines = {
    {
        name = "Crafting Table",
        classname = "ent_jack_gmod_ezprimitivebench",
        price = 250,
        description = "If You're Too Lazy to Make One just Buy it.",
        icon = "entities/ent_jack_gmod_ezprimitivebench.png",
    }
}

SHOP.Tools = {
    {
        name = "Bucket",
        classname = "ent_jack_gmod_ezbucket",
        price = 250,
        description = "This is a Bucket... Dear god",
        icon = "entities/ent_jack_gmod_ezbucket.png",
    },
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
        price = 50,
        description = "Chop Chop",
        icon = "entities/ent_jack_gmod_ezaxe.png",
    },
    {
        name = "Pick-Axe",
        classname = "wep_jack_gmod_ezpickaxe",
        price = 100,
        description = "Minceraft",
        icon = "entities/ent_jack_gmod_ezpickaxe.png",
    },
    {
        name = "Shovel",
        classname = "wep_jack_gmod_ezshovel",
        price = 25,
        description = " Shovel :3",
        icon = "entities/ent_jack_gmod_ezshovel.png",
    },
    {
        name = "Spade",
        classname = "wep_jack_gmod_ezspade",
        price = 30,
        description = "Shovel but Pointy",
        icon = "entities/ent_jack_gmod_ezspade.png",
    },
}

SHOP.Medical = {
    {
        name = "IFAK Packet",
        classname = "ent_jack_gmod_ezifakpacket",
        price = 150,
        description = " ",
        icon = "entities/ent_jack_gmod_ezifakpacket.png",
    },
    {
        name = "Medkit",
        classname = "ent_jack_gmod_ezmedkit",
        price = 500,
        description = "Ahh! I Need A Medic Bag",
        icon = "entities/ent_jack_gmod_ezmedkit.png",
    }, 
}

SHOP.Weapons = {
    {
        name = "The Executioner",
        classname = "ent_jack_gmod_ezweapon_shotrevolver",
        price = 12500,
        description = "Expensive, And will Blow a hole throug Anyone",
        icon = "entities/ent_jack_gmod_ezweapon_shotrevolver.png",
    },
    {
        name = "Old Bastard",
        classname = "ent_jack_gmod_ezweapon_cabr",
        price = 1500,
        description = "Cheap,Useless And Slow.",
        icon = "entities/ent_jack_gmod_ezweapon_cabr.png",
    }
}

SHOP.Armor = {
    {
        name = "Kevlar Vest",
        classname = "ent_jack_gmod_ezarmor_ltorso",
        price = 5000,
        description = " ",
        icon = "entities/ent_jack_gmod_ezarmor_ltorso.png",
    }
}

SHOP.Categories = {
    ["Items"] = SHOP.Util,
    ["Machines"] = SHOP.Machines,
    ["Tools"] = SHOP.Tools,
    ["Medical"] = SHOP.Medical,
    ["Weapons"] = SHOP.Weapons,
    ["Armor"] = SHOP.Armor,
    ["Resources"] = SHOP.Resources,
}