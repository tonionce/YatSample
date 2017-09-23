//
//  RequestManager.swift
//  YatSample
//
//  Created by Viedma, Antonio on 22/09/2017.
//  Copyright © 2017 Antonio Viedma. All rights reserved.
//

import UIKit

class RequestManager {

   let baseURL = "https://yat.teamwork.com"
   
   let username = "twp_TEbBXGCnvl2HfvXWfkLUlzx92e3T"
   let password = "X"
   
   let request: Request
   
   init(request: Request) {
      self.request = request
   }
   
   // MARK: - Request
   
   private func composeURL() -> String {
      return "\(baseURL)\(request.path)"
   }
   
   private func composeAdditionalHeaders() -> [String : Any]? {
      let authValue = "\(username):\(password)".data(using: String.Encoding.utf8)?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
      if let value = authValue {
         return ["Authorization" : "Basic \(value)"]
      } else {
         return nil
      }
   }
   
   func makeRequest(_ completion: @escaping (RequestManagerResponse?, Error?) -> Void) {
      ConnectionManager.request(method: request.method.rawValue, urlString: composeURL(), additionalHeaders: composeAdditionalHeaders()) { (data, response, error) in
         
         if let error = error {
            completion(nil, error)
            return
         }
         
         guard let json = self.processData(data) else {
            let error = NSError(domain: "RequestManagerDomain", code: 500, description: "Error converting data to JSON")
            completion(nil, error)
            return
         }
         
         self.responseFromJSON(request: self.request, json: json, completion: { (managerResponse, error) in
            completion(managerResponse, error)
         })
      }
   }
   
   // MARK: - Parse
   
   private func processData(_ data: Data?) -> [String: Any]? {
      var json: [String: Any]?
      if let jsonData = data {
         do {
            json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : Any]
         } catch {
            print("Error trying to convert data to JSON")
         }
      }
      return json
   }
   
   func responseFromJSON(request: Request, json: [String : Any], completion: @escaping (RequestManagerResponse?, Error?) -> Void) {
      preconditionFailure("Must override")
   }
   
}
