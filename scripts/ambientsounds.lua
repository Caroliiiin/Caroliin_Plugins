Citizen.CreateThread(function()
    -- Audio-Szenen und -Emitter deaktivieren
    StartAudioScene("DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE")
    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_01_STAGE", false)
    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM", false)
    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM", false)
    StartAudioScene("FBI_HEIST_H5_MUTE_AMBIENCE_SCENE")
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("PoliceScannerDisabled", true)
    SetAudioFlag("DisableFlightMusic", true)

    -- Szenarien deaktivieren
    local scenariosToDisable = {
        "WORLD_VEHICLE_STREETRACE",
        "WORLD_VEHICLE_SALTON_DIRT_BIKE",
        "WORLD_VEHICLE_SALTON",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_MECHANIC",
        "WORLD_VEHICLE_EMPTY",
        "WORLD_VEHICLE_BUSINESSMEN",
        "WORLD_VEHICLE_BIKE_OFF_ROAD_RACE"
    }
    for _, scenarioType in ipairs(scenariosToDisable) do
        SetScenarioTypeEnabled(scenarioType, false)
    end

    -- Ambient Zone Listen anpassen
    SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Disabled_Zones", false, true)
    SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Zones", true, true)

    -- Spieler- und Umgebungsanpassungen
    SetPlayerCanUseCover(PlayerId(), false)
    SetRandomEventFlag(false)
    SetDeepOceanScaler(0.0)
    SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
end)
