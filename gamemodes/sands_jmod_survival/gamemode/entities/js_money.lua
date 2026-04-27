AddCSLuaFile()
ENT.Type = "anim" 
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money Stack"
ENT.Author = "SandManMcCoy"
ENT.Category = "JMod Survival"
ENT.Contact = "Discord: SandManMcCoy | Steam: https://steamcommunity.com/id/sandmanmccoy/"
ENT.Purpose = "To test the creation of entities."
ENT.Spawnable = true

function ENT:Initialize()
	if SERVER then
	    self:SetModel( "models/props/cs_assault/Money.mdl" )
	    self:PhysicsInit( SOLID_VPHYSICS )
	    self:SetMoveType( MOVETYPE_VPHYSICS )
	    self:SetSolid( SOLID_VPHYSICS )
	    local phys = self:GetPhysicsObject()
	    if phys:IsValid()
	        phys:Wake()
	    end
	end
end

if not CLIENT then return end

function ENT:Draw()
    self:DrawModel()
end

function GM:PlayerUse(ply, ent)
    if ent:GetClass() == "js_money" then
        local amount = ent:GetAmount()
        ply:SetNetworkedInt("Balance", ply:GetNetworkedInt("Balance") + amount)
        ent:Remove()
    end
end