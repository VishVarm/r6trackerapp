//
//  SearchBar.swift
//  Rainbow Six Siege Tracker
//
//  Created by Vishnu Varma on 7/16/23.
//

import SwiftUI

struct SearchBar: View {
    
    //var user: UserData
    @StateObject var apicall = APICall()
    
    struct Gamertag {
        var gamertag: String = ""
    }
    @State private var gamertag : Gamertag = .init()
    //@State private var showStatistics = false
    
    //@State var searchText: String
    //@State private var text: String = "Enter Your Xbox Gamertag"
    //var userInput: String
    
    var body: some View {
        VStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            HStack {
                TextField("", text: $gamertag.gamertag, prompt: Text("Enter Your Xbox Gamertag"))
                    //.padding(.leading)
                    .frame(width: 220)
                    .border(.gray)
                    .multilineTextAlignment(.center)
                    .background(Color(.systemGray6))
                    
                Button("Get Stats"){
                    getStat()
                    //showStatistics.toggle()
                }
               
                    .frame(width: 75)
                    .foregroundColor(.white)
                    .background {
                        Rectangle()
                            .stroke(.gray)
                            .frame(width: 92, height: 21)
                            .background(.gray)
                        
                    }
                    
            }
            Group {
                Text("General Stats")
                    .font(.title)
                HStack {
                    Text("Level:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.metadata.level)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
                }
                HStack {
                    Text("General K/D:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.kd)".prefix(5))
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("General Kills:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.kills)")
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("General Deaths:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.deaths)")
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Rank MMR:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.rank.mmr)")
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Games Played:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.played_games)")
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Wins:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.wins)")
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Losses:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.losses)")
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Text("Days Played:")
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(apicall.user.data.stats_general.playtime_in_seconds / 60 / 60 / 24)")
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
            }
            
            
   
            //.padding(.leading)
        }
        .offset(y: -500)
        
        //Spacer()
    }

    
    func getStat() {
        apicall.makeAPICall(gamertag.gamertag)
        //showStatistics.toggle()
        print(gamertag.gamertag)
        return
        //makeAPICall()
    }
}

struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}


struct SearchBar_Previews: PreviewProvider {
    static let apicall = APICall()
    static var previews: some View {
        SearchBar(/*user: apicall.user*/)
            .environmentObject(APICall())
    }
}
