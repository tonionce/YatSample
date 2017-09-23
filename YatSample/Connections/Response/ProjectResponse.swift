//
//  ProjectResponse.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import Foundation

class ProjectResponse: Response {
   let id: String
   let name: String
   let company: String
   let start: Date
   let end: Date
   let description: String
   
   required init?(json: JSON) {
      guard
         let id: String = json["id"] as? String,
         let name: String = json["name"] as? String,
         let companyDict = json["company"] as? [String : Any],
         let company: String = companyDict["name"] as? String,
         let start: String = json["startDate"] as? String,
         let end: String = json["endDate"] as? String,
         let description: String = json["description"] as? String
      
         else {
            self.id = ""
            self.name = ""
            self.company = ""
            self.start = Date()
            self.end = Date()
            self.description = ""
            super.init()
            return nil
      }
      
      self.id = id
      self.name = name
      self.company = company
      self.start = Date().dateFromString(start, format: "yyyyMMdd")
      self.end = Date().dateFromString(end, format: "yyyyMMdd")
      self.description = description
      super.init()
   }
   
   
}
