//
//  TopGamesPresenter.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

protocol TopGamesView: AnyObject
{
	func refreshTopGamesView()
	func reloadCellAt(indexPath: IndexPath)
	func displayTopGamesRetrievalError(title: String, message: String)
}

protocol GameCellView
{
		func display(coverImage url: String)
		func display(name: String)
		func display(channelsNumber: String)
		func display(viewersNumber: String)
}

protocol ITopGamesPresenter
{
	var numberOfTopGames: Int { get }
	var router: TopGamesViewRouter { get }
	func viewDidLoad()
	func configure(cell: GameCellView, forRow row: Int)
	func heightForRowAt(_ row: Int) -> Int
}

final class TopGamesPresenter: ITopGamesPresenter
{
	private weak var view: TopGamesView?
	private let sessionProvider = URLSessionProvider()
	internal let router: TopGamesViewRouter

	private var topGames: [TopGame] = []

	var numberOfTopGames: Int {
		return topGames.count
	}

	init(view: TopGamesView,
		 router: TopGamesViewRouter) {
		self.view = view
		self.router = router
	}

	// MARK: - EventsPresenter
	func viewDidLoad() {
		self.fetchTopGames()
	}

	func configure(cell: GameCellView, forRow row: Int) {
		let topGame = topGames[row]
		cell.display(coverImage: topGame.game.box.medium)
		cell.display(name: topGame.game.name)
		cell.display(channelsNumber: "\(topGame.channels)")
		cell.display(viewersNumber: "\(topGame.viewers)")
	}

	func heightForRowAt(_ row: Int) -> Int {
		return 200
	}

	// MARK: - Private
	private func fetchTopGames() {
		sessionProvider.request(type: [TopGame].self,
								service: TwitchService.getTopGames) { [weak self] (response) in
									guard let self = self else { return }
									switch response {
									case let .success(topGames): self.handleTopGamesReceived(topGames)
									case let .failure(error): self.handleTopGamesError(error)
									}
		}
	}

	private func handleTopGamesReceived(_ topGames: [TopGame]) {
		self.topGames = topGames
		view?.refreshTopGamesView()
	}

	private func handleTopGamesError(_ error: NetworkError) {
		view?.displayTopGamesRetrievalError(title: "Ошибка!",
											message: "Произошла ошибка при загрузке данных. Проверьте соединение и перезапустите приложение. Сообщение об ошибке: \(error)")
	}
}
