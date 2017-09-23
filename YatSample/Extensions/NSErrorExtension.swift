//
//  NSErrorExtension.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import Foundation

extension NSError {
   
   convenience init(domain: String, code: Int, description: String) {
      let userInfo = [NSLocalizedDescriptionKey: description]
      self.init(domain: domain, code: code, userInfo: userInfo)
   }
}
