//
//  ContentView.swift
//  YoutubeLivestreamTracker
//
//  Created by junius7even on 2022-04-21.
//

import SwiftUI

struct OverviewView: View {
    @Binding var streamerNameCollection: [String]
    @Binding var profileImage: [String]
    @Binding var liveStatus: [Bool]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<streamerNameCollection.count) {i in
                    YoutuberProfileView(
                        YoutuberName: $streamerNameCollection[i],
                        ProfileImage: $profileImage[i],
                        LiveStatus: $liveStatus[i]
                    )
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Overview")
        }
    }
}

struct ContentView: View {
    @State var streamerNameCollection:[String] = ["Marine ch", "Iroha ch"]
    
    @State var profileImage: [String] = ["ferry", "fork.knife"]
    
    @State var liveStatus: [Bool] = [true, false]
    
    var body: some View {
        
        TabView {
            OverviewView(
                streamerNameCollection: $streamerNameCollection,
                profileImage: $profileImage,
                liveStatus: $liveStatus
            )
            .tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Overview")
                }
            }
            
            NavigationView {
                List {
                    Text("Hi")
                }
                .navigationTitle("Settings")
            }
            .tabItem {
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
        }
    }
}

struct YoutuberProfileView: View {
    @Binding var YoutuberName: String
    @Binding var ProfileImage: String
    @Binding var LiveStatus: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: ProfileImage)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(uiColor: .systemIndigo), lineWidth: 4))
                .frame(width: 100, height: 100, alignment: .leading)
            Spacer()
            Text(YoutuberName)
                .font(.title)
                .bold()
            Spacer()
            Circle()
                .frame(width: 50, height: 50, alignment: .trailing)
                .foregroundColor(LiveStatus ? Color.green: Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
