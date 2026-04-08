include("globals/sh_shoptable.lua")

net.Receive("jshop_bought", function(len, ply)
    local categoryName = net.ReadString()
    local id = net.ReadInt(32)
    local shoprejects = {
        "Broke Bitch.",
        "i don't Give no charity, NOW GET LOST°",
        "U G0t No mOnZ >:3",
        "No Money, No Service",
        "You Can't Afford this Pal",
        "Not Enough Cash ! Stranger...",
        "You Ain't got enough Dough",
    }
    local randomss = math.random(1, #shoprejects)

    if not SHOP[categoryName] then
        ply:ChatPrint("This item category doesn't exist... Weird Uh?")
        return
    end

    local item = SHOP[categoryName][id]

    if not item then
        ply:ChatPrint("This Item doesn't exist... Weird Uh?")
        return
    end

    local balance = ply:GetNWInt("Balance", 0)

    if balance < item.price then
        ply:ChatPrint(shoprejects[randomss])
        return
    end

    ply:SetNWInt("Balance", balance - item.price)
    ply:Give(item.classname)
end)

