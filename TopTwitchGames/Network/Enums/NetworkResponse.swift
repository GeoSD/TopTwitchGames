//
//  NetworkResponse.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

enum NetworkResponse<T>
{
	case success(T)
	case failure(NetworkError)
}
