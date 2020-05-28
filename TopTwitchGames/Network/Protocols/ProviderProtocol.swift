//
//  ProviderProtocol.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

protocol ProviderProtocol
{
	func request<T>(type: T.Type,
					service: ServiceProtocol,
					completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
}
