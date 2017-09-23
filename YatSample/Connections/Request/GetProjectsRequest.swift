//
//  GetProjectsRequest.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

class GetProjectsRequest: Request {
   
   init() {
      super.init(path: "/projects.json")
   }
   
   override func processListResponse(_ data: JSON) -> Response? {
      guard let json = data["projects"] as? ListJSON else {
         return nil
      }
      return ProjectListResponse(json: json)
   }
   
}
