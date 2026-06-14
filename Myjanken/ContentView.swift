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
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack {
                    Text("26cm0121_陳炳晟 ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Text("第\(count)回戦")
                        .font(.largeTitle)
                        .padding(10)
                    
                    Text("勝ち: \(winCount)  負け: \(loseCount)  あいこ: \(drawCount) 通算勝利数: \(winTotal) ")
                        .font(.headline)
                    
                    Spacer()
                    
                    
                    
                    if computerHand == 0 {
                        Text("これからジャンケンをします！")
                            .frame(maxWidth: .infinity)
                        //.padding(.bottom)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 80, trailing: 16))
                    }else if computerHand == 1 {
                        
                        Image(.gu2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130)
                            .frame(maxWidth: .infinity)
                        
                        Text("ぐー")
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }else if computerHand == 2 {
                        
                        Image(.choki2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130)
                            .frame(maxWidth: .infinity)
                        
                        Text("チョキ")
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }else {
                        
                        Image(.pa2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130)
                            .frame(maxWidth: .infinity)
                        
                        Text("パー")
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }
                    
                    if computerHand == 0 {
                        
                        
                    } else if computerHand == playerHand {
                        Text("あいこ！")
                            .padding()
                    } else if (playerHand == 1 && computerHand == 2) ||
                              (playerHand == 2 && computerHand == 3) ||
                              (playerHand == 3 && computerHand == 1) {
                        Text("勝ち！")
                        
                    } else {
                        Text("負け！")
                        
                    }
                    
                    
                    if playerHand == 0 {
                        Text("これからジャンケンをします！")
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
                    Spacer()
                    
                    Button{
                        soundPlayer.jankenPlay()
                        computerHand = 0
                        playerHand = 0
                        count = 0
                        winCount = 0
                        loseCount = 0
                        drawCount = 0
                    }label: {
                        Text("リセット")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(.white.opacity(0.85))
                            .clipShape(Capsule())
                    }
                    Spacer()
                    
                    HStack{
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
                            Image(.gu2)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
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
                            Image(.choki2)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
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
                            Image(.pa2)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
