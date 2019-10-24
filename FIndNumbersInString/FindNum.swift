func findNumbers(str:String) -> [Int]{
    var nums = [Int]()
    var isDigitStarted:Bool = false
    var sum = 0
    var counter = 0
    for i in str{
        
        if let val = Int("\(i)"){
               sum = sum * 10 + val
               isDigitStarted = true
               if counter == str.count - 1{
                nums.append(sum)
               }
        }
        else{
            if isDigitStarted{
                nums.append(sum)
                isDigitStarted = false
                sum = 0
            }
        }
        counter += 1
    }
    return nums
}
