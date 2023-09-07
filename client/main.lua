ESX = exports["es_extended"]:getSharedObject()

local allowed = false
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/jobannounce', 'Announcement for everyone', {
        { name="Message", help="Nachricht die angezeigt wird" },
    })
    for k, v in pairs(config.jobs) do
        if v.name == ESX.PlayerData.job.name then
            local ranks = v.ranks

            local myTable = ranks:split(", ")
            for i = 1, #myTable do
                if tonumber(myTable[i]) == ESX.PlayerData.job.grade then
                   allowed = true 
                   print("test")
                end
            end

        end
    end
end)

RegisterCommand("jobannounce", function(source, args)

   -- Beispiel-Tabelle
local meineTabelle = args

-- Initialisieren Sie den zusammengefassten String
local zusammengefassterString = ""

-- Durchlaufen Sie die Tabelle und fügen Sie jeden Eintrag zum zusammengefassten String hinzu
for i, eintrag in ipairs(meineTabelle) do
    zusammengefassterString = zusammengefassterString .. eintrag

    -- Fügen Sie ein Leerzeichen zwischen den Einträgen hinzu, wenn dies gewünscht ist
    if i < #meineTabelle then
        zusammengefassterString = zusammengefassterString .. " "
    end
end
local msg = zusammengefassterString
-- Geben Sie den zusammengefassten String aus
if allowed then
TriggerServerEvent("uv-anouncements:announce", nil, msg, ESX.PlayerData.job.name, config.announcelenght)
else
TriggerEvent("esx:shownotification", "Dazu bist du nicht berächtigt", "error", 5000)
end
end)

function string:split( inSplitPattern, outResults )
    if not outResults then
      outResults = { }
    end
    local theStart = 1
    local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
    while theSplitStart do
      table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
      theStart = theSplitEnd + 1
      theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
    end
    table.insert( outResults, string.sub( self, theStart ) )
    return outResults
end

  