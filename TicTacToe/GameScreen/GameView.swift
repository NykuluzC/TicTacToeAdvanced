//
//  GameView.swift
//  TicTacToe
//
//  Created by Carl Irven Nykuluz F. Millanes on 7/5/23.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Hello, World!")

        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button("End Game") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Tic Tac Toe")
        .inNavigationStack()
    }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
        
