import Foundation


func readInput() -> ([[String]]) {

    var sentences = [[String]]()

    print("How many sentences do you want to test?")

    if let userInput = readLine(stripNewline: true) {

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


    } else {
        print("Something went horribily wrong")
        exit(1)
    }

    return sentences




}

func testSentences(sentenceList: [[String]]) -> () {

    for (index, sentence) in sentenceList.enumerate() {

        print("Checking sentence \(index+1)...")

        printfulldebug("\(Colors.Yellow("Contents of the sentece:"))   \(sentence)")

        masculino_substantivo = false
        feminino_substantivo = false
        plural_substantivo = false
        artigo_preposicao = false
        masculino_preposicao = false
        feminino_preposicao = false
        plural_preposicao = false

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

func testArtigo(word: String) -> (Bool) {

    if artigo_Masculino_Maiusculo.contains(word) {
        masculino_substantivo = true
        return true
    }

    else if artigo_Masculino_Plural_Maiusculo.contains(word) {
        masculino_substantivo = true
        plural_substantivo = true
        return true
    }

    else if artigo_Feminino_Maiusculo.contains(word) {
        feminino_substantivo = true
        return true
    }

    else if artigo_Feminino_Plural_Maiusculo.contains(word) {
        feminino_substantivo = true
        plural_substantivo = true
        return true
    }

    return false
}

func testSubstantivo(word: String) -> (Bool) {

    if substantivo_Masculino.contains(word) {
        return masculino_substantivo == true && plural_substantivo == false
    }

    else if substantivo_Masculino_Plural.contains(word) {
        return masculino_substantivo == true && plural_substantivo == true
    }

    else if substantivo_Feminino.contains(word) {
        return feminino_substantivo == true && plural_substantivo == false
    }

    else if substantivo_Feminino_Plural.contains(word) {
        return feminino_substantivo == true && plural_substantivo == true
    }

    return false
}

func testVerbo(word: String) -> (Bool) {

    if verbo.contains(word) {
        return plural_substantivo == false
    }

    else if verbo_Plural.contains(word) {
        return plural_substantivo == true
    }

    return false
}

func testPreposicao(word: String) -> (Bool) {

    if preposicao_Com_Artigo.contains(word) {
        artigo_preposicao = true
        return true
    }

    else if preposicao_Masculino.contains(word) {
        masculino_preposicao = true
        return true
    }

    else if preposicao_Masculino_Plural.contains(word) {
        feminino_preposicao = true
        plural_preposicao = true
        return true
    }

    else if preposicao_Feminino.contains(word) {
        feminino_preposicao = true
        return true
    }

    else if preposicao_Feminino_Plural.contains(word) {
        feminino_preposicao = true
        plural_preposicao = true
        return true
    }


    return false
}


func testArtigoAfterPreposicao(word: String) -> (Bool) {

    if artigo_Masculino.contains(word) {
        masculino_preposicao = true
        return true
    }

    else if artigo_Masculino_Plural.contains(word) {
        masculino_preposicao = true
        plural_preposicao = true
        return true
    }

    else if artigo_Feminino.contains(word) {
        feminino_preposicao = true
        return true
    }

    else if artigo_Feminino_Plural.contains(word) {
        feminino_preposicao = true
        plural_preposicao = true
        return true
    }

    return false

}


func testSubstantivoAfterPreposicao(word: String) -> (Bool) {

    if substantivo_Masculino.contains(word) {
        return masculino_preposicao == true && plural_preposicao == false
    }

    else if substantivo_Masculino_Plural.contains(word) {
        return masculino_preposicao == true && plural_preposicao == true
    }

    else if substantivo_Feminino.contains(word) {
        return feminino_preposicao == true && plural_preposicao == false
    }

    else if substantivo_Feminino_Plural.contains(word) {
        return feminino_preposicao == true && plural_preposicao == true
    }

    return false
}


func checkGrammar(sentence: [String]) -> (Bool) {



    guard let firstWord = sentence[safe: 0] else {
        return false
    }

    let boolArtigo = testArtigo(firstWord)

    if boolArtigo == false {
        print("Something is wrong with the artigo: \(firstWord)")
        return false
    }




    guard let secondWord = sentence[safe: 1] else {
        return false
    }

    let boolSubstantivo = testSubstantivo(secondWord)

    if boolSubstantivo == false {
        print("Something is wrong with the substantivo: \(secondWord)")
        return false
    }





    guard let thirdWord = sentence[safe: 2] else {
        return false
    }

    let boolVerbo = testVerbo(thirdWord)

    if boolVerbo == false {
        print("Something is wrong with the verbo: \(thirdWord)")
        return false
    }





    guard let forthWord = sentence[safe: 3] else {
        print("LOOOOL1")
        return true
    }

    let boolPreposicao = testPreposicao(forthWord)

    if boolPreposicao == false {
        print("Something is wrong with the preposicao: \(forthWord)")
        return false
    }

    // Code needs to bifurcate

    if artigo_preposicao {


        guard let fifthWord = sentence[safe: 4] else {
            print("LOOOOL2")
            return true
        }

        let boolArtigoAfterPreposicao = testArtigoAfterPreposicao(fifthWord)

        if boolArtigoAfterPreposicao == false {
            print("Something is wrong with the preposicao: \(fifthWord)")
            return false
        }





        guard let sixthWord = sentence[safe: 5] else {
            print("LOOOOL3")
            return true
        }

        let boolSubstantivoAfterPreposicao = testSubstantivoAfterPreposicao(sixthWord)

        if boolSubstantivoAfterPreposicao == false {
            print("Something is wrong with the preposicao: \(sixthWord)")
            return false
        }


    } else {

        guard let fifthWord = sentence[safe: 4] else {
            print("LOOOOL77777")
            return true
        }

        let boolSubstantivoAfterPreposicao = testSubstantivoAfterPreposicao(fifthWord)

        if boolSubstantivoAfterPreposicao == false {
            print("Something is wrong with the preposicao: \(fifthWord)")
            return false
        }



    }






    return true
}
