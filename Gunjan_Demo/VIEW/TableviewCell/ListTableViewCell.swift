//
//  ListTableViewCell.swift
//  Gunjan_Demo
//
//  Created by Harsh Purohit on 27.09.21.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var newsLink: UIButton!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
