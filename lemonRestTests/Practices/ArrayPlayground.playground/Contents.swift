import UIKit
import Foundation

struct ArrayDemos {
    static func creationAndBasics() {
        let emptyArray: [Int] = []
        let preInitializedArray: [1, 2, 3]
        let repeatedArray = Array(repeating: "N/A", count: 5)
        
        var a = [10, 20, 30]
        //remove by position not value. values can be repeated
        a.append(40)
        a.append(50)
        
        a.insert(30, at: 30)
        
        a.remove(at: 1)
        
        print(a)
    }
    
    static func transformers(){
        let nums = [1,2,3,4,5,6]
        let evenNums = nums.filter { $0.isMultiple(of:2) }
        let squareNums = nums.map { $0 * $0 }
        let sumNums = nums.reduce(0, +)
        
        let strings = ["1", "a", "2", "b", "3", "y"]
        let values = strings.compactMap(Int.init)
        print("compactMap Int:", values)
    }
    static func sorting() {
        var a = [5, 1, 3, 3, 4, 2]
        let sortedA = a.sorted();
        
        print(sortedA)
        print (a)
        
    }
}

ArrayDemos.creationAndBasics()
























