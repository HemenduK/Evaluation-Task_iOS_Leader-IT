//
//  CommonUtility.swift
//  Evaluation Task_iOS_Leader IT
//
//  Created by Hemendu.Kathiriya on 28/10/21.
//

import UIKit

class CommonUtility: NSObject {
    
    var reachability: Reachability? = Reachability(hostname: "google.com")

    //MARK:- Internet connectivity check methods
    func isNetworkConnected() -> Bool
    {
        if let reachabilityUnwrapped = reachability
        {
            return reachabilityUnwrapped.isConnected
        }
        return false
    }
    
    
}
