//
//  Extension+URLSession.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

protocol URLSessionProtocol
{
	typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
	func dataTask(request: URLRequest,
				  completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol
{
	func dataTask(request: URLRequest,
				  completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
		return dataTask(with: request, completionHandler: completionHandler)
	}
}
