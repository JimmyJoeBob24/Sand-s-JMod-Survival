DEFINE_BASECLASS("base_nextbot")

ENT.Base = "base_nextbot"
ENT.Type = "nextbot"
ENT.PrintName = "Hazmat"
ENT.Category = "JSurvival NPCs"
ENT.Spawnable = true

function ENT:Initialize()
    self:SetModel("models/bloocobalt/splinter cell/chemsuit")
    self.LoseTargetDist = 1000
    self.SearchInterval = 5
end

function ENT:RunBehaviour()
    while true do
        self:ScoutNearby()
        coroutine.wait(self.SearchInterval)
    end
end

function ENT:ScoutNearby()
    local ply = self:GetClosestPlayer()
    if not IsValid(ply) then return end

    local originArea = navmesh.GetNearestNavArea(ply:GetPos(), false, 1000)
    if not IsValid(originArea) then return end

    local neighbors = originArea:GetAdjacentAreas()
    table.insert(neighbors, originArea) -- include current area

    local candidates = {}
    for _, area in ipairs(neighbors) do
        local center = area:GetCenter()
        if not self:IsVisibleToPlayer(ply, center) then
            table.insert(candidates, center)
        end
    end

    if #candidates > 0 then
        local target = table.Random(candidates)
        self:MoveToPos(target)
    end
end

function ENT:GetClosestPlayer()
    local closest, dist = nil, math.huge
    for _, ply in ipairs(player.GetAll()) do
        if ply:Alive() then
            local d = self:GetPos():DistToSqr(ply:GetPos())
            if d < dist then
                closest = ply
                dist = d
            end
        end
    end
    return closest
end

function ENT:IsVisibleToPlayer(ply, pos)
    local trace = util.TraceLine({
        start = ply:EyePos(),
        endpos = pos,
        filter = ply
    })
    if trace.Fraction == 1 then
        local dir = (pos - ply:EyePos()):GetNormalized()
        return dir:Dot(ply:GetAimVector()) > 0.5
    end
    return false
end
