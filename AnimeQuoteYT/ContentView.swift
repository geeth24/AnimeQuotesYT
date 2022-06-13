//
//  ContentView.swift
//  AnimeQuoteYT
//
//  Created by Geeth Gunnampalli on 7/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var quotesData: Quotes
    
    @State var dataLoaded = false
    
    var body: some View {
        
        ZStack{
            
            Image("pink")
                .resizable()
                .ignoresSafeArea()
            
            //Lets Now make the button. Pre made this one too!
            
            ZStack{
                HStack {
                    Button(action: loadData) {
                        
                        if dataLoaded{
                        Image(systemName: "arrow.right.circle")
                            .font(.title)
                            .foregroundColor(.pink)
                            .shadow(color: Color(.systemPink), radius: 7)
                        }else{
                            ProgressView()
                                .tint(.pink)
                                .shadow(color: Color(.systemPink), radius: 7)
                        }
                        
                    }
                    .frame(width: 75, height: 75)
                    .background(Color.init("Anime"))
                    .cornerRadius(100)
                    .padding()
                    .shadow(color: Color(.systemPink), radius: 7)
                    
                }.padding()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding()
            
            
            
            
            //Now that works. Lets make it look better!
            VStack {
                
            //Now lets make the UI for the Text
                
                VStack(alignment: .leading){
                    
                    
                    if dataLoaded{
                        
                        Text(quotesData.quote)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init("Anime"))
                            .padding(.top)
                            .multilineTextAlignment(.leading)
                            .shadow(color: Color(.systemPink), radius: 7)
                        
                        Text("~ \(quotesData.character)")
                            .font(.title2)
                            .foregroundColor(Color.init("Anime"))
                            .fontWeight(.semibold)
                            .padding(.top)
                            .shadow(color: Color(.systemPink), radius: 7)
                        Text("From: \(quotesData.anime)")
                            .font(.title2)
                            .foregroundColor(Color.init("Anime"))
                            .fontWeight(.semibold)
                            .padding(.top, -10.0)
                            .shadow(color: Color(.systemPink), radius: 7)
                    }else{
                        ProgressView()
                            .tint(.pink)
                            .shadow(color: Color(.systemPink), radius: 7)

                    }
                }
                .padding()
                .frame(width: 360, height: 400)
                
                
                
            }.onAppear(){
                loadData()
            }
        }
    }
    
    //Time for the function. I already made it.
    
    func loadData(){
        dataLoaded = false
        guard let url = URL(string: "https://animechan.vercel.app/api/random") else{
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(Quotes.self, from: data){
                DispatchQueue.main.async{
                    self.quotesData = decodedData
                    dataLoaded = true
                    
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quotesData: Quotes(anime: "Loading...", character: "Loading...", quote: "Loading..."))
    }
}
