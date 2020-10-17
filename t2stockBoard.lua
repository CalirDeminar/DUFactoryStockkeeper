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
copperVolume = getVolume(copper.getItemsMass(), 8.96)
copperPercentage = getPercentage(copperVolume, containerVolume)
copperColour = getColour(copperPercentage)
chromeVolume = getVolume(chromium.getItemsMass(), 7.19)
chromePercentage = getPercentage(chromeVolume, containerVolume)
chromeColour = getColour(chromePercentage)
sodiumVolume = getVolume(sodium.getItemsMass(), 0.97)
sodiumPercentage = getPercentage(sodiumVolume, containerVolume)
sodiumColour = getColour(sodiumPercentage)
calciumVolume = getVolume(calcium.getItemsMass(), 1.55)
calciumPercentage = getPercentage(calciumVolume, containerVolume)
calciumColour = getColour(calciumPercentage)
if math.floor(system.getTime())% 2 == 0 then
    time = "-"
else    
    time = "|"
end
html = [[<div class="bootstrap">]]
	..[[<table style="margin-top: 5px; margin-left: auto; margin-right: auto; width: 80%; font-size: 6em;">]]
	..[[<tr style="background: ]]..copperColour..[[;"><td>Copper: </td><td>]]..copperVolume..[[KL - ]]..copperPercentage..[[%</td></tr>]]
	..[[<tr style="background: ]]..chromeColour..[[;"><td>Chromium: </td><td>]]..chromeVolume..[[KL - ]]..chromePercentage..[[%</td></tr>]]
	..[[<tr style="background: ]]..sodiumColour..[[;"><td>Sodium: </td><td>]]..sodiumVolume..[[KL - ]]..sodiumPercentage..[[%</td></tr>]]
	..[[<tr style="background: ]]..calciumColour..[[;"><td>Calcium: </td><td>]]..calciumVolume..[[KL - ]]..calciumPercentage..[[%</td></tr>]]
	..[[<tr><td>Running: </td><td>]]..time..[[</td></tr>]]
	..[[</table>]]
	..[[</div>]]
screen.setHTML(html)
