//
//  GameModels.swift
//  TicTacToe
//
//  Created by Carl Irven Nykuluz F. Millanes on 7/5/23.
//

import Foundation

enum GameType {
    case single, bot, peer, undetermined
    
    var description: String{
        switch self {
        case .single:
            return "Share your iPhone/iPad and play."
        case .bot:
            return "Play against this iPhone/iPad."
        case .peer:
            return "Invite someone near you who has this app running to play"
        case .undetermined:
            return ""
        }
    }
}
