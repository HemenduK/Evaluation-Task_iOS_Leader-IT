//
//  WebserviceManager.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 26/10/21.
//

import UIKit

class WebserviceManager: NSObject {
    typealias usersCallback = ([UsersModel]?,Bool,String) -> Void

    func getUsersDetails(OnCompletion:@escaping usersCallback)
    {
        let url = "https://jsonplaceholder.typicode.com/users"
        ServiceFactory().callGETWithURL(strURL: url, parameters: nil) { (responseDetails, error, successStatus) in
            
            if(successStatus)
            {
                if let dictResponse = responseDetails
                {
                    var arrUsers: [UsersModel] = [UsersModel]()

                    for dicUsers in dictResponse
                    {
                        let userModel = UsersModel(fromDictionary: dicUsers)
                        arrUsers.append(userModel)
                    }
                    OnCompletion(arrUsers, true, "")
                }
                else
                {
                    OnCompletion(nil,false,"")
                }
                
            }
            else
            {
                OnCompletion(nil,false,"")
            }
            
        }
    }
}
