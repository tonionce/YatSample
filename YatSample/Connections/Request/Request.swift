//
//  Request.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

enum HTTPMethod: String {
   case get = "GET"
}

class Request {
   
   let method: HTTPMethod
   let path: String
   
   init(method: HTTPMethod = .get, path: String) {
      self.method = method
      self.path = path
   }
   
   func processListResponse(_ data: [String : Any]) -> Response? {
      return nil
   }
}
