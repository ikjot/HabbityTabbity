//
//  HTHelper.swift
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/30/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit
import SystemConfiguration
import MobileCoreServices
import CoreTelephony

class HTHelper: NSObject {
    
    class func isInternetConnected() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
            
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable: Bool = flags.contains(.reachable)
        let needsConnection: Bool = flags.contains(.connectionRequired)
        let isConnectivity: Bool = (isReachable && !needsConnection)
      
        return isConnectivity
    }

}
