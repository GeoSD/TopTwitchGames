//
//  TwitchService.swift
//  TopTwitchGames
//
//  Created by Дягилев Георгий Сергеевич on 28.05.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

enum TwitchService: ServiceProtocol
{
	case getTopGames(offset: Int)
	case getImageData(_ urlString: String)

	var baseURL: URL {
		return URL(string: API.endpoint)!
	}

	var path: String {
		switch self {
		case .getTopGames: return API.getTopGames
		case .getImageData(let urlString): return urlString
		}
	}

	var method: HTTPMethod {
		switch self {
		case .getTopGames: return .get
		case .getImageData: return .get
		}
	}

	var task: Task {
		switch self {
		case .getTopGames: return .requestParameters(["limit" : 51])
		case .getImageData: return .requestPlain
		}
	}

	var headers: Headers? {
		switch self {
		case .getTopGames:
			return [
				"Accept": "application/vnd.twitchtv.v5+json",
				"Client-ID": API.token
			]
		case .getImageData: return [:]
		}
	}

	var jsonRequest: [String: Any]? {
		switch self {
		case .getTopGames: return nil
		case .getImageData: return nil
		}
	}

	var parametersEncoding: ParametersEncoding {
		switch self {
		case .getTopGames: return .url
		case .getImageData: return .url
		}
	}
}
