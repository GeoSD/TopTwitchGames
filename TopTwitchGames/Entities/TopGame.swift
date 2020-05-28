//
//  TopGame.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

struct TopGame: Codable {
	let game: Game
	let channels: Int
	let viewers: Int
}
