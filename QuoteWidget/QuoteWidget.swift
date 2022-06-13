//
//  QuoteWidget.swift
//  QuoteWidget
//
//  Created by Geeth Gunnampalli on 8/15/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> Model {
        Model(date: Date(), quotesData: Quotes.placeholderData)
    }

    func getSnapshot(in context: Context, completion: @escaping (Model) -> ()) {
        let entry = Model(date: Date(), quotesData: Quotes.placeholderData)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Model>) -> ()) {
        
        //timeline function tell apple when to refresh
        
        getData{ (modelData) in
            
            let date = Date()
            let data = Model(date: date, quotesData: modelData)
            
            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 1, to: date)
            
            //this 1 is saying it will refresh everyminute
            
            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
            
            completion(timeline)
            
            // t
        }

    }
}

//fetch function

func getData(completion: @escaping (Quotes)->()){
    
    let url = "https://animechan.vercel.app/api/random"
    
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: URL(string: url)!){ (data, _,err) in
        
        if err != nil{
            print(err!)
            
            return
        }
        
        do{
            let jsonData = try JSONDecoder().decode(Quotes.self, from: data!)
            completion(jsonData)
            
        }catch{
            print(err!)
        }
        
    }.resume()
    
    
    
}

struct Model: TimelineEntry {
    var date: Date
    var quotesData: Quotes
}

struct QuoteWidgetEntryView : View {
    var entry: Model

    var body: some View {
        //We can see the placeholder data is working lets now work on the view
        WidgetView(entry: entry)
    }
}
//Placeholder view screen

struct PlaceholderView: View{

    var entry : Model

    var body: some View{
        
        WidgetView(entry: entry)
            .redacted(reason: .placeholder)

    }
}

@main
struct QuoteWidget: Widget {
    let kind: String = "QuoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuoteWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Quote Widget")
        .description("Displays Quotes")
        .supportedFamilies([.systemLarge])
    }
}

struct QuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidgetEntryView(entry: Model(date: Date(), quotesData: Quotes.placeholderData))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        PlaceholderView(entry: Model(date: Date(), quotesData: Quotes.placeholderData))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
