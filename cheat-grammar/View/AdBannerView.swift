//
//  AdBannerView.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/10/17.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class AdBannerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        let nib = UINib(nibName: "AdBannerView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        addSubview(view)
        setupBanner()
    }
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    func setupBanner() {
        bannerView.adUnitID = AdManager.adBannerId
        bannerView.load(GADRequest())
    }
    
}
