//
//  DarthVader.swift
//  DeathStar
//
//  Created by Sam Meech-Ward on 2018-03-30.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation

class DarthVader {
  
  let queue = DispatchQueue(label: "com.LHL.favouriteQuote", qos: .utility, attributes: .concurrent)
  
  var setTimes = 0
  var favouriteQuote: String {
    get {
      var tmp = ""
      queue.sync {
        tmp = self._favouriteQuote
      }
      return tmp
    }
    set {
      queue.async(flags: .barrier) {
        self._favouriteQuote = newValue
        self.setTimes += 1
      }
    }
  }
  private var _favouriteQuote = ""
}
