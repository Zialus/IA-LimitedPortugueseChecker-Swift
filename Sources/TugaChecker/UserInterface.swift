import Foundation

func printInstructions() {
    let instructions = """

      .-----------------------------------------------------------------.
     /  .-.                                                         .-.  \\

    """.yellow

+   "|  /   \\          ".yellow + "./TugaChecker".cyan + " <Debug Mode>                   /   \\  |".yellow

+   """

    | |\\_.  |                                                     |    /| |
    |\\|  | /|      debug:     Activates basic debug info          |\\  | |/|
    | `---' |      fulldebug: Activates the full debug info       | `---' |
    |       |                                                     |       |
    |       |-----------------------------------------------------|       |
    \\       |                                                     |       /
     \\     /                                                       \\     /
      `---'                                                         `---'

    """.yellow
    print(instructions)
}

func welcomeMessage() {
    let welcomeMessage = """

      _____ _     _       _         _           _                            _
     |_   _| |__ (_)___  (_)___    (_)_   _ ___| |_    __ _   _   _ ___  ___| | ___  ___ ___
       | | | '_ \\| / __| | / __|   | | | | / __| __|  / _` | | | | / __|/ _ \\ |/ _ \\/ __/ __|
       | | | | | | \\__ \\ | \\__ \\   | | |_| \\__ \\ |_  | (_| | | |_| \\__ \\  __/ |  __/\\__ \\__ \\
       |_| |_| |_|_|___/ |_|___/  _/ |\\__,_|___/\\__|  \\__,_|  \\__,_|___/\\___|_|\\___||___/___/
                                 |__/
                       ____            _
                      |  _ \\ ___  _ __| |_ _   _  __ _ _   _  ___  ___  ___
                      | |_) / _ \\| '__| __| | | |/ _` | | | |/ _ \\/ __|/ _ \\
                      |  __/ (_) | |  | |_| |_| | (_| | |_| |  __/\\__ \\  __/
                      |_|   \\___/|_|   \\__|\\__,_|\\__, |\\__,_|\\___||___/\\___|
                                                 |___/
        ____                                             ____ _               _
       / ___|_ __ __ _ _ __ ___  _ __ ___   __ _ _ __   / ___| |__   ___  ___| | _____ _ __
      | |  _| '__/ _` | '_ ` _ \\| '_ ` _ \\ / _` | '__| | |   | '_ \\ / _ \\/ __| |/ / _ \\ '__|
      | |_| | | | (_| | | | | | | | | | | | (_| | |    | |___| | | |  __/ (__|   <  __/ |
       \\____|_|  \\__,_|_| |_| |_|_| |_| |_|\\__,_|_|     \\____|_| |_|\\___|\\___|_|\\_\\___|_|

    """.blue

    print(welcomeMessage)
}

@MainActor func proccessCmdLineArgs() {

    if CommandLine.arguments.count == 1 {
        print("All debug functionality is turned " + "OFF".red + "!")
        print()
    } else if CommandLine.arguments.count > 2 {
        print("Too many arguments!".red)
        print("Try launching with the argument " + "\"--help\".".yellow)
        exit(1)
    } else if CommandLine.arguments.count == 2 {

        let onlyArg = CommandLine.arguments[1]

        switch onlyArg {
        case "debug":
            print("Debug Mode is " + "ON".lightGreen + "!\n")

            DEBUG=true
        case "fulldebug":
            print("Full Debug mode is " + "ON".lightGreen + "!!!\n")

            DEBUG=true
            FULLDEBUG=true
        case "--help":
            printInstructions()
            exit(0)
        default:
            print("What are you trying to do?!".red + " \"\(onlyArg)\" " + "is an unrecognized argument.".red)
            print("Try launching with the argument " + "\"--help\".".yellow)
            exit(1)
        }

    }

}

func goodbyeMessage() {

    print("\nIt was a pleasure working with you!\n".green)

}

@MainActor func readInput() -> ([[String]]) {

    var sentences = [[String]]()

    print("How many sentences do you want to test?")

    if let userInput = readLine(strippingNewline: true) {

        guard let number = Int(userInput) else {
            print("That's not a valid number!!!!! You must input an integer.".red)
            exit(1)
        }

        if number < 1 {
            print("That's not a valid number!!!!! Pick a number greater than 0.".red)
            exit(1)
        }

    printfulldebug("\nI received the number: \(number)\n")

        for i in 1...number {
            print("Enter sentence number \(i): ")

            if let sentence = readLine(strippingNewline: true) {

                let delimiter = " "
                let words = sentence.components(separatedBy: delimiter)
                sentences.append(words)

            } else {
                print("Couldn't read sentence".red)
            }
        }

    } else {
        print("Something went horribily wrong while reading your input".red)
        exit(1)
    }

    return sentences

}
