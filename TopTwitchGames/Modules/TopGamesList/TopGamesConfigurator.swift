//
//  TopGamesConfigurator.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

protocol ITopGamesConfigurator
{
	func configure(topGamesTableViewController: TopGamesTableViewController)
}

final class TopGamesConfigurator: ITopGamesConfigurator
{
	func configure(topGamesTableViewController: TopGamesTableViewController) {
		let router = TopGamesViewRouter(topGamesTableViewController: topGamesTableViewController)
		let presenter = TopGamesPresenter(view: topGamesTableViewController,
										  router: router)
		topGamesTableViewController.presenter = presenter
	}
}
