import UIKit

public func solution(_ H : [Int]) -> Int {
    let buildings = H
    var sortedBuildings: [Int] = []
    var maxRight = Int.min
    let length = H.count
    for i in 0...length-1 {
        let rightBuilding = H[length-i-1]
        maxRight = max(rightBuilding, maxRight)
        sortedBuildings.append(maxRight)
    }
    sortedBuildings = sortedBuildings.reversed()
    sortedBuildings.append(0)
    var maxLeft = Int.min
    var minArea = Int.max
    let baseLength = buildings.count
    var index = 0
    for height in buildings {
        let leftBase = index+1
        maxLeft = max(height, maxLeft)
        let maxRight = sortedBuildings[leftBase]
        let area = (leftBase * maxLeft) + ((baseLength - leftBase) * maxRight)
        minArea = min(minArea,area)
        index += 1
    }
    return minArea
}
