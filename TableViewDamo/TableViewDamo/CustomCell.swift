//
//  CustomCell.swift
//  TableViewDamo
//
//  Created by Lokesh Yadav on 10/09/15.
//  Copyright (c) 2015 Lokesh Yadav. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lbltext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
