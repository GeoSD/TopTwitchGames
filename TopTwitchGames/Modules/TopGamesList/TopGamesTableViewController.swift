//
//  TopGamesTableViewController.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

protocol ITopGamesTableViewController: AnyObject
{
	func refreshTopGamesView()
	func reloadCellAt(indexPath: IndexPath)
	func displayTopGamesRetrievalError(title: String, message: String)
}

class TopGamesTableViewController: UITableViewController
{
	
	@IBOutlet weak var feedBackButton: UIBarButtonItem!
	
	let configurator = TopGamesConfigurator()
	var presenter: TopGamesPresenter!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configurator.configure(topGamesTableViewController: self)
		presenter.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.prefetchDataSource = self
		tableView.tableFooterView = UIView()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		presenter.router.prepare(for: segue, sender: sender)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.numberOfTopGames
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell",
													   for: indexPath) as? GameTableViewCell
			else {
				assertionFailure("Cell not casted to custom!")
				return UITableViewCell()
		}
		presenter.configure(cell: cell, forRow: indexPath.row)
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let heightForRow = CGFloat(presenter.heightForRowAt(indexPath.row))
		return heightForRow
	}
}

extension TopGamesTableViewController: ITopGamesTableViewController
{
	func refreshTopGamesView() {
		DispatchQueue.main.async { [weak self] in
			self?.tableView.reloadData()
		}
	}
	
	func reloadCellAt(indexPath: IndexPath) {
		DispatchQueue.main.async { [weak self] in
			self?.tableView.reloadRows(at: [indexPath], with: .fade)
		}
	}
	
	func displayTopGamesRetrievalError(title: String, message: String) {
		DispatchQueue.main.async { [weak self] in
			self?.presentAlert(title: title, message: message)
		}
	}
}

extension TopGamesTableViewController: UITableViewDataSourcePrefetching
{
	func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		self.presenter.fetchTopGamesIfNeeded(forRow: indexPaths.last!.row)
	}

	func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {

	}
}
