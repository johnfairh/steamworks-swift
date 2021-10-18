import CSteamworks

if !SteamAPI_Init() {
    print("SteamAPI_Init() failed");
} else {
    print("SteamAPI_Init() OK");
    SteamAPI_Shutdown();
    print("SteamAPI_Shutdown() OK");
}
print("End program")
