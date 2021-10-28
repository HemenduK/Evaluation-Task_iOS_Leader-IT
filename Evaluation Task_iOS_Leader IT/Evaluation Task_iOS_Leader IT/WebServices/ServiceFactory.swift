//
//  ServiceFactory.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 26/10/21.
//

import UIKit

class ServiceFactory: NSObject {
    
    typealias CallbackGet = ([[String : Any]]?, Error?, Bool) -> Void

    func callGETWithURL(strURL: String?, parameters: [String : Any]?, callBack:@escaping CallbackGet) {
        var responseArr: [[String : Any]] = [[:]]
        
        let url = URL(string: strURL ?? "")
        
        var request: URLRequest? = nil
        if let url = url {
            request = URLRequest(url: url)
        }
        
        request?.httpMethod = "GET"
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        sessionConfiguration.timeoutIntervalForRequest = 60
        
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
        if let urlRequest = request
        {
            let sessionDataTask = session.dataTask(with: urlRequest) { data, response, error in
                guard let data = data,
                    let response = response as? HTTPURLResponse,
                    error == nil else {                                              // check for fundamental networking error
                        print("error", error ?? "Unknown error")
                        return
                }
                
                do {
                    let jsonDictionary =  try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                    responseArr = jsonDictionary as! [[String : Any]]
                    if (response.statusCode >= 200 && response.statusCode <= 299)
                    {
                        callBack(responseArr, nil, true)
                    }
                    else
                    {
                        callBack(responseArr, error, false)
                    }
                } catch {
                    callBack(nil, error, false)
                }
            }
            sessionDataTask.resume()
        }
    }
}
