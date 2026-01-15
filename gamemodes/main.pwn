#include <a_samp>

// --- Variaveis de Controle ---
new PlayerAdmin[MAX_PLAYERS];
new bool:EstaInvisivel[MAX_PLAYERS];

main()
{
    print("\n----------------------------------");
    print(" MOZAMBIQUE ROLEPLAY MOBILE ON!");
    print("----------------------------------\n");
}

public OnGameModeInit()
{
    SetGameModeText("Mozambique RP v1.0");
    AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
    return 1;
}

public OnPlayerConnect(playerid)
{
    PlayerAdmin[playerid] = 0; // Começa como jogador comum
    EstaInvisivel[playerid] = false;
    SendClientMessage(playerid, 0x00FF00FF, "Bem-vindo ao MOZAMBIQUE ROLEPLAY!");
    return 1;
}

// Teleporte pelo Click no Mapa (Apenas Admin)
public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    if(PlayerAdmin[playerid] >= 1)
    {
        SetPlayerPos(playerid, fX, fY, fZ);
        SendClientMessage(playerid, 0xFFFF00FF, "Teleportado com sucesso!");
    }
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    // COMANDO PARA VIRAR DONO (Nivel 5)
    if (strcmp("/virardono", cmdtext, true) == 0)
    {
        PlayerAdmin[playerid] = 5;
        SendClientMessage(playerid, 0x00FFFFFF, "Agora voce e o DONO do servidor!");
        return 1;
    }

    // COMANDO INVISIVEL / VISIVEL (Apenas Admin)
    if (strcmp("/invisivel", cmdtext, true) == 0)
    {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, 0xFF0000FF, "Sem permissao!");
        
        if(EstaInvisivel[playerid] == false)
        {
            SetPlayerVirtualWorld(playerid, 999); // Vai para outro mundo (ninguem te ve)
            EstaInvisivel[playerid] = true;
            SendClientMessage(playerid, 0xFFFF00FF, "Voce agora esta INVISIVEL!");
        }
        else
        {
            SetPlayerVirtualWorld(playerid, 0); // Volta para o mundo normal
            EstaInvisivel[playerid] = false;
            SendClientMessage(playerid, 0xFFFF00FF, "Voce agora esta VISIVEL!");
        }
        return 1;
    }

    // COMANDO DE SKIN (Apenas Admin)
    if (strcmp("/skin", cmdtext, true) == 0)
    {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, 0xFF0000FF, "Sem permissao!");
        SetPlayerSkin(playerid, 217); // Skin de teste (Dono)
        SendClientMessage(playerid, 0xFFFF00FF, "Skin alterada!");
        return 1;
    }

    // COMANDO DE DINHEIRO (Apenas Admin)
    if (strcmp("/grana", cmdtext, true) == 0)
    {
        if(PlayerAdmin[playerid] < 1) return SendClientMessage(playerid, 0xFF0000FF, "Sem permissao!");
        GivePlayerMoney(playerid, 1000000);
        return 1;
    }

    return 0;
}
