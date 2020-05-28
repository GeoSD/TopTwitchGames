//
//  TopGamesPresenter.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

protocol ITopGamesPresenter
{
	var numberOfTopGames: Int { get }
	var router: TopGamesViewRouter { get }
	func viewDidLoad()
	func configure(cell: IGameTableViewCell, forRow row: Int)
	func heightForRowAt(_ row: Int) -> Int
	func fetchTopGamesIfNeeded(forRow row: Int)
}

final class TopGamesPresenter: ITopGamesPresenter
{
	private weak var view: ITopGamesTableViewController?
	private let sessionProvider = URLSessionProvider()
	internal let router: TopGamesViewRouter

	private var topGames: [TopGame] = []
	private var topGamesOffsets: [Int] = []
	private var topGamesTotal: Int = 0

	var numberOfTopGames: Int {
		return self.topGamesTotal
	}

	init(view: ITopGamesTableViewController,
		 router: TopGamesViewRouter) {
		self.view = view
		self.router = router
	}

	func viewDidLoad() {
		self.fetchTopGames(offset: 0)
	}

	func configure(cell: IGameTableViewCell, forRow row: Int) {
		let topGame = topGames[row]
		cell.configure(with: topGame)
	}

	func heightForRowAt(_ row: Int) -> Int {
		return 100
	}

	func fetchTopGamesIfNeeded(forRow row: Int) {
		let index = row / 50
		if self.topGamesOffsets[index] == 0 {
			let offset = index * 50

			self.topGamesOffsets[index] = 1
			self.fetchTopGames(offset: offset)
		}
	}

	private func fetchTopGames(offset: Int) {
		sessionProvider.request(type: TopGames.self,
								service: TwitchService.getTopGames(offset: offset)) { [weak self] (response) in
									guard let self = self else { return }
									switch response {
									case let .success(topGames): self.handleTopGamesReceived(topGames)
									case let .failure(error): self.handleTopGamesError(error)
									}
		}
	}

	private func handleTopGamesReceived(_ topGames: TopGames) {
		if self.topGamesOffsets.isEmpty {
			self.topGamesOffsets = Array(repeating: 0, count: topGames.total / 50 + 1)
			self.topGamesOffsets[0] = 1
		}
		self.topGames.append(contentsOf: topGames.topGames)
		self.topGamesTotal = topGames.total
		view?.refreshTopGamesView()
	}

	private func handleTopGamesError(_ error: NetworkError) {
		view?.displayTopGamesRetrievalError(
			title: "Ошибка!",
			message: "Произошла ошибка при загрузке данных. Проверьте соединение и перезапустите приложение. Сообщение об ошибке: \(error.localizedDescription)"
		)
	}
}
