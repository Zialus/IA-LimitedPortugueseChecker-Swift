import Foundation


func readInput() -> ([[String]]) {

    var sentences = [[String]]()

    print("How many sentences do you want to test?")

    if let userInput = readLine(stripNewline: true){

        guard let number = Int(userInput) else {
            print(ANSI.Red)
            print("That's not a valid number!!!!!")
            exit(1)
        }

        printfulldebug("\nI received the number: \(number)\n")

        for i in 1...number {

            print("Enter sentence number \(i): ")

            if let userInput = readLine(stripNewline: true) {

                let delimiter = " "

                let words = userInput.componentsSeparatedByString(delimiter)
                sentences.append(words)
            }
        }


    } else{
        print("Something went horribily wrong")
        exit(1)
    }
    
    return sentences




}


func testSentences(sentenceList: [[String]]) -> () {

    for (index,sentence) in sentenceList.enumerate(){

        print("Checking sentence \(index+1)...")

        printfulldebug("\(Colors.Yellow("Contents of the sentece:"))   \(sentence)")

        let bool = checkGrammar(sentence)
        switch bool {
        case true:
            print("\(Colors.Green("Valid sentence"))")
        case false:
            print("\(Colors.Red("Invalid sentence"))")
        }
        print()

    }

}

func checkGrammar(sentence: [String]) -> (Bool) {


    return true
}