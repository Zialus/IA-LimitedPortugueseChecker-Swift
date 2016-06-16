import Foundation

func printdebug(_ string: Any) -> () {
    if DEBUG == true {
        print(string)
    }
}

func printfulldebug(_ string: Any) -> () {
    if FULLDEBUG == true {
        print(string)
    }
}

extension Array {
    // Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
