//
//  DateExtension.swift
//  YatSample
//
//  Created by Viedma, Antonio on 23/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import Foundation

extension Date {
   
   func stringFromDate(_ date: Date, format: String) -> String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = format
      return dateFormatter.string(from: date)
   }

   
   func dateFromString(_ date: String, format: String) -> Date {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = format
      return dateFormatter.date(from: date) ?? Date()
   }
}
