//
//  RehearsalTableViewCell.swift
//  cheat-grammar
//
//  Created by nonakashiho on 2020/11/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

class RehearsalTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func tapBuyButton(_ sender: Any) {
    }
    
}
