--------------------------------------------------------------------------
--							SCRIPT BY THE__Zeller					    --
--							  SEASON SET SCRIPT						    --
--------------------------------------------------------------------------

local seasonDefault = 0 -- DEFAULT SEASON {0 = SUMMER, 1 = WINTER}

-- FROM HERE THE CODE STARTS, DON'T EDIT THAT! --
local season

if seasonDefault == 0 then
    season = "CLEAR"
else if seasonDefault == 1 then
    season = "XMAS"
end
end

Citizen.CreateThread(function()
    while true 
        do
        
        SetWeatherTypePersist(season)
        SetWeatherTypeNowPersist(season)
        SetWeatherTypeNow(season)
        SetOverrideWeather(season)
        
        Citizen.Wait(1)
    end

end)

RegisterCommand("season", function(source, args, runCommand)
    if args[1] == "summer" then
        season = "CLEAR"
    else if args[1] == "winter" then
        season = "XMAS"
    end
    end
    
    Citizen.CreateThread(function()
        while true 
            do
            
            SetWeatherTypePersist(season)
            SetWeatherTypeNowPersist(season)
            SetWeatherTypeNow(season)
            SetOverrideWeather(season)
            
            Citizen.Wait(1)
        end
    
    end)
end, false)

TriggerEvent('chat:addSuggestion', '/season', 'by The__Zeller', {
    { name="season", help="summer or winter" }
})

