//InitNetVars
util.AddNetworkString("jshop_bought")
//SV
include("sv_shopsec.lua")
//Shared
include("shared.lua")
include("globals/sh_convars.lua")
//CSS
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("menu/hud.lua")
AddCSLuaFile("menu/fonts.lua")
AddCSLuaFile("globals/sh_shoptable.lua")
AddCSLuaFile("menu/itemshop.lua")
--Gotta rework this fuckass monty system
function GM:PlayerDeath(victim, inflictor, attacker)
    local randomint = math.random(25, 250)
    if IsValid(attacker) and attacker:IsPlayer() then
        attacker:SetNetworkedInt("Balance", attacker:GetNetworkedInt("Balance") + randomint)
    end
end

function GM:OnNPCkilled(victim, inflictor, attacker)
    local randomint = math.random(1, 45)
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

function GM:PlayerSpawn(ply)
    --Player Init Vars
    ply:Give("wep_jack_gmod_hands")
    ply:SetCrouchedWalkSpeed(0.4)
    ply:SetSlowWalkSpeed(100)
    ply:SetWalkSpeed(200)
    ply:SetRunSpeed(300)
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
    //StartMoney
    local bigbucks = GetConVar("bigbucks"):GetInt()
    if bigbucks > 0 then
        local current = ply:GetNWInt("Balance", 0) 
        ply:SetNWInt("Balance", current + bigbucks)
    end
end