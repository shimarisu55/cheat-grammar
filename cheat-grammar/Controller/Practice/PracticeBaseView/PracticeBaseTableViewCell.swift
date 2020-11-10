//
//  PracticeBaseTableViewCell.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/11/01.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

class PracticeBaseTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
