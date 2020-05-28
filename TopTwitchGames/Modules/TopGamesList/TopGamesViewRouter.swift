//
//  TopGamesViewRouter.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

protocol ITopGamesViewRouter: ViewRouter
{
}

final class TopGamesViewRouter: ITopGamesViewRouter
{
	private weak var topGamesTableViewController: TopGamesTableViewController?

	init(topGamesTableViewController: TopGamesTableViewController) {
		self.topGamesTableViewController = topGamesTableViewController
	}
}
