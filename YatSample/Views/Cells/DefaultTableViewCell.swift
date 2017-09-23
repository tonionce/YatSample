//
//  DefaultTableViewCell.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {
   
   @IBOutlet private weak var mainLabel: UILabel!
   @IBOutlet private weak var detailLabel: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   func updateWithText(_ text: String, detailText: String) {
      mainLabel.text = text
      detailLabel.text = detailText
   }
   
}
