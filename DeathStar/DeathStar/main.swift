//
//  main.swift
//  DeathStar
//
//  Created by Sam Meech-Ward on 2018-03-30.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation

print("Hello, World!")

//DispatchQueue.main.sync {
//  print("done")
//}

//
//func powerUpLazer() {
//  sleep(5)
//  print("Lazer powered up")
//}
//
//let backgroundQueue = DispatchQueue.global(qos: .utility)
//backgroundQueue.async {
//  powerUpLazer()
//}
//
//DispatchQueue.global(qos: .background).async {
//  print("I'm on another queue")
//}
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//  // your code here
//  print("2 seconds later")
//}
//
//print("Important work that has to be done now")


let vader = DarthVader()

let group = DispatchGroup()

for i in 0...1000 {
  group.enter()
  DispatchQueue.global(qos: .utility).async {
    vader.favouriteQuote = "I find your lack of faith disturbing \(i)"
    group.leave()
  }
}

group.notify(queue: DispatchQueue.main) {
  print(vader.favouriteQuote)
  print(vader.setTimes)
}
print(vader.setTimes)

print("Very important task")

RunLoop.main.run()
