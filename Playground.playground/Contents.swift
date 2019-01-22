//Max value for random numbers
let universeSize = 60

//Elememnts to sort
let elementsToSort = 6

//Sorted elements
var sortedElements: Set<Int> = []


infix operator ><
/// First operator, this one does not handle selecting already selected numbers,
/// does not handle bigger value on left side,
/// may evenrualy fall into infinity loop
///
/// - Parameters:
///   - lhs: number of elements to be sorted
///   - rhs: max element value to sort
/// - Returns: set of elements sorted
///
func >< (lhs: Int, rhs: Int) -> Set<Int>{
    
    var tempSet: Set<Int> = []
    
    //DoWhile loop
    repeat{
        tempSet.insert(Int.random(in: 0 ... universeSize))
    }while (tempSet.count < lhs)
    
    return tempSet
}

sortedElements = 6 >< 60
print (sortedElements)

infix operator >=<
/// Second operator, this one does handle selecting already selected numbers,
/// does sort the values,
/// does handle bigger number on left
///
/// - Parameters:
///   - lhs: number of elements to be sorted
///   - rhs: max element value to sort
/// - Returns: set of elements sorted
///
func >=< (lhs: Int, rhs: Int) -> Set<Int>?{
    
    if lhs > rhs {
        return nil
    }
    
    //Creates and fills an array with all values on the selected universe
    //This avoids falling into infinite loop
    var universeSet: [Int] = []
    
    //Swift for loop
    for i in 1...rhs{
        
        universeSet.append(i)
    }
    
    var tempSet: Set<Int> = []
    
    //DoWhile loop
    repeat{
        
        let chosen = Int.random(in: 0 ... (universeSet.count-1))
        
        tempSet.insert(universeSet.remove(at: chosen-1))
        universeSet.remove(at: chosen-1)
        
    }while (tempSet.count < lhs)
    
    return tempSet
}



if let sortedElements = 9>=<60{
    print (sortedElements)
} else {
    print ("Something went wrong")
}

