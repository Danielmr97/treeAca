//
//  CustomTableViewCell.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 04/01/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var Namecell: UILabel!
    @IBOutlet weak var DescriptionCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Namecell.font = UIFont.boldSystemFont(ofSize: 25)
        DescriptionCell.font = UIFont.boldSystemFont(ofSize: 15)
        DescriptionCell.textAlignment = .justified
        DescriptionCell.numberOfLines = 0
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
