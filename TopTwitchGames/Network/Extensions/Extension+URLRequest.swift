//
//  Extension+URLRequest.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

extension URLRequest
{
	init(service: ServiceProtocol) {
		let urlComponents = URLComponents(service: service)
		self.init(url: urlComponents.url!)
		httpMethod = service.method.rawValue
		service.headers?.forEach { key, value in
			addValue(value, forHTTPHeaderField: key)
		}
		guard let jsonRequest = service.jsonRequest,
			let jsonData = try? JSONSerialization.data(withJSONObject: [jsonRequest], options: .sortedKeys) else {
				return
		}
		httpBody = jsonData
		guard case let .requestParameters(parameters) = service.task,
			service.parametersEncoding == .json else {
				return
		}
		httpBody = try? JSONSerialization.data(withJSONObject: parameters)
	}
}
