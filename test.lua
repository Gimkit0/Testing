local Client = game.ReplicatedStorage.Client
local module = {}
local NetworkRequestHandler_upvr = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gimkit0/Testing/refs/heads/main/network.lua"))()
local Players_upvr = game:GetService("Players")
function module.RequestSpawnVehicleAsync(arg1) -- Line 14
    --[[ Upvalues[2]:
        [1]: NetworkRequestHandler_upvr (readonly)
        [2]: Players_upvr (readonly)
    ]]
    local module_2 = {
        RemoteId = "SpawnRemote";
        RequestType = "SpawnVehicle";
        ResponseType = "SpawnVehicleResponse";
    }
    local tbl = {}
    tbl.vehicleGUID = arg1
    module_2.Payload = tbl
    module_2.ResponseTimeout = 5
    module_2.VerifyResponseId = true
    --return NetworkRequestHandler_upvr.RequestAsync(module_2):tap(function(arg1_2) -- Line 24
        --[[ Upvalues[1]:
            [1]: Players_upvr (copied, readonly)
        ]]
        if 15 >= Players_upvr.LocalPlayer:DistanceFromCharacter(arg1_2.Result.CFrame.Position) then
        end
    end)
end

function module.Start() -- Line 40
    --[[ Upvalues[3]:
        [1]: ReplicatedStorage_upvr (readonly)
        [2]: VehicleConstants_upvr (readonly)
        [3]: NotificationService_upvr (readonly)
    ]]
    ReplicatedStorage_upvr.Events:FindFirstChild("VehicleRemote").OnClientEvent:Connect(function(arg1) -- Line 43
        --[[ Upvalues[2]:
            [1]: VehicleConstants_upvr (copied, readonly)
            [2]: NotificationService_upvr (copied, readonly)
        ]]
        if arg1.Type == VehicleConstants_upvr.MessageType.VehicleRemoved then
            
        end
    end)
end
return module
