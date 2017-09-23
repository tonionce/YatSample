//
//  ViewController.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   var projects: [ProjectResponse]?
   
   @IBOutlet private weak var loadingView: LoadingView!
   @IBOutlet private weak var tableView: UITableView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.title = "My projects"
      setUpTableView()
      retrieveProjects()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
   }
   
   private func setUpTableView() {
      tableView.register(UINib(nibName: String(describing: ProjectTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProjectTableViewCell.self))
   }
   
   private func retrieveProjects() {
      let requestManager = GetProjectsRequestManager()
      loadingView.show()
      
      requestManager.makeRequest { (managerResponse, error) in
         self.loadingView.hide()
         if let response = managerResponse as? GetProjectsRequestManagerResponse {
            self.projects = response.projects?.sorted { $0.name < $1.name }
            self.tableView.reloadData()
         }
      }
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

}

extension ViewController: UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return projects?.count ?? 0
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProjectTableViewCell.self)) as! ProjectTableViewCell
      cell.accessoryType = .disclosureIndicator
      if let project = projects?[indexPath.row] {
         cell.updateWithProject(project)
      }
      return cell
   }
}

extension ViewController: UITableViewDelegate {
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if let project = projects?[indexPath.row], let vc = storyboard?.instantiateViewController(withIdentifier: "ProjectViewController") as? ProjectViewController {
         vc.project = project
         navigationController?.pushViewController(vc, animated: true)
      }
      tableView.deselectRow(at: indexPath, animated: true)
   }
}

