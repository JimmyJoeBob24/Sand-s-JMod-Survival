GM.Name = "Sand's JModSurvival"
GM.Author = "SandManMcCoy"
GM.Email = "discord_sandmanmcoy"
DeriveGamemode("sandbox")

if SERVER then
    AddCSLuaFile("globals/sh_shoptable.lua")
end

include("globals/sh_shoptable.lua")

if SERVER then
    AddCSLuaFile("menu/itemshop.lua")
end

include("globals/sh_convars.lua")



function GM:Initialize(ply)
	--old timer alegedly doesnt know how to use init functions on shared
end    
	
function inventory( ply )
	ply:ConCommand( "jmod_ez_inv" )
end
hook.Add("ShowSpare1", "Inventory", inventory)

function scavenge( ply )
	ply:ConCommand( "jmod_ez_scrounge" )
end
hook.Add("ShowSpare2", "scavenge", scavenge)

function GM:PlayerNoClip()
    return false
end