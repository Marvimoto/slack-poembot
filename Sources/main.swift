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

var lastMessageSent = NSDate().timeIntervalSince1970 - 600

let configDirectory = workingDirectory + "Config/"

let config = try Config(
    prioritized: [
        .commandLine,
        .directory(root: configDirectory + "secrets"),
        .directory(root: configDirectory + "production")
    ]
)

//config variables

guard let token = config["bot-config", "token"]?.string else { throw BotError.missingConfig }
guard let channel = config["bot-config", "channel"]?.string else { throw BotError.missingConfig }
print(token)

//WebSocket Init
let rtmResponse = try loadRealtimeApi(token: token)

//get WebSocket url from Slack
guard let webSocketURL = rtmResponse.data["url"]?.string else { throw BotError.invalidResponse }

//Connect to the WebSocket
try EngineClient.factory.socket.connect(to: webSocketURL) { ws in
    
    //Initialize message counter
    var messageCounter : Int = 0
    print("Connected")
    
    //always do when a text (message, user leaves channel, ...) appears in presence of bot
    ws.onText = { ws, text in
        let last3Seconds = NSDate().timeIntervalSince1970 - 3

        let event = try JSON(bytes: text.utf8.array)
        guard let ts = event["ts"].flatMap({ $0.string.flatMap({ Double($0) }) }) else { return }
        if event["channel"]?.string == channel {
            if event["type"] == "message" && ts >= last3Seconds  {
                if event["text"] == "Funktionierst du, Poem Bot?" {
                    let response = SlackMessage(to: channel, text: "Ich funktioniere, also bin ich.", threadTs: nil)
                    try ws.send(response)
                }
                messageCounter += 1
                if messageCounter % 10 == 0 {
                    if lastMessageSent <= NSDate().timeIntervalSince1970 - 600 {
                        lastMessageSent = NSDate().timeIntervalSince1970
                        let response = SlackMessage(to: channel, text: Poems.randomPoem(), threadTs: nil)
                        try ws.send(response)
                    }
                }
            }
        }
    }
}

print("Hello")

