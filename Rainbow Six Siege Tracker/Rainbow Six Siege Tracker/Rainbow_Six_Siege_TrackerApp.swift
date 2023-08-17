//
//  Rainbow_Six_Siege_TrackerApp.swift
//  Rainbow Six Siege Tracker
//
//  Created by Vishnu Varma on 7/16/23.
//

import SwiftUI

@main
struct Rainbow_Six_Siege_TrackerApp: App {
    var apicall = APICall()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(apicall)
        }
    }
}
