//
//  TopGames.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

struct TopGames: Codable {
	let total: Int
	let topGames: [TopGame]

	enum CodingKeys: String, CodingKey {
		case total = "_total"
		case topGames = "top"
	}
}
