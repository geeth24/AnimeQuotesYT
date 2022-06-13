//
//  Model.swift
//  Model
//
//  Created by Geeth Gunnampalli on 7/26/21.
//

import Foundation

struct Quotes: Decodable{
    var anime: String
    var character: String
    var quote: String
    
    //lets make the placeholder data
    
    static let placeholderData = Quotes(anime: "One Piece", character: "Monkey D. Luffy", quote: "Then just become stronger. I have my ambition, you have your ambition too. Which means you should just keep walking forward towards that goal.")
    
    //Now lets start the widget!
    


    
  
}
