import Foundation

func printdebug(string: Any) -> () {
    if DEBUG == true {
        print(string)
    }
}

func printfulldebug(string: Any) -> () {
    if FULLDEBUG == true {
        print(string)
    }
}

extension CollectionType {
    // Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
