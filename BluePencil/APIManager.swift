//
//  APIManager.swift
//  BluePencil
//
//  Created by Moritz Scholz on 18.06.16.
//  Copyright © 2016 mm. All rights reserved.
//

import Foundation
import FBSDKLoginKit

struct FacebookRegistrationData {
  // Facebook Access Token
  var token:FBSDKAccessToken?
  // User data
  var userID:String           = ""
  var email:String            = ""
  var firstName:String        = ""
  var lastName:String         = ""
  //var profilePicture:UIImage?   // TODO: <- should be uploaded to our server.
}


class APIManager {
  static let sharedInstance = APIManager()
  let baseURL = "http://localhost/api/v1"

  // Registration
  func registerUserWithFacebookData(fbData: FacebookRegistrationData,
                                    completion:(success:Bool, message:String?, token:String?) -> () ) {
    guard let fbToken = fbData.token else  {
      // No FB registration token.
      // TODO: Handle error.
      return
    }
    
    if (!fbData.userID.isEmpty && !fbData.email.isEmpty && !fbData.firstName.isEmpty && !fbData.lastName.isEmpty) {
      // Data available, register user.
      
      // Build parameter dictionary.
      let params:[String:String] = ["fbUserID":fbData.userID,
                    "fbUserEmail":fbData.email,
                    "fbUserFirstName":fbData.firstName,
                    "fbUserLastName":fbData.lastName,
                    "fbToken":fbToken.tokenString]
      
      // Build request.
      guard let request = urlRequest("/login", params: params) else {
        completion(success: false, message: "Could not create API request", token: nil)
        return
      }
      
      // Make API call.
      post(request, completion: { (success, object) in
        // Check if successful and if yes, get access token.
        if (success)  {
          // TODO: Get token
          completion(success: true, message: nil, token: "123") // TODO <- Token
        }
        else {
          completion(success: false, message: "Could not call API", token: nil)
        }
      })
      
      
    }
    else {
      // Data incomplete
      completion(success: false, message: "Incomplete user data", token: nil)
    }
  }
  
  // MARK: API-Communication
  // Roughly followed this website: https://thatthinginswift.com/write-your-own-api-clients-swift/
  // Sends a request to the API.
  private func dataTask(request: NSMutableURLRequest,
                        method:String,
                        completion: (success:Bool, object:AnyObject?) -> ())  {
    request.HTTPMethod = method
    
    // Build session
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    // Execute datatask
    session.dataTaskWithRequest(request) { (data, response, error) in
      if let data = data {
        // Data received
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode { // TODO: Which response codes do we use?
          completion(success: true, object: json)
        }
        else {
          // Response code reported unsuccesful
          completion(success: false, object: json)
        }
      }
    }.resume()
  }
  
  // Sends a POST-Request to the API.
  private func post(request: NSMutableURLRequest,
                    completion: (success:Bool, object:AnyObject?) -> ()) {
    dataTask(request, method: "POST", completion: completion)
  }
  
  // Sends a GET-Request to the API.
  private func get(request: NSMutableURLRequest,
                    completion: (success:Bool, object:AnyObject?) -> ()) {
    dataTask(request, method: "GET", completion: completion)
  }
  
  // Builds a request with data to send.
  private func urlRequest(endPoint:String, params:Dictionary<String, String>? = nil) -> NSMutableURLRequest? {
    guard let url = NSURL(string:baseURL + endPoint) else {
      return nil
    }
    
    // Build request
    let request = NSMutableURLRequest(URL: url)
    
    // Add JSON object
    if let params = params {
      request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
      do {
        let json = try NSJSONSerialization.dataWithJSONObject(params, options: [])
        request.HTTPBody = json
      }
      catch let error as NSError {
        // JSON Serialization Error
        print(error)
        return nil
      }
    }
    
    /* URL Parameters:
    // Add parameters
    if let params = params {
      // TODO - do we want to do it in this way?
      var paramString = ""
      for (k, v) in params {
        paramString = paramString + "\(k.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet()))=\(v.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet()))&"
      }
      
      request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
      request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
    }
 */
    
    // TODO: Authorization via token?
    /*
     if let token = token {
     request.addValue("Bearer "+token, forHTTPHeaderField: "Authorization")
     }
     */
 
    return request
  }
  
  

}