net.Receive("jshop_sell", function(len, ply) -- This FUCKASS Function Robbed me 2 Hours Of my precius Sleep Schedule
    local categoryName = net.ReadString()
    local id = net.ReadInt(32)
    local categoryTable = SHOP.Categories[categoryName]
    if not categoryTable or not categoryTable[id] then return end

    local item = categoryTable[id]
    local sellPrice = math.floor(item.price * 0.5)
    local weapon = ply:GetWeapon(item.classname)
    local targetEnt = nil 
    if IsValid(weapon) then
        targetEnt = weapon
        weapon:Remove()
    else
        for _, e in pairs(ents.FindInSphere(ply:GetPos(), 100)) do
            if IsValid(e) and e:GetClass() == item.classname then
                targetEnt = e
                break
            end
        end
    end

    if IsValid(targetEnt) then
        local currentBalance = ply:GetNWInt("Balance", 0)
        ply:SetNWInt("Balance", currentBalance + sellPrice)
        if targetEnt:IsWeapon() and targetEnt:GetOwner() == ply then
            weapon:Remove()
        else
            targetEnt:Remove() 
        end
    else
        ply:PrintMessage(4, "You need to be holding or near the Item to sell it")
        net.Start("dumbfuck")
        net.Send(ply)
    end
end)

-- this is a mess held together by duct tape, hopes and dreams
net.Receive("jshop_bought", function(len, ply)
    local categoryName = net.ReadString()
    local id = net.ReadInt(32)
    local categoryTable = SHOP.Categories[categoryName]
    if not categoryTable or not categoryTable[id] then return end
    local item = categoryTable[id]
    local balance = ply:GetNWInt("Balance", 0)
    if balance < item.price then
        net.Start("brokebitch")
        net.Send(ply)
        ply:PrintMessage(4, "You can't afford this")
        return
    end
    ply:SetNWInt("Balance", balance - item.price)

    local ent = ents.Create(item.classname)
    if IsValid(ent) then
        local forward = ply:GetForward()
        local spawnPos = ply:GetShootPos() + (forward * 60)
        local tr = util.TraceLine({
            start = ply:GetShootPos(),
            endpos = spawnPos,
            filter = ply
        })
        local finalPos = tr.Hit and (tr.HitPos - forward * 10) or spawnPos

        ent:SetPos(finalPos)
        ent:SetAngles(Angle(0, ply:GetAngles().y, 0))
        ent:Spawn()
        ent:Activate()
        if item.units and ent.SetResource then
            ent:SetResource(item.units)
        end
        ent:Use(ply, ply, USE_ON, 0)
        local phys = ent:GetPhysicsObject()
        if IsValid(phys) then phys:Wake() end
    end
end)