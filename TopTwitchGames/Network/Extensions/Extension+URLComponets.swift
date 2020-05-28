//
//  Extension+URLComponets.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

extension URLComponents
{
	init(service: ServiceProtocol) {
		let url = service.baseURL.appendingPathComponent(service.path)
		self.init(url: url, resolvingAgainstBaseURL: false)!
		guard case let .requestParameters(parameters) = service.task,
			service.parametersEncoding == .url else {
				return
		}
		queryItems = parameters.map { key, value in
			return URLQueryItem(name: key, value: String(describing: value))
		}
	}
}
