//
//  GetProjectsRequestManager.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class GetProjectsRequestManagerResponse: RequestManagerResponse {
   var projects: [ProjectResponse]?
   
   init(projects: [ProjectResponse]?) {
      self.projects = projects
   }
}


class GetProjectsRequestManager: RequestManager {
   
   init() {
      let request = GetProjectsRequest()
      super.init(request: request)
   }
   
   override func responseFromJSON(request: Request, json: [String : Any], completion: @escaping (RequestManagerResponse?, Error?) -> Void) {
      if let response = request.processListResponse(json) as? ProjectListResponse {
         completion(GetProjectsRequestManagerResponse(projects: response.projects), nil)
      } else {
         let error = NSError(domain: "GetProjectsRequestManager", code: 500, description: "Error processing ProjectListResponse")
         completion(nil, error)
      }
   }

}
