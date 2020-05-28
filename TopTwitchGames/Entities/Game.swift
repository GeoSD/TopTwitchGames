//
//  Game.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

struct Game: Codable {
	let name: String
	let id, giantbombID: Int
	let box, logo: Box
	let localizedName: String
	let locale: Locale

	enum CodingKeys: String, CodingKey {
		case name
		case id = "_id"
		case giantbombID = "giantbomb_id"
		case box, logo
		case localizedName = "localized_name"
		case locale
	}
}
