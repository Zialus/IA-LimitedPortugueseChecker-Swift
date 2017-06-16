import Foundation

func printdebug(_ string: Any) {
    if DEBUG == true {
        print(string)
    }
}

func printfulldebug(_ string: Any) {
    if FULLDEBUG == true {
        print(string)
    }
}

// Returns the element at the specified index if it is within bounds, otherwise nil.
extension Array {
    subscript(safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
