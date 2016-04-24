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

        if number < 1 {
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

        masculino = false
        feminino = false
        plural = false
        com_artigo = false
        
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

func testArtigo(word: String)->(Bool){

    if artigo_Masculino_Maiusculo.contains(word){
        masculino = true
        return true
    }

    else if artigo_Masculino_Plural_Maiusculo.contains(word){
        masculino = true
        plural = true
        return true
    }

    else if artigo_Feminino_Maiusculo.contains(word){
        feminino = true
        return true
    }

    else if artigo_Feminino_Plural_Maiusculo.contains(word){
        feminino = true
        plural = true
        return true
    }

    return false
}

func testSubstantivo(word: String)->(Bool){

    if substantivo_Masculino.contains(word){
        return masculino == true && plural == false
    }

    else if substantivo_Masculino_Plural.contains(word){
        return masculino == true && plural == true
    }

    else if substantivo_Feminino.contains(word){
        return feminino == true && plural == false
    }

    else if substantivo_Feminino_Plural.contains(word){
        return feminino == true && plural == true
    }

    return false
}

func testVerbo(word: String)->(Bool){

    if verbo.contains(word){
        return plural == false
    }

    else if verbo_Plural.contains(word){
        return plural == true
    }

    
    return false
}

func testPreposicao(word: String)->(Bool){

    return false
}

func checkGrammar(sentence: [String]) -> (Bool) {



    guard let firstWord = sentence[safe: 0] else {
        return false
    }

    let boolArtigo = testArtigo(firstWord)

    if boolArtigo == false{
        print("Something is wrong with the artigo: \(firstWord)")
        return false
    }


    guard let secondWord = sentence[safe: 1] else {
        return false
    }

    let boolSubstantivo = testSubstantivo(secondWord)

    if boolSubstantivo == false{
        print("Something is wrong with the substantivo: \(secondWord)")
        return false
    }

    guard let thirdWord = sentence[safe: 2] else {
        return false
    }

    let boolVerbo = testVerbo(thirdWord)

    if boolVerbo == false{
        print("Something is wrong with the verbo: \(thirdWord)")
        return false
    }

    guard let forthWord = sentence[safe: 3] else {
        print("LOOOOL")
        return true
    }

    let boolPreposicao = testPreposicao(forthWord)

    if boolPreposicao == false{
        print("Something is wrong with the preposicao: \(forthWord)")
        return false
    }


    return true
}