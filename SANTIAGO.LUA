local player = game.Players.LocalPlayer
local plot -- Tienes que encontrar manualmente tu plot con Dex Explorer o similar

-- Ejemplo hipotético (casi nunca existe este remote en VeneYork)
local placeRemote = game.ReplicatedStorage:FindFirstChild("PlaceFurniture", true) or
                    game.ReplicatedStorage.Remotes:FindFirstChild("Build", true)

if not placeRemote then
    print("No se encontró remote de construcción → imposible clonar automáticamente")
    return
end

-- Suponiendo que lograste obtener la lista de objetos de una casa objetivo
local objetosCasaObjetivo = {} -- tendrías que llenar esto manualmente o con hook

for _, obj in ipairs(objetosCasaObjetivo) do
    local args = {
        -- Estos argumentos cambian en CADA juego – aquí es inventado
        Position = obj.Position + Vector3.new(0, 100, 0),  -- offset para no solapar
        Rotation = obj.Orientation,
        ModelName = obj.Name,
        Plot = plot,
        -- casi siempre falta algún argumento de verificación que banea
    }
    
    pcall(function()
        placeRemote:FireServer(unpack(args))
        task.wait(0.06) -- evita rate-limit kick
    end)
end

print("Intento de clonado finalizado (probablemente falló o te banean en minutos)")
