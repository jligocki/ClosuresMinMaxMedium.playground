//: Playground - noun: a place where people can play

import UIKit

var score:[Int] = [1,67,88,76,87,92,81,34,76,79,57,48,82,80,90,88,45,88,87,87,59,98,94,99,75]

//print(score)

let maxClosure =
{
    (vals :[Int])->Int in
    var max = vals[0]
    for i in 1..<vals.count
    {
        if vals[i] > max
        {
            max = vals[i]
        }
    }
    return max
}

let minClosure =
{
    (vals :[Int])->Int in
    var min = vals[0]
    for i in 1..<vals.count
    {
        if vals[i] < min
        {
            min = vals[i]
        }
    }
    return min
}

let medianClosure =
{
    (vals :[Int])->Float in
    var median:Float
    
    var n = vals.count
    var even:Bool = n%2 == 0
    
    let valsCopy = vals.sort { return $0 < $1}
    
    print("valsCopy = \(valsCopy)")
    
    if !even
    {
        median = Float(valsCopy[vals.count/2])
    }
    else
    {
        let lValue = valsCopy[valsCopy.count/2-1]
        let rValue = valsCopy[valsCopy.count/2]
        median = ((Float(lValue) + Float(rValue)))/2
    }
    return median
}


let avgClosure =
{
    (vals :[Int])->Float in
    var sum = 0
    for i in 1..<vals.count
    {
        sum += vals[i]
    }
    return Float(sum)/Float(vals.count)
}


func statFunc(mssg:String, _ genClos:([Int])->Any, _ myScore:[Int])->Any
{
    print(mssg)
    let genValue = genClos(myScore)
    return genValue
}

print("MAX VAL: \(statFunc("Sending maxClosure", maxClosure, score))\n")

print("MIN VAL: \(statFunc("Sending minClosure", minClosure, score))\n")

print("AVG VAL: \(statFunc("Sending avgClosure", avgClosure, score))\n")

print("Median VAL: \(statFunc("Sending medianClosure", medianClosure, score))\n")