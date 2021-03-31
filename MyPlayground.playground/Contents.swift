import UIKit

var str = "Hello, playground"

var var1:Int! = 3
var var2:Int? = 5

var result = var1+var2!

print(result)

//
for i in (1...10){
    print(i)
}
for i in (1...10).reversed(){
    print(i)
}

enum Month{
    case Jan (days: Int)
    case Feb (days: Int)
    case Mar (days: Int)
    case April (days: Int)
    case May (days: Int)
    case June (days: Int)
    case July (days: Int)
    case Aug (days: Int)
    case Sep (days: Int)
    case Oct (days: Int)
    case Nov (days: Int)
    case Dec (days: Int)
}

var theMonth = Month.Jan(days: 30)
switch theMonth{
    case .Jan(let myDays): print("Month: Jan, Days: \(myDays)")
    case .Feb(let myDays): print("Month: Feb, Days: \(myDays)")
    case .Mar(let myDays): print("Month: Mar, Days: \(myDays)")
    case .April(let myDays): print("Month: April, Days: \(myDays)")
    case .May(let myDays): print("Month: May, Days: \(myDays)")
    case .June(let myDays): print("Month: June, Days: \(myDays)")
    case .July(let myDays): print("Month: July, Days: \(myDays)")
    case .Aug(let myDays): print("Month: Aug, Days: \(myDays)")
    case .Sep(let myDays): print("Month: Sep, Days: \(myDays)")
    case .Oct(let myDays): print("Month: Oct, Days: \(myDays)")
    case .Nov(let myDays): print("Month: Nov, Days: \(myDays)")
    case .Dec(let myDays): print("Month: Dec, Days: \(myDays)")

}
//mutatung function 如果 Function會改變原本的狀態
//mutating func abc(){}

//computing property: get + set
//if a variable have return inside, it has computing property. get 被省略


