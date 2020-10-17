local function getVolume(mass, density)   
  if mass == nil then
          return "NaN"
  else
          return math.floor((mass / density) / 1000)
   end
end
local function getPercentage(volume, container)
   if volume ~= "NaN" then
      return math.floor((volume / container) * 100) 
    else     
      return "-"
  end
end
local function getColour(percentage)
   normalised = math.floor((percentage / 100) * 255)
   return "rgb("..(255 - normalised)..", "..normalised..", 0)" 
end
containerVolume = 89 --export: containerVolume
-- Volume and Percentage calculations
ironVolume = getVolume(iron.getItemsMass(), 7.85)
ironPercentage = getPercentage(ironVolume, containerVolume)
ironColour = getColour(ironPercentage)
alumVolume = getVolume(aluminium.getItemsMass(), 2.7)
alumPercentage = getPercentage(alumVolume, containerVolume)
alumColour = getColour(alumPercentage)
siliconVolume = getVolume(silicon.getItemsMass(), 2.3)
siliconPercentage = getPercentage(siliconVolume, containerVolume)
siliconColour = getColour(siliconPercentage)
carbonVolume = getVolume(carbon.getItemsMass(), 2.27)
carbonPercentage = getPercentage(carbonVolume, containerVolume)
carbonColour = getColour(carbonPercentage)
if math.floor(system.getTime())% 2 == 0 then
    time = "-"
else    
    time = "|"
end
html = [[<div class="bootstrap">]]
	..[[<table style="margin-top: 5px; margin-left: auto; margin-right: auto; width: 80%; font-size: 6em;">]]
	..[[<tr style="background: ]]..ironColour..[[;"><td>Iron: </td><td>]]..ironVolume..[[KL - ]]..ironPercentage..[[%</td></tr>]]
	..[[<tr style="background: ]]..alumColour..[[;"><td>Aluminium: </td><td>]]..alumVolume..[[KL - ]]..alumPercentage..[[%</td></tr>]]
	..[[<tr style="background: ]]..siliconColour..[[;"><td>Silicon: </td><td>]]..siliconVolume..[[KL - ]]..siliconPercentage..[[%</td></tr>]]
	..[[<tr style="background: ]]..carbonColour..[[;"><td>Carbon: </td><td>]]..carbonVolume..[[KL - ]]..carbonPercentage..[[%</td></tr>]]
	..[[<tr><td>Running: </td><td>]]..time..[[</td></tr>]]
	..[[</table>]]
	..[[</div>]]
screen.setHTML(html)
