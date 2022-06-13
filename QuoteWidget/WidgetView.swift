//
//  WidgetView.swift
//  WidgetView
//
//  Created by Geeth Gunnampalli on 8/15/21.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {
    
    var entry: Model
    
    var body: some View {
        ZStack{
            Image("pink")
                .resizable()
                .ignoresSafeArea()
            
            Image("Pattern")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.pink)
                .ignoresSafeArea()
            
            //I made the rest of the view to save time
            
            VStack(alignment: .leading) {
                Text(entry.quotesData.quote)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.init("Anime"))
                    .padding(.top)
                    .multilineTextAlignment(.leading)
                    .shadow(color: Color(.systemPink), radius: 7)
                
                Text("~ \(entry.quotesData.character)")
                    .font(.title3)
                    .foregroundColor(Color.init("Anime"))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .shadow(color: Color(.systemPink), radius: 7)
                Text("From: \(entry.quotesData.anime)")
                    .font(.footnote)
                    .foregroundColor(Color.init("Anime"))
                    .fontWeight(.semibold)
                    .padding(.top, -10.0)
                    .shadow(color: Color(.systemPink), radius: 7)
            }
            .padding()
            .frame(width: 330, height: 350)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
            
        }.background(Color.pink)
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: Model(date: Date(), quotesData: Quotes.placeholderData))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
