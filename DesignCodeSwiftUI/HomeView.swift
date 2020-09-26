//
//  HomeView.swift
//  DesignCodeSwiftUI
//
//  Created by Yaser on 8/25/20.
//  Copyright © 2020 Yaser. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @Binding var showContent: Bool
    @State var showUpdate = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.top, 30)
                .padding(.horizontal)
                .padding(.leading, 14)
            }
            
            ScrollView(.horizontal, showsIndicators: false)  {
                WatchRingsView()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                    .onTapGesture {
                        self.showContent = true
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30.0) {
                    ForEach(sectionData) { item in
                        SectionView(section: item)
                    }
                }
                .padding(.bottom, 60)
                .padding(.horizontal,  30)
            }
            
            
            HStack {
                Text("Courses")
                    .font(.title).bold()
                Spacer()
            }
            .padding(.leading, 30)
            .offset(y: -30)
            
            SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
            .offset(y: -30)
            
            Spacer()
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                section.logo
                
            }
            
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: section.color.opacity(0.4), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: Image
    var image: Image
    var color: Color
}

let sectionData = [     Section(title: "Prototype designs in SwiftUI", text: "18 sections",                         logo: Image("Logo1"), image: Image("Card1"), color: Color("card1")),
                        Section(title: "Build a SwiftUI app", text: "12 sections", logo: Image("Logo1"), image: Image("Card2"), color: Color("card2")),
                        Section(title: "SwiftUI advanced", text: "13 sections", logo: Image("Logo1"), image: Image("Card3"), color: Color("card3"))]

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), color2: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), width: 44, height: 44, percent: 30, show: .constant(true))
                
                VStack(alignment: .leading) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 min today")
                        .modifier(FontModifier(style: .caption))
                }
                .modifier(FontModifier())
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), color2: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), width: 32, height: 32, percent: 70, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), color2: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), width: 32, height: 32, percent: 70, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
