//
//  GetProjectTasksRequest.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

class GetProjectTasksRequest: Request {
   
   init(projectId: String) {
      super.init(path: "/projects/\(projectId)/tasks.json")
   }
   
   override func processListResponse(_ data: JSON) -> Response? {
      guard let json = data["todo-items"] as? ListJSON else {
         return nil
      }
      return TaskListResponse(json: json)
   }
}
