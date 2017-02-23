//
//  ChatViewCell.swift
//  parseChat
//
//  Created by Hung Do on 2/22/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit

class ChatViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
