ESX = exports["es_extended"]:getSharedObject()
RegisterServerEvent("uv-anouncements:announce")
AddEventHandler("uv-anouncements:announce", function(source, msg, job, lenght)
print(msg)
TriggerClientEvent("esx:showNotification", -1, msg, job, lenght)
end)