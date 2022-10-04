//
//  HomeTableViewCell.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 3.10.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
