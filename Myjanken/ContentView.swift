//
//  ContentView.swift
//  Myjanken
//
//  Created by Neo Frank on 2026/4/16.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    
    @State private var computerHand = 0
    @State var playerHand = 0
    @State private var count = 1
    @State private var winCount = 0
    @State private var loseCount = 0
    @State private var drawCount = 0
    @AppStorage("win_total") var winTotal = 0
    @State private var isGameStarted = false
    
    var body: some View {
        
        
        ZStack {
            if !isGameStarted {
                TopView(isGameStarted: $isGameStarted)
            } else {
                Image(.background2)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
              
                VStack {
                    
                    HStack {
                        Text("26cm0121_陳炳晟 ")

                        Spacer()
                        
                        Button {
                            isGameStarted = false
                        } label: {
                            Text("終了")
                                .font(.headline)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(.white.opacity(0.85))
                                .clipShape(Capsule())
                        }
                    }
                    .padding()
                    
                    Text("第\(count)回戦")
                        .font(.largeTitle)
                        .padding(10)
                    
                    Text("勝ち: \(winCount)  負け: \(loseCount)  あいこ: \(drawCount) 通算勝利数: \(winTotal) ")
                        .font(.headline)
                    
                    Spacer()
                    
                    VStack {
                        Spacer()

                        if computerHand == 0 {
                            Text("これからジャンケンをします！")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                        } else if computerHand == 1 {
                            Image(.gu3)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                            Text("ぐー")
                                .padding(.bottom)
                        } else if computerHand == 2 {
                            Image(.choki3)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                            Text("チョキ")
                                .padding(.bottom)
                        } else {
                            Image(.pa3)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                            Text("パー")
                                .padding(.bottom)
                        }

                        Spacer()
                    }
                    
                    VStack(spacing: 8) {
                        if computerHand == 0 {
                            Text("じゃんけんポン！")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.brown)
                        } else if computerHand == playerHand {
                            Text("あいこ！")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.orange)
                        } else if (playerHand == 1 && computerHand == 2) ||
                                  (playerHand == 2 && computerHand == 3) ||
                                  (playerHand == 3 && computerHand == 1) {
                            Text("あなたの勝ち！")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.red)
                        } else {
                            Text("あなたの負け…")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.blue)
                        }
                    }
                    
                    Spacer()
                        .frame(height: 12)
                    
                    
                    if playerHand == 0 {
                        Text("あなたの手を選んでください！")
                            .frame(maxWidth: .infinity)
                        //.padding(.bottom)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 80, trailing: 16))
                    }else if playerHand == 1 {
                    
                        
                        Text("ぐー")
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }else if playerHand == 2 {
                        
                        
                        Text("チョキ")
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }else {
                        
                        Text("パー")
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }
                    
                    Button {
                        soundPlayer.jankenPlay()
                        computerHand = 0
                        playerHand = 0
                        count = 0
                        winCount = 0
                        loseCount = 0
                        drawCount = 0
                    } label: {
                        Label("最初から", systemImage: "arrow.clockwise")
                            .font(.headline)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(.white.opacity(0.9))
                            .clipShape(Capsule())
                    }
                    .padding(.bottom, 16)
                    
                    HStack(spacing: 24) {
                        Button{
                            soundPlayer.jankenPlay()
                            var newJankenNumber = 0
                            repeat {
                                newJankenNumber = Int.random(in: 1...3)
                            } while computerHand == newJankenNumber
                            computerHand = newJankenNumber
                            playerHand = 1
                            count += 1
                            
                            if computerHand == playerHand {
                                drawCount += 1
                            } else if (playerHand == 1 && computerHand == 2) ||
                                      (playerHand == 2 && computerHand == 3) ||
                                      (playerHand == 3 && computerHand == 1) {
                                winCount += 1
                                winTotal += 1
                            } else {
                                loseCount += 1
                            }
                        } label : {
                            Image(.gu3)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 90)
                        }
                        Button{
                            soundPlayer.jankenPlay()
                            var newJankenNumber = 0
                            repeat {
                                newJankenNumber = Int.random(in: 1...3)
                            } while computerHand == newJankenNumber
                            computerHand = newJankenNumber
                            playerHand = 2
                            count += 1
                            
                            if computerHand == playerHand {
                                drawCount += 1
                            } else if (playerHand == 1 && computerHand == 2) ||
                                      (playerHand == 2 && computerHand == 3) ||
                                      (playerHand == 3 && computerHand == 1) {
                                winCount += 1
                                winTotal += 1
                            } else {
                                loseCount += 1
                            }
                        } label : {
                            Image(.choki3)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 90)
                        }
                        Button{
                            soundPlayer.jankenPlay()
                            var newJankenNumber = 0
                            repeat {
                                newJankenNumber = Int.random(in: 1...3)
                            } while computerHand == newJankenNumber
                            computerHand = newJankenNumber
                            playerHand = 3
                            count += 1
                            
                            if computerHand == playerHand {
                                drawCount += 1
                            } else if (playerHand == 1 && computerHand == 2) ||
                                      (playerHand == 2 && computerHand == 3) ||
                                      (playerHand == 3 && computerHand == 1) {
                                winCount += 1
                                winTotal += 1
                            } else {
                                loseCount += 1
                            }
                        } label : {
                            Image(.pa3)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 90)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
