//
//  MyCustomCollectionViewCell.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 03/01/23.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var Myimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.textColor = .white
    }

}
