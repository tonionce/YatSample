//
//  ConnectionManager.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class ConnectionManager {
   
   typealias CompletionBlock = (Data?, URLResponse?, Error?) -> Void

   class func request(method: String, urlString: String, additionalHeaders: [String : Any]?, completion: @escaping CompletionBlock) {
      
      guard let url = URL(string: urlString) else {
         let error = NSError(domain: "ConnectionManagerDomain", code: 500, description: "Invalid URL")
         completion(nil, nil, error)
         return
      }
      
      let config = URLSessionConfiguration.default
      config.httpAdditionalHeaders = additionalHeaders
      let session = URLSession(configuration: config)
      
      var request = URLRequest(url: url)
      request.httpMethod = method
      
      let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
         DispatchQueue.main.async {
            completion(data, response, error)
         }
      })
      task.resume()
   }
}
