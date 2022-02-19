import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var lists = [String:[Int]]()
    
    for i in 0...genres.count - 1{
        if lists.keys.contains(genres[i]){
            lists[genres[i]]!.append(plays[i])
        }else{
            lists[genres[i]] = [plays[i]]
        }
    }
    
    print(lists)
    
    var countedList = [String:Int]()
    for list in lists.keys{
        countedList[list] = lists[list]!.reduce(0, {x,y in return x+y})
    }
    print(countedList)
    
    let sortedList = countedList.sorted{$0.value > $1.value}
    print(sortedList)

    var answer:[Int] = []
    for i in sortedList{
        let sortedInSameGenre = lists[i.key]!.sorted{$0 > $1}
        print(sortedInSameGenre)
        
        if sortedInSameGenre.count == 1{
            let index = plays.firstIndex(where: {$0 == sortedInSameGenre[0]})!
            answer.append(index)
        }else{
            for j in 0...1{
                var index = 0
                if j == 0 {
                    index = plays.firstIndex{ $0 == sortedInSameGenre[j] }!
                }else{
                    index = plays.lastIndex{ $0 == sortedInSameGenre[j] }!
                }
                answer.append(index)
            }
        }
      }
    
    print(answer)
    return answer
}
