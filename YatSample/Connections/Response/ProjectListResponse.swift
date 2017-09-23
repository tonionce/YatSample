//
//  ProjectListResponse.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

class ProjectListResponse: Response {
   var projects: [ProjectResponse]
   
   required init(json: ListJSON) {
      projects = []
      for item in json {
         if let itemJSON = item as? JSON, let project = ProjectResponse(json: itemJSON) {
            projects.append(project)
         }
      }
   }
}
