//
//  GetProjectTasksRequestManager.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class GetProjectTasksRequestManagerResponse: RequestManagerResponse {
   var tasks: [TaskResponse]?
   
   init(tasks: [TaskResponse]?) {
      self.tasks = tasks
   }
}

class GetProjectTasksRequestManager: RequestManager {
   
   init(projectId: String) {
      let request = GetProjectTasksRequest(projectId: projectId)
      super.init(request: request)
   }
   
   override func responseFromJSON(request: Request, json: [String : Any], completion: @escaping (RequestManagerResponse?, Error?) -> Void) {
      if let response = request.processListResponse(json) as? TaskListResponse {
         completion(GetProjectTasksRequestManagerResponse(tasks: response.tasks), nil)
      } else {
         let error = NSError(domain: "GetProjectTasksRequestManager", code: 500, description: "Error processing TaskListResponse")
         completion(nil, error)
      }
   }

}
