#include <a_samp>

main()
{
    print("\n----------------------------------");
    print(" Meu Servidor SAMP Iniciado!");
    print("----------------------------------\n");
}

public OnGameModeInit()
{
    SetGameModeText("Versao 1.0");
    // Posição inicial de spawn (Skin 0)
    AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo ao servidor criado pelo GitHub!");
    return 1;
}
