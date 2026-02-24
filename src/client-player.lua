DoScreenFadeOut(0)

NetworkStartSoloTutorialSession()

local defaultCharacter <const> = 'mp_m_freemode_01'
local defaultPosition <const> = vector3(-2253.6411, 242.7881, 174.6016)

local SpawnPlayer = function ()
    local playerId = PlayerId()
    local characterId = PlayerPedId()

    if IsPlayerSwitchInProgress() then
        StopPlayerSwitch()
    end

    if GetIsLoadingScreenActive() then
        SendLoadingScreenMessage('{"fullyLoaded": true}')
        ShutdownLoadingScreenNui()
    end

    ShutdownLoadingScreen()

    ThefeedHideThisFrame()

    NetworkEndTutorialSession()

    local model = defaultCharacter
    local modelHash = GetHashKey(model)

    RequestModel(modelHash); while not HasModelLoaded(modelHash) do
        Wait(10)
    end

    if HasModelLoaded(modelHash) then
        SetPlayerModel(playerId, modelHash)
        SetModelAsNoLongerNeeded(modelHash)

        characterId = PlayerPedId()
    end

    SetPedDefaultComponentVariation(characterId)

    SetPlayerControl(playerId, true, 0)

    SetPlayerInvincible(playerId, false)
    SetPlayerHealthRechargeLimit(playerId, 0)

    NetworkSetFriendlyFireOption(true)
    SetCanAttackFriendly(characterId, true, false)

    SetPedCanRagdoll(characterId, true)

    local attempt = 0

    RequestCollisionAtCoord(defaultPosition.x, defaultPosition.y, defaultPosition.z)

    while not HasCollisionLoadedAroundEntity(characterId) and attempt < 10 do
        attempt = (attempt or 0) + 1
        Wait(1000)
    end

    FreezeEntityPosition(characterId, true)

    SetEntityCoordsNoOffset(characterId, defaultPosition.x, defaultPosition.y, defaultPosition.z, true, true, false)

    SetEntityHeading(characterId, 0.0)
    SetGameplayCamRelativeHeading(0.0)

    if IsScreenFadedOut() then
        DoScreenFadeIn(2500)
    end

    FreezeEntityPosition(characterId, false)
end

CreateThread(function ()
    if NetworkIsSessionStarted() then
        Wait(5000)
        SpawnPlayer()
    end
end)