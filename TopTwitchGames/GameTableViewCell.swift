//
//  GameTableViewCell.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

	@IBOutlet weak var coverImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var channelsNumber: UILabel!
	@IBOutlet weak var viewersNumber: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
