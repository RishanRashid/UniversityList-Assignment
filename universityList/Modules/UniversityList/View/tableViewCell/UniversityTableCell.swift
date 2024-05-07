//
//  UniversityTableCell.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import UIKit

class UniversityTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!

    var data: University? {
        didSet {
            if let data {
                nameLabel.text = data.name
                stateLabel.text = data.stateProvince
            }
        }
    }
    
}
