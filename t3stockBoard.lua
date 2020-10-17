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
nickelVolume = getVolume(nickel.getItemsMass(), 8.91)
nickelPercentage = getPercentage(nickelVolume, containerVolume)
nickelColour = getColour(nickelPercentage)
lithiumVolume = getVolume(lithium.getItemsMass(), 0.53)
lithiumPercentage = getPercentage(lithiumVolume, containerVolume)
lithiumColour = getColour(lithiumPercentage)
silverVolume = getVolume(silver.getItemsMass(), 10.49)
silverPercentage = getPercentage(silverVolume, containerVolume)
silverColour = getColour(silverPercentage)
sulfurVolume = getVolume(sulfur.getItemsMass(), 1.819)
sulfurPercentage = getPercentage(sulfurVolume, containerVolume)
sulfurColour = getColour(silverPercentage)
if math.floor(system.getTime())% 2 == 0 then
    time = "-"
else    
    time = "|"
end
html = [[<div class="bootstrap">]]
..[[<table style="margin-top: 5px; margin-left: auto; margin-right: auto; width: 80%; font-size: 6em;">]]
..[[<tr style="background: ]]..nickelColour..[[;"><td>Nickel: </td><td>]]..nickelVolume..[[KL - ]]..nickelPercentage..[[%</td></tr>]]
..[[<tr style="background: ]]..lithiumColour..[[;"><td>Lithium: </td><td>]]..lithiumVolume..[[KL - ]]..lithiumPercentage..[[%</td></tr>]]
..[[<tr style="background: ]]..silverColour..[[;"><td>Silver: </td><td>]]..silverVolume..[[KL - ]]..silverPercentage..[[%</td></tr>]]
..[[<tr style="background: ]]..sulfurColour..[[;"><td>Sulfur: </td><td>]]..sulfurVolume..[[KL - ]]..sulfurPercentage..[[%</td></tr>]]
..[[<tr><td>Running: </td><td>]]..time..[[</td></tr>]]
..[[</table>]]
..[[</div>]]
screen.setHTML(html)
