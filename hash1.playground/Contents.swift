import Foundation
 
func solution2(_ clothes:[[String]]) -> Int {

    var list = [String:Int]()

    for i in clothes{
        if list.keys.contains(i[1]){
            list[i[1]]! += 1
        }else {
            list[i[1]] = 1
        }
    }

    let priceList = list.map( { (x: String, y: Int) -> Int in return y } )
    
    let count = priceList.reduce(1, {x , y in
        x * (y + 1)
    }) - 1

    print(count)
    return count
}
