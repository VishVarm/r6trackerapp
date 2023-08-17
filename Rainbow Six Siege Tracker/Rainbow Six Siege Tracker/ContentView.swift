//
//  ContentView.swift
//  Rainbow Six Siege Tracker
//
//  Created by Vishnu Varma on 7/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var apicall: APICall
    var body: some View {
        VStack {
            SearchBar(/*user: apicall.user*/)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(APICall())
    }
    
}
