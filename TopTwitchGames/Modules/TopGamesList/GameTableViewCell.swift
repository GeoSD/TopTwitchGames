//
//  GameTableViewCell.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import SDWebImage

protocol IGameTableViewCell
{
	func configure(with item: TopGame)
}


class GameTableViewCell: UITableViewCell, IGameTableViewCell
{

	@IBOutlet weak var coverImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var channelsNumber: UILabel!
	@IBOutlet weak var viewersNumber: UILabel!

	func configure(with item: TopGame) {
		self.coverImage.sd_setImage(with: URL(string: item.game.box.large))
		self.nameLabel.text = item.game.name
		self.channelsNumber.text = "\(item.channels)"
		self.viewersNumber.text = "\(item.viewers)"
	}
}
