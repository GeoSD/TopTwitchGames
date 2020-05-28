//
//  ViewRouter.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

protocol ViewRouter
{
	func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter
{
	func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
