//
//  ContentView.swift
//  TicTacToe
//
//  Created by Carl Irven Nykuluz F. Millanes on 7/5/23.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false;
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Game", selection: $gameType) {
                    Text("Select Game Type").tag(GameType.undetermined)
                    Text("Single Device Mode").tag(GameType.single)
                    Text("AI/BOT Mode").tag(GameType.bot)
                    Text("Multi Device Mode").tag(GameType.peer)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
                Text(gameType.description)
                    .padding()
                VStack {
                    switch gameType {
                    case .single:
                        VStack{
                            TextField("Your Name: ", text: $yourName)
                            TextField("Opponent Name: ", text: $opponentName)
                        }
                    case .bot:
                        TextField("Your Name: ", text: $yourName)
                    case .peer:
                        EmptyView()
                    case .undetermined:
                        EmptyView()
                    }
                }
                .padding()
                .textFieldStyle(.roundedBorder)
                .focused($focus)
                .frame(width: 350)
                if gameType != .peer {
                    Button("Start Game "){
                        focus = false
                        startGame.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(
                        gameType == .undetermined ||
                        gameType == .bot && yourName.isEmpty ||
                        gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                    )
                    Image("LaunchScreen")
                }
                Spacer()
            }
            .padding(40.0)
            .navigationTitle("Tic Tac Toe")
            .fullScreenCover(isPresented: $startGame){
                GameView()
            }
            .padding()
            .inNavigationStack()
    }
}
    
    struct StartView_Previews: PreviewProvider {
        static var previews: some View {
            StartView()
        }
    }
}
