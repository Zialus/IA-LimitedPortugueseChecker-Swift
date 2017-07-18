import Foundation

func readInput() -> ([[String]]) {

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

func testSentences(_ sentenceList: [[String]]) -> () {

    for (index, sentence) in sentenceList.enumerated() {

        print("Checking sentence \(index+1)...")

        printfulldebug("Contents of the sentece:".lightYellow + "   \(sentence)")

        // Set all the global variables to false
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
            print("Valid sentence".lightGreen)
        case false:
            print("Invalid sentence".red)
        }
        print()

    }

}

func testArtigo(_ word: String) -> (Bool) {

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

func testSubstantivo(_ word: String) -> (Bool) {

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

func testVerbo(_ word: String) -> (Bool) {

    if verbo.contains(word) {
        return plural_substantivo == false
    }

    else if verbo_Plural.contains(word) {
        return plural_substantivo == true
    }

    return false
}

func testPreposicao(_ word: String) -> (Bool) {

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

func testArtigoAfterPreposicao(_ word: String) -> (Bool) {

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

func testSubstantivoAfterPreposicao(_ word: String) -> (Bool) {

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

func checkGrammar(_ sentence: [String]) -> (Bool) {

    // Artigo Section

    guard let firstWord = sentence[safe: 0] else {
        return false
    }

    let boolArtigo = testArtigo(firstWord)

    if boolArtigo == false {
        print("Something is wrong with the artigo: \(firstWord)")
        return false
    }

    // Substantivo Section

    guard let secondWord = sentence[safe: 1] else {
        return false
    }

    let boolSubstantivo = testSubstantivo(secondWord)

    if boolSubstantivo == false {
        print("Something is wrong with the substantivo: \(secondWord)")
        return false
    }

    // Verbo Section

    guard let thirdWord = sentence[safe: 2] else {
        return false
    }

    let boolVerbo = testVerbo(thirdWord)

    if boolVerbo == false {
        print("Something is wrong with the verbo: \(thirdWord)")
        return false
    }

    // Preposicao Section

    guard let forthWord = sentence[safe: 3] else {
        print("sent(frase_nominal(artigo('\(firstWord)'),substantivo('\(secondWord)')),frase_verbal(verbo('\(thirdWord)'))).")
        printfulldebug("Doesn't have a 4th word")
        return true
    }

    let boolPreposicao = testPreposicao(forthWord)

    if boolPreposicao == false {
        print("Something is wrong with the preposicao: \(forthWord)")
        return false
    }


    // Code needs to bifurcate based on wether the "preposicao" allows for an "artigo" after it it or doesn't

    if artigo_preposicao {

        // Artigo After Preposicao Section

        guard let fifthWord = sentence[safe: 4] else {
            printfulldebug("Doesn't have a 5th word")
            return false
        }

        let boolArtigoAfterPreposicao = testArtigoAfterPreposicao(fifthWord)

        if boolArtigoAfterPreposicao == false {
            print("Something is wrong with the preposicao: \(fifthWord)")
            return false
        }

        // Substantivo After Artigo After Preposicao Section

        guard let sixthWord = sentence[safe: 5] else {
            printfulldebug("Doesn't have a 6th word")
            return true
        }

        let boolSubstantivoAfterPreposicao = testSubstantivoAfterPreposicao(sixthWord)

        if boolSubstantivoAfterPreposicao == false {
            print("Something is wrong with the preposicao: \(sixthWord)")
            return false
        }


    } else {

        // Substantivo After Preposicao Section

        guard let fifthWord = sentence[safe: 4] else {
            printfulldebug("Doesn't have a 5th word")
            return false
        }

        let boolSubstantivoAfterPreposicao = testSubstantivoAfterPreposicao(fifthWord)

        if boolSubstantivoAfterPreposicao == false {
            print("Something is wrong with the preposicao: \(fifthWord)")
            return false
        }


    }

    // Final length checks to decide how many words the sentenses have before being printed

    guard let fifthWord = sentence[safe: 4] else {
        // Sentenses with 4 words are never valid in this particular grammar
        printfulldebug("Doesn't have a 5th word")
        return false
    }

    guard let sixthWord = sentence[safe: 5] else {
        // If the code got this far the sentense has 5 words but not 6 and can be printed
        printfulldebug("Doesn't have a 6th word")
        print("sent(frase_nominal(artigo('\(firstWord)'),substantivo('\(secondWord)'),frase_verbal(verbo('\(thirdWord)'),preposicao('\(forthWord)'),preposicao_artigo('\(fifthWord)'))).")
        return true
    }

    // If I got this far the sentense has 6 words and can be printed
    print("sent(frase_nominal(artigo('\(firstWord)'),substantivo('\(secondWord)'),frase_verbal(verbo('\(thirdWord)'),preposicao('\(forthWord)'),preposicao_artigo('\(fifthWord)'),preposicao_substantivo('\(sixthWord)'))).")

    return true
}
