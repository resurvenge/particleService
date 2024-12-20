local particleService = {}

particleService.__index = particleService

local debris = game:GetService("Debris")

function particleService: Emit_attachment(tbl)
	  if type(tbl) == "table" then
			if tbl.Attachment then 
				local attachment = tbl.Attachment:Clone()
				attachment.Parent = tbl.Parent
				debris:AddItem(attachment, tbl.Duration)
				  for _, obj in pairs(attachment:GetChildren()) do
						 if obj and obj:IsA("ParticleEmitter") then
							  obj:Emit(tbl.Amount)
							  if tbl.LockedToPart == "NotLocked" then 
									obj.LockedToPart = false
							  elseif tbl.LockedToPart == "Locked" then
									 obj.LockedToPart = true
 							  end
						 end
				  end
			end
	  end
end

function particleService: Emit(tbl)
	   if type(tbl) == "table" then
			  local Particle = tbl.Particle:Clone()
			  Particle.Parent = tbl.Parent
			  Particle:Emit(tbl.Amount)
			  debris:AddItem(Particle, tbl.Duration)
	   end
end

return particleService
