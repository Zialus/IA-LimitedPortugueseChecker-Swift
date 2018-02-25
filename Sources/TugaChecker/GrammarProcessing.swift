import Foundation

func setEverythingtoFalse() {
    // Set all the global variables to false
    masculino_substantivo = false
    feminino_substantivo = false
    plural_substantivo = false
    artigo_preposicao = false
    masculino_preposicao = false
    feminino_preposicao = false
    plural_preposicao = false
}

func testSentences(_ sentenceList: [[String]]) {

    for (index, sentence) in sentenceList.enumerated() {

        print("Checking sentence \(index+1)...")

        printfulldebug("Contents of the sentece:".lightYellow + "   \(sentence)")

        setEverythingtoFalse()

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

func testArtigo(_ word: String) -> Bool {

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

func testSubstantivo(_ word: String) -> Bool {

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

func testVerbo(_ word: String) -> Bool {

    if verbo.contains(word) {
        return plural_substantivo == false
    }

    else if verbo_Plural.contains(word) {
        return plural_substantivo == true
    }

    return false
}

func testPreposicao(_ word: String) -> Bool {

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

func testArtigoAfterPreposicao(_ word: String) -> Bool {

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

func testSubstantivoAfterPreposicao(_ word: String) -> Bool {

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

func checkGrammar(_ sentence: [String]) -> Bool {

    // Artigo Section

    guard let firstWord = sentence[safe: 0] else {
        return false
    }

    if testArtigo(firstWord) == false {
        print("Something is wrong with the artigo: \(firstWord)")
        return false
    }

    // Substantivo Section

    guard let secondWord = sentence[safe: 1] else {
        return false
    }

    if testSubstantivo(secondWord) == false {
        print("Something is wrong with the substantivo: \(secondWord)")
        return false
    }

    // Verbo Section

    guard let thirdWord = sentence[safe: 2] else {
        return false
    }

    if testVerbo(thirdWord) == false {
        print("Something is wrong with the verbo: \(thirdWord)")
        return false
    }

    // Preposicao Section

    guard let forthWord = sentence[safe: 3] else {
        print("sent(frase_nominal(artigo('\(firstWord)'),substantivo('\(secondWord)')),frase_verbal(verbo('\(thirdWord)'))).")
        printfulldebug("Doesn't have a 4th word")
        return true
    }

    if testPreposicao(forthWord) == false {
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

        if testArtigoAfterPreposicao(fifthWord) == false {
            print("Something is wrong with the preposicao: \(fifthWord)")
            return false
        }

        // Substantivo After Artigo After Preposicao Section

        guard let sixthWord = sentence[safe: 5] else {
            printfulldebug("Doesn't have a 6th word")
            return true
        }

        if testSubstantivoAfterPreposicao(sixthWord) == false {
            print("Something is wrong with the preposicao: \(sixthWord)")
            return false
        }


    } else {

        // Substantivo After Preposicao Section

        guard let fifthWord = sentence[safe: 4] else {
            printfulldebug("Doesn't have a 5th word")
            return false
        }

        if testSubstantivoAfterPreposicao(fifthWord) == false {
            print("Something is wrong with the substantivo: \(fifthWord)")
            return false
        }

        if let sixthWord = sentence[safe: 5] {
            printfulldebug("Found word at position 6: \(sixthWord). But can't have more than 5 words if the 5th word is a substantivo")
            return false
        }
    }

    // Final length checks to decide how many words the sentences have before being printed

    if let seventhWord = sentence[safe: 6] {
        // Sentences with more than 6 words are never valid in this particular grammar
        printfulldebug("Found word at position 7: \(seventhWord). But can't have more than 6 words")
        return false
    }

    guard let fifthWord = sentence[safe: 4] else {
        // Sentenses with 4 words are never valid in this particular grammar
        printfulldebug("Doesn't have a 5th word")
        return false
    }

    guard let sixthWord = sentence[safe: 5] else {
        // If the code got this far, the sentense has 5 words(all valid) but not a 6th one, and can be printed
        printfulldebug("Doesn't have a 6th word")
        print("sent(frase_nominal(artigo('\(firstWord)'),substantivo('\(secondWord)'),frase_verbal(verbo('\(thirdWord)'),preposicao('\(forthWord)'),preposicao_substantivo('\(fifthWord)'))).")
        return true
    }

    // If the code got this far, the sentense has 6 words(all valid) and can be printed
    print("sent(frase_nominal(artigo('\(firstWord)'),substantivo('\(secondWord)'),frase_verbal(verbo('\(thirdWord)'),preposicao('\(forthWord)'),preposicao_artigo('\(fifthWord)'),preposicao_substantivo('\(sixthWord)'))).")

    return true
}
