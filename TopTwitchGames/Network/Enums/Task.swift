//
//  Task.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum Task
{
	case requestPlain
	case requestParameters(Parameters)
}
