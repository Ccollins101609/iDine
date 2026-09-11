//
//  iDineApp.swift
//  iDine
//
//  Created by Christian Collins on 8/27/26.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
