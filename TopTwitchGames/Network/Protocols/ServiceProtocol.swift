//
//  ServiceProtocol.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

typealias Headers = [String: String]

protocol ServiceProtocol
{
	var baseURL: URL { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var task: Task { get }
	var headers: Headers? { get }
	var jsonRequest: [String: Any]? { get }
	var parametersEncoding: ParametersEncoding { get }
}
