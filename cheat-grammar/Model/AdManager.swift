//
//  AdManager.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/11/01.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import GoogleMobileAds

class AdManager: NSObject {
    static let sharedInstance = AdManager()
    static var interstitial: GADInterstitial!
    static let adInterstitialID = fetchAdInterstitialID()
    static let adBannerId = fetchAdBannerID()
    
    static func fetchAdInterstitialID() -> String {
        if let dict = Bundle.main.infoDictionary {
            let adUnitDic = dict["AdUnitIdDictionary"] as? [String:String]
            return adUnitDic?["AdInterstitialId"] ?? ""
        }
        return ""
    }
    static func fetchAdBannerID() -> String {
        if let dict = Bundle.main.infoDictionary {
            let adUnitDic = dict["AdUnitIdDictionary"] as? [String:String]
            return adUnitDic?["AdBannerId"] ?? ""
        }
        return ""
    }
    
    func createAndLoadInterstitial() {
        AdManager.interstitial = GADInterstitial(adUnitID: AdManager.adInterstitialID)
        AdManager.interstitial.load(GADRequest())
    }
    
    func decideIfShowInterstitial() -> Bool {
        // 25%の確率で広告を出す
        let randomInt = Int.random(in: 0..<4)
        if AdManager.interstitial.isReady && randomInt == 0 {
            return true
        }
        return false
    }
    
}
