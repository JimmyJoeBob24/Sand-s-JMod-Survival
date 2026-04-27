//InitNetVars
util.AddNetworkString("jshop_bought")
util.AddNetworkString("jshop_sell")
util.AddNetworkString("brokebitch")
util.AddNetworkString("dumbfuck")
//SV
include("server/sv_shopsec.lua")
include("server/sv_jmod_sync.lua")
//Shared
include("shared.lua")
include("globals/sh_convars.lua")
//CSS
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("menu/hud.lua")
AddCSLuaFile("menu/fonts.lua")
AddCSLuaFile("globals/sh_shoptable.lua")
AddCSLuaFile("menu/itemshop.lua")

function dropmoney(ply, amount)
    local ent = ents.Create("js_money")
    if IsValid(ent) then
        ent:SetPos(ply:GetPos() + Vector(0, 0, 50))
        ent:SetAmount(amount)
        ent:Spawn()
        ent:Activate()
    end
end

--Gotta rework this fuckass money system
function GM:PlayerDeath(victim, inflictor, attacker)
    dropmoney(victim, victim:GetNetworkedInt("Balance"))
    victim:SetNetworkedInt("Balance", 0)

    local randomint = math.random(25, 250)
    if attacker == victim then return end -- No money from suicides

    if IsValid(attacker) and attacker:IsPlayer() then
        attacker:SetNetworkedInt("Balance", attacker:GetNetworkedInt("Balance") + randomint)
    end
end

function GM:OnNPCkilled(victim, inflictor, attacker)
    local randomint = math.random(50, 245)
    if IsValid(attacker) and attacker:IsPlayer() then
        attacker:SetNetworkedInt("Balance", attacker:GetNetworkedInt("Balance") + randomint)
    end
end

function spawnAndAdd(class, count)
    for i = 1, count do
        local ent = ents.Create(class)
        if IsValid(ent) then
            local offset = Vector(math.random(-20, 20), math.random(-20, 20), 50)
            ent:SetPos(ply:GetPos() + offset)
            ent:Spawn()
            ent:Activate()
            JMod.SetEZowner(ent, ply)

            local added = JMod.AddToInventory(ply, ent, false)
            if not added then
                ent:Remove()
            end
        end
    end
end

hook.Add("EntityTakeDamage", "CapHealth", function(target, dmginfo) --Doesnt work and i dont wanna bother fixing it IM EEPY and TIRED
    if target:IsPlayer() then
        local maxHealth = 115
        if target:Health() > maxHealth then
            target:SetHealth(maxHealth)
        end
    end
end)

function GM:PlayerSpawn(ply)
    ply:Give("wep_jack_gmod_hands")
    ply:SetCrouchedWalkSpeed(0.4)
    ply:SetSlowWalkSpeed(100)
    ply:SetWalkSpeed(200)
    ply:SetRunSpeed(350)
    ply:SetupHands()
    ply:SetModel("models/player/arctic.mdl")

    //Kits CheckVars    
    if GetConVar("kitstart"):GetBool() then
        ply:Give("wep_jack_gmod_ezaxe")
        ply:Give("wep_jack_gmod_ezpickaxe")
    end
    //Toolbox CheckVar
    if GetConVar("toolsbool"):GetBool() then
        ply:Give("wep_jack_gmod_eztoolbox")
        spawnAndAdd("ent_jack_gmod_ezparts", 50)
    end
end