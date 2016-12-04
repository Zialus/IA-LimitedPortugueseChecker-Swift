import Foundation
import Rainbow

// Store debug information that will be given by cmdLine Args
var DEBUG = false
var FULLDEBUG = false

proccessCmdLineArgs()

// --------------------START DATABASE------------------------- //
let artigo_Masculino_Maiusculo = ["O"]
let artigo_Masculino_Plural_Maiusculo = ["Os"]
let artigo_Masculino = ["o"]
let artigo_Masculino_Plural = ["os"]

let artigo_Feminino_Maiusculo = ["A"]
let artigo_Feminino_Plural_Maiusculo = ["As"]
let artigo_Feminino = ["a"]
let artigo_Feminino_Plural = ["as"]

let substantivo_Masculino = ["cacador", "sino", "lobo", "tempo", "rio", "vento", "rosto", "mar", "cachorro", "tambor", "martelo", "campo", "menino"]
let substantivo_Masculino_Plural = ["cacadores", "sinos", "lobos", "rios", "ventos", "rostos", "mares", "cachorros", "tambores", "martelos", "campos", "meninos"]
let substantivo_Feminino = ["menina", "noticia", "lagrima", "vida", "porta", "floresta", "mae", "cidade"]
let substantivo_Feminino_Plural = ["meninas", "noticias", "lagrimas", "portas", "florestas", "maes", "cidades"]

let verbo = ["correu", "corria", "corre", "bate", "batia", "bateu"]
let verbo_Plural = ["correram", "correm", "corriam", "batiam", "batem", "bateram"]

let preposicao_Com_Artigo = ["para", "com"]
let preposicao_Masculino = ["pelo", "no", "o"]
let preposicao_Feminino = ["pela", "na", "a"]
let preposicao_Masculino_Plural = ["pelos", "nos"]
let preposicao_Feminino_Plural = ["pelas", "nas"]
// --------------------END DATABASE------------------------- //


// Global Variables to be used while checking the grammar //
var masculino_substantivo = false
var feminino_substantivo = false
var plural_substantivo = false

var artigo_preposicao = false

var masculino_preposicao = false
var feminino_preposicao = false
var plural_preposicao = false
// Very Hacky I know...but it is what it is... //

welcomeMessage()

let sentenceList = readInput()
printdebug("\nList of sentences:".lightYellow + " \(sentenceList)\n")
testSentences(sentenceList)

goodbyeMessage()
