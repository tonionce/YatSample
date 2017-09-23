//
//  TaskListResponse.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

class TaskListResponse: Response {
   var tasks: [TaskResponse]
   
   required init(json: ListJSON) {
      tasks = []
      for item in json {
         if let itemJSON = item as? JSON, let task = TaskResponse(json: itemJSON) {
            tasks.append(task)
         }
      }
   }
}
