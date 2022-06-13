//
//  AnimeQuoteYTApp.swift
//  AnimeQuoteYT
//
//  Created by Geeth Gunnampalli on 7/26/21.
//

import SwiftUI

@main
struct AnimeQuoteYTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(quotesData: Quotes(anime: "Loading...", character: "Loading...", quote: "Loading..."))
        }
    }
}
