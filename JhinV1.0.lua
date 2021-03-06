if GetObjectName(GetMyHero()) ~= "Jhin" then return end

require('Inspired')

local JhinMenu = MenuConfig("Jhin", "Jhin")

JhinMenu:Menu("Combo", "Combo")
JhinMenu.Combo:Boolean("useQ", "Use Q", true)
JhinMenu.Combo:Boolean("useW", "Use W", true)
JhinMenu.Combo:Boolean("useE", "Use E", true)
JhinMenu.Combo:Key("Combo1", "Combo", string.byte(" "))

JhinMenu:Menu("Harass", "Harass")
JhinMenu.Harass:Boolean("HQ", "Use Q", true)
JhinMenu.Harass:Boolean("HW", "Use W", true)
JhinMenu.Harass:Boolean("HE", "Use E", false)
JhinMenu.Harass:Key("Harass1", "Harass", string.byte("C"))

JhinMenu:Menu("Ksecure", "Ksecure")
JhinMenu.Ksecure:Boolean("KsQ", "Use Q", false)
JhinMenu.Ksecure:Boolean("KsW", "Use W", false)
JhinMenu.Ksecure:Boolean("KsE", "Use E", false)
JhinMenu.Ksecure:Info("info", "Ksecure available soon")

JhinMenu:Menu("Drawings", "Drawings")
JhinMenu.Drawings:Boolean("Q", "Draw Q Range", false)
JhinMenu.Drawings:Boolean("W", "Draw W Range", false)
JhinMenu.Drawings:Boolean("E", "Draw R Range", false)

JhinMenu:Menu("DrawingsD", "DrawingsD")
JhinMenu.DrawingsD:Boolean("Q", "Draw Q Damage", false)
JhinMenu.DrawingsD:Boolean("W", "Draw W Damage", false)
JhinMenu.DrawingsD:Boolean("E", "Draw E Damage", false)
JhinMenu.DrawingsD:Info("info" , "available soon")

JhinMenu:Menu("Misc", "Misc")
JhinMenu.Misc:Info("info", "Auto Heal Soon")
JhinMenu.Misc:Info("info2", "Auto Ignite Soon")

JhinMenu:Menu("Credits", "Credits")
JhinMenu.Credits:Info("info", "By BlackRjb")

------Local function 

Callback.Add("Tick", function() Loop() end)
Callback.Add("Draw", function(myHero) OnDraw(myHero) end)

------Drawing Range Spell

function OnDraw(myHero)
	
local pos = GetOrigin(myHero)

if JhinMenu.Drawings.Q:Value() then 
 	DrawCircle(pos,550,1,25,GoS.Pink) 
end

if JhinMenu.Drawings.W:Value() then 
	DrawCircle(pos,3000,1,25,GoS.Blue) 
end

end

 -----COMBO
 function Loop()

local Target = GetCurrentTarget()
local myHeroPos = GetOrigin(myHero)
local useQ = JhinMenu.Combo.useQ:Value()
local useW = JhinMenu.Combo.useW:Value()
local useE = JhinMenu.Combo.useE:Value()
local HQ = JhinMenu.Harass.HQ:Value()
local HW = JhinMenu.Harass.HW:Value()
local HE = JhinMenu.Harass.HE:Value()
local KsQ = JhinMenu.Ksecure.KsQ:Value()
local KsW = JhinMenu.Ksecure.KsW:Value()
local KsE = JhinMenu.Ksecure.KsE:Value()

if IOW:Mode() == "Combo" then
if useQ and CanUseSpell(myHero,_Q) == READY and ValidTarget(target, 550) then
CastTargetSpell(target,_Q)
end
if useW and CanUseSpell(myHero,_W) == READY and ValidTarget(target, 3000) then
CastTargetSpell(target,_W)
end
if useE and CanUseSpell(myHero,_E) == READY and ValidTarget(target, 750) then
CastTargetSpell(target,_E)
end
end

-----HARASS
if IOW:Mode() == "Harass" then
if HQ and CanUseSpell(myHero,_Q) == READY and ValidTarget(target, 550) then
CastTargetSpell(target,_Q)
end
if HW and CanUseSpell(myHero,_W) == READY and ValidTarget(target, 3000) then
CastTargetSpell(target,_W)
end
if HE and CanUseSpell(myHero,_E) == READY and ValidTarget(target, 750) then
end
end

end
PrintChat(string.format("<font color='#1244EA'>Jhin V1.0:</font> <font color='#FFFFFF'> By BlackRjb Loaded, Have A Good Game ! </font>"))
