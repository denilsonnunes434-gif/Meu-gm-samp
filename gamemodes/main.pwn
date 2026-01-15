#include <a_samp>

main()
{
	print("\n----------------------------------");
	print(" MOZAMBIQUE ROLEPLAY MOBILE ON!");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	SetGameModeText("Mozambique RP v1.0");
	// Posição de nascimento (Skin 0)
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnPlayerConnect(playerid)
{
	// Mensagem de boas-vindas colorida
	SendClientMessage(playerid, 0x00FF00FF, "========================================");
	SendClientMessage(playerid, -1, " Bem-vindo ao {FFFF00}MOZAMBIQUE ROLEPLAY MOBILE!");
	SendClientMessage(playerid, -1, " Tenha um bom jogo no nosso servidor mobile.");
	SendClientMessage(playerid, 0x00FF00FF, "========================================");
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp("/vida", cmdtext, true, 5) == 0)
    {
        SetPlayerHealth(playerid, 100.0);
        SendClientMessage(playerid, 0xFF0000FF, "Sua vida foi restaurada!");
        return 1;
    }

    if (strcmp("/colete", cmdtext, true, 7) == 0)
    {
        SetPlayerArmour(playerid, 100.0);
        SendClientMessage(playerid, 0x0000FFFF, "Você recebeu um colete!");
        return 1;
    if (strcmp("/aeroporto", cmdtext, true, 10) == 0)
    {
        SetPlayerPos(playerid, 1958.3783, -2256.3457, 13.5469);
        SendClientMessage(playerid, 0xFFFF00FF, "Bem-vindo ao Aeroporto!");
        return 1;
    }

    if (strcmp("/carro", cmdtext, true, 6) == 0)
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        CreateVehicle(411, x + 2, y, z, 0.0, -1, -1, 100); 
        SendClientMessage(playerid, 0x00FFFFFF, "Infernus criado com sucesso!");
        return 1;
    }
    return 0;
}

