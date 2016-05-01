import Foundation

func printInstructions() -> () {
    print(ANSI.Yellow)
    print("  .-----------------------------------------------------------------.")
    print(" /  .-.                                                         .-.  \\")
    print("|  /   \\           \(ANSI.Cyan)./TugaCheker\(ANSI.Yellow) <Debug Mode>                   /   \\  |")
    print("| |\\_.  |                                                     |    /| |")
    print("|\\|  | /|      debug:     Activates basic debug info          |\\  | |/|")
    print("| `---' |      fulldebug: Activates the full debug info       | `---' |")
    print("|       |                                                     |       |")
    print("|       |-----------------------------------------------------|       |")
    print("\\       |                                                     |       /")
    print(" \\     /                                                       \\     /")
    print("  `---'                                                         `---'")
    print()
}

func welcomeMessage() -> () {
    print(ANSI.Blue)
    print("  _____ _     _       _         _           _                            _")
    print(" |_   _| |__ (_)___  (_)___    (_)_   _ ___| |_    __ _   _   _ ___  ___| | ___  ___ ___")
    print("   | | | '_ \\| / __| | / __|   | | | | / __| __|  / _` | | | | / __|/ _ \\ |/ _ \\/ __/ __|")
    print("   | | | | | | \\__ \\ | \\__ \\   | | |_| \\__ \\ |_  | (_| | | |_| \\__ \\  __/ |  __/\\__ \\__ \\")
    print("   |_| |_| |_|_|___/ |_|___/  _/ |\\__,_|___/\\__|  \\__,_|  \\__,_|___/\\___|_|\\___||___/___/")
    print("                             |__/")
    print("                   ____            _")
    print("                  |  _ \\ ___  _ __| |_ _   _  __ _ _   _  ___  ___  ___")
    print("                  | |_) / _ \\| '__| __| | | |/ _` | | | |/ _ \\/ __|/ _ \\")
    print("                  |  __/ (_) | |  | |_| |_| | (_| | |_| |  __/\\__ \\  __/")
    print("                  |_|   \\___/|_|   \\__|\\__,_|\\__, |\\__,_|\\___||___/\\___|")
    print("                                             |___/")
    print("    ____                                             ____ _               _")
    print("   / ___|_ __ __ _ _ __ ___  _ __ ___   __ _ _ __   / ___| |__   ___  ___| | _____ _ __")
    print("  | |  _| '__/ _` | '_ ` _ \\| '_ ` _ \\ / _` | '__| | |   | '_ \\ / _ \\/ __| |/ / _ \\ '__|")
    print("  | |_| | | | (_| | | | | | | | | | | | (_| | |    | |___| | | |  __/ (__|   <  __/ |")
    print("   \\____|_|  \\__,_|_| |_| |_|_| |_| |_|\\__,_|_|     \\____|_| |_|\\___|\\___|_|\\_\\___|_|")

    print(ANSI.Reset)
}

func proccessCmdLineArgs() -> () {

    if Process.arguments.count == 1 {
        print("All debug functionality is turned \(Colors.Red("OFF"))!")
        print()
    } else if Process.arguments.count > 2 {
        print()
        print("\(Colors.Red("Too many arguments!")) Try launching with the argument \"--help\" ")
        print()
        exit(1)
    } else if Process.arguments.count == 2 {

        let onlyArg = Process.arguments[1]

        switch onlyArg {
        case "debug":
            print("Debug Mode is \(Colors.Green("ON"))!")
            print()

            DEBUG=true
        case "fulldebug":
            print("Full Debug mode is \(Colors.Green("ON"))!!!")
            print()

            DEBUG=true
            FULLDEBUG=true
        case "--help":
            printInstructions()
            exit(0)
        default:
            print("\(Colors.Red("What are you trying to do!?")) \n\"\(onlyArg)\" is an unrecognized argument")
            print("Try launching with the argument \"--help\"")
            exit(1)
        }

    }

}

func goodbyeMessage() -> () {

    print()
    print("It was a pleasure working with you!")
    print()
    
}
