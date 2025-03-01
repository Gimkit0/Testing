-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-02-28 17:32:57
-- Luau version 6, Types version 3
-- Time taken: 0.001363 seconds

local Shared = game.ReplicatedStorage.Shared
local module = {}
local tbl_upvr = {
    DEFAULT_RESPONSE_TIMEOUT = 5;
}
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local var5_upvw = 0
local promise_upvr = loadstring(game:HttpGet("https://"))()
function module.RequestAsync(arg1) -- Line 26
    --[[ Upvalues[4]:
        [1]: ReplicatedStorage_upvr (readonly)
        [2]: var5_upvw (read and write)
        [3]: promise_upvr (readonly)
        [4]: tbl_upvr (readonly)
    ]]
    local SOME_upvr = ReplicatedStorage_upvr.Events:FindFirstChild(arg1.RemoteId)
    local var8_upvw
    local var9_upvr = var5_upvw
    local var10
    if not arg1.ResponseType then
        var10 = promise_upvr.resolve()
    else
        local ResponseTimeout = arg1.ResponseTimeout
        if not ResponseTimeout then
            ResponseTimeout = tbl_upvr.DEFAULT_RESPONSE_TIMEOUT
        end
        var10 = promise_upvr.new(function(arg1_2) -- Line 39
            --[[ Upvalues[4]:
                [1]: var8_upvw (read and write)
                [2]: SOME_upvr (readonly)
                [3]: arg1 (readonly)
                [4]: var9_upvr (readonly)
            ]]
            var8_upvw = SOME_upvr.OnClientEvent:Connect(function(arg1_3) -- Line 40
                --[[ Upvalues[3]:
                    [1]: arg1 (copied, readonly)
                    [2]: var9_upvr (copied, readonly)
                    [3]: arg1_2 (readonly)
                ]]
                if arg1.VerifyResponseId and arg1_3.RequestId ~= var9_upvr then
                elseif arg1_3.Type == arg1.ResponseType then
                    arg1_2(arg1_3.Payload)
                end
            end)
        end):timeout(ResponseTimeout):finally(function() -- Line 47
            --[[ Upvalues[1]:
                [1]: var8_upvw (read and write)
            ]]
            var8_upvw:Disconnect()
        end)
    end
    SOME_upvr:FireServer({
        Type = arg1.RequestType;
        RequestId = var9_upvr;
        Payload = arg1.Payload;
    })
    var5_upvw += 1
    return var10
end
return module
