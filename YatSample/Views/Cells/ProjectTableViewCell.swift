//
//  ProjectTableViewCell.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
   
   @IBOutlet private weak var nameLabel: UILabel!
 
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   func updateWithProject(_ project: ProjectResponse) {
      nameLabel.text = project.name
   }
   
}
