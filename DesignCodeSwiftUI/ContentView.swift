
//
//  ContentView.swift
//  DesignCodeSwiftUI
//
//  Created by Yaser on 8/21/20.
//  Copyright © 2020 Yaser. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var bottomState = CGSize.zero
    @State var showCard = false
    @State var showCardFull = false
    
    var body: some View {
        
        ZStack {
            TitleView()
                .offset(x: 0, y: showCard ? -120 : 0)
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .animation(
                    Animation
                        .timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)
                        .delay(0.2)
            )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 1  , y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 1  , y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))
            
            
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(DragGesture().onChanged({ (value) in
                self.viewState = value.translation
                self.show = true
            })
                .onEnded({ (value) in
                    self.viewState = .zero
                    self.show = false
                })
            )
            
            
            //Text("\(self.bottomState.height)").offset(y: -300)
            BottomCardView(show: $showCard)
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(x: 0, y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(DragGesture().onChanged({ (value) in
                    self.bottomState = value.translation
                        if self.showCardFull {
                            self.bottomState.height += -300
                    }
                    if self.bottomState.height < -300 {
                        self.bottomState.height = -300
                    }
                }).onEnded({ (value) in
                    if self.bottomState.height > 50 {
                        self.showCard = false
                    }
                    if (self.bottomState.height < -100 && !self.showCardFull) || (self.bottomState.height < -250 && self.showCardFull){
                        self.bottomState.height = -300
                        self.showCardFull = true
                    } else {
                        self.showCardFull = false
                        self.bottomState = .zero

                    }
                })
            )
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
    
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Certificate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    @Binding var show: Bool
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 40, height: 5)
                .opacity(0.1)
                .cornerRadius(3)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
                
            
            HStack(spacing: 20.0) {
                RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 88, height: 88, percent: 90, show: $show)
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    
                    Text("12 of 12 ections completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    .lineSpacing(4)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 1)
            }
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
