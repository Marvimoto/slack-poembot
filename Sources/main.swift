//
//  main.swift
//  PoemBotPackageDescription
//
//  Created by Marvin Heller on 11.10.17.
//

import HTTP
import Vapor
import Foundation
import TLS

let configDirectory = workingDirectory + "Config/"

let config = try Config(
    prioritized: [
        .commandLine,
        .directory(root: configDirectory + "production")
    ]
)

//config variables

guard let token = config["bot-config", "token"]?.string else { throw BotError.missingConfig }

//WebSocket Init
let rtmResponse = try loadRealtimeApi(token: token)

guard let validChannels = rtmResponse.data["channels", "id"]?.array?.flatMap({ $0.string }) else { throw BotError.unableToLoadChannels }

guard let webSocketURL = rtmResponse.data["url"]?.string else { throw BotError.invalidResponse }

func credit(_ ws: WebSocket, _ user: String, channel: String, threadTs: String?, printError: Bool = true) throws {
    if true {
        var response: SlackMessage
        do {
            response = SlackMessage(
                to: channel,
                text: "Test",
                threadTs: threadTs
            )
        }
        try ws.send(response)
    }
}

try EngineClient.factory.socket.connect(to: webSocketURL) { ws in
    var messageCounter : Int = 0
    print("Connected")
    ws.onText = { ws, text in
        let last3Seconds = NSDate().timeIntervalSince1970 - 3

        let event = try JSON(bytes: text.utf8.array)
        guard let ts = event["ts"].flatMap({ $0.string.flatMap({ Double($0) }) }) else { return }
        if event["channel"] == "C43D1DN7Q" {
            if event["type"] == "message" && ts >= last3Seconds  {
                messageCounter += 1
                if messageCounter % 5 == 0 {
                    let response = SlackMessage(to: "C43D1DN7Q", text: Poems.random(), threadTs: nil)
                    try ws.send(response)
                }
            }
        }
    }

}

print("Hello")

