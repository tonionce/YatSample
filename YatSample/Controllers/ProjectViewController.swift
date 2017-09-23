//
//  ProjectViewController.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

enum ProjectInfo: Int {
   case name, company, start, end, tasks
}

class ProjectViewController: UIViewController {
 
   @IBOutlet private weak var tableView: UITableView!
   @IBOutlet private weak var loadingView: LoadingView!
   
   var project: ProjectResponse?
   
   fileprivate var tasks: [TaskResponse]?
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
      setUpTableView()
      
      if let project = project {
         self.retrieveTasks(projectId: project.id)
      }
   }
   
   private func setUpTableView() {
      tableView.register(UINib(nibName: String(describing: DefaultTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DefaultTableViewCell.self))
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   private func retrieveTasks(projectId: String) {
      let requestManager = GetProjectTasksRequestManager(projectId: projectId)
      loadingView.show()
      requestManager.makeRequest { (managerResponse, error) in
         self.loadingView.hide()
         if let response = managerResponse as? GetProjectTasksRequestManagerResponse {
            self.tasks = response.tasks
            self.tableView.reloadData()
         }
      }
   }
}

extension ProjectViewController: UITableViewDataSource {
   
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DefaultTableViewCell.self)) as! DefaultTableViewCell
      
      if let project = project, let projectInfo = ProjectInfo(rawValue: indexPath.row) {
         switch projectInfo {
         case .name:
            cell.updateWithText("Name", detailText: project.name)
         case .company:
            cell.updateWithText("Company", detailText: project.company)
         case .start:
            let detail = Date().stringFromDate(project.start, format: "dd-MM-yyyy")
            cell.updateWithText("Start Date", detailText: detail)
         case .end:
            let detail = Date().stringFromDate(project.end, format: "dd-MM-yyyy")
            cell.updateWithText("End Date", detailText: detail)
         case .tasks:
            cell.updateWithText("Number of tasks", detailText: "\(tasks?.count ?? 0)")
         }
      }
      
      return cell
   }
   
   func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
      return project?.description
   }

}

extension ProjectViewController: UITableViewDelegate {
   
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 10
   }
}
