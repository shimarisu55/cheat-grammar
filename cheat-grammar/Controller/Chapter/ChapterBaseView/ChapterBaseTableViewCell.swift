//
//  ChapterBaseTableViewCell.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

class ChapterBaseTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkIconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
