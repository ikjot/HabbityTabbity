//
//  NRActivityView.swift
//  HabbityTabbity
//
//  Created by Ikjot Kaur on 3/15/18..
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit
import BRYXBanner

class NRActivityView: NSObject {

    class func showBannerMessage(_ title: String?, isSuccess: Bool) {
        DispatchQueue.main.async {
            let bannerTitle = title == nil ? "" : title!
            let banner = Banner(title: "", subtitle:bannerTitle, image: nil, backgroundColor: isSuccess ? UIColor.ht_bannerSuccesBackgroundColor() : UIColor.ht_bannerErrorBackgroundColor())
            banner.dismissesOnTap = true
            banner.show(duration: bannerDuration)
        }
    }
    class func showLongBannerMessage(_ title: String?, isSuccess: Bool) {
        DispatchQueue.main.async {
            let bannerTitle = title == nil ? "" : title!
            let banner = Banner(title: "", subtitle:bannerTitle, image: nil, backgroundColor: isSuccess ? UIColor.ht_bannerSuccesBackgroundColor() : UIColor.ht_bannerErrorBackgroundColor())
            banner.dismissesOnTap = true
            banner.show(duration: 2 * bannerDuration)
        }
    }




}
