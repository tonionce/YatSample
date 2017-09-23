//
//  TaskResponse.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

class TaskResponse: Response {
   let id: Int
   let content: String
   
   required init?(json: JSON) {
      guard
         let id: Int = json["id"] as? Int,
         let content: String = json["content"] as? String
         else {
            self.id = 0
            self.content = ""
            super.init()
            return nil
      }
      
      self.id = id
      self.content = content
      super.init()
   }
}
