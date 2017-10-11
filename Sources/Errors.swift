//
//  Errors.swift
//  PoemBotPackageDescription
//
//  Created by Marvin Heller on 11.10.17.
//

enum BotError: Swift.Error {
    case missingConfig
    case invalidResponse
    case unableToLoadChannels
}

