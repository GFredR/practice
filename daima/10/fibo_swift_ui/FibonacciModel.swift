

import Foundation

public class FibonacciModel {
    
    public init () {}
    
    public func calculateFibonacciNumbers (minimum2 endOfSequence:Int) -> Array<Int> {
        
        //Declaring a stored property with initial values
        var sequence : [Int] = [1,1]
        
        for number in 2..<endOfSequence {
            
            let newFibonacciNumber = sequence[number-1] + sequence[number-2]
            sequence.append(newFibonacciNumber)
        }
        
        return sequence
    }
    
}
