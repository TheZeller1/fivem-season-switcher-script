--------------------------------------------------------------------------
--							SCRIPT BY THE__Zeller					    --
--							  SEASON SET SCRIPT						    --
--------------------------------------------------------------------------

--local seasonDefault = 0 -- DEFAULT SEASON {0 = SUMMER, 1 = WINTER}

-- FROM HERE THE CODE STARTS, DON'T EDIT THAT! --
local season

if Config.defaultSeason == 0 then
    season = "CLEAR"
else if Config.defaultSeason == 1 then
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

RegisterCommand(Config.langCommandName, function(source, args, runCommand)
    if args[1] == Config.langSummer then
        season = "CLEAR"
    else if args[1] == Config.langWinter then
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

TriggerEvent('chat:addSuggestion', '/'..Config.langCommandName, 'by The__Zeller', {
    { name=Config.langCommandName, help=Config.langSummer..' '..Config.langOr..' '..Config.langWinter}
})

