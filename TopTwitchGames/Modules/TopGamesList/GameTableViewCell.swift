//
//  GameTableViewCell.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
//import SDWebImage

class GameTableViewCell: UITableViewCell
{

	@IBOutlet weak var coverImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var channelsNumber: UILabel!
	@IBOutlet weak var viewersNumber: UILabel!

	func display(coverImage url: String) {
//		self.coverImage.sd_setImage(with: URL(string: API.endpoint + url))
	}

	func display(name: String) {
		self.nameLabel.text = name
	}

	func display(channelsNumber: String) {
		self.channelsNumber.text = channelsNumber
	}

	func display(viewersNumber: String) {
		self.viewersNumber.text = viewersNumber
	}
}
