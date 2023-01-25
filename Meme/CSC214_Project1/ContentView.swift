//
//  ContentView.swift
//  CSC214_Project1
//
//  Created by Sifeng Chen on 9/30/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = Memes()
    @FocusState private var inputFocus: Bool

    var body: some View {
        NavigationView{
            ZStack{
                Color.teal.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("pressDog")
                    .padding()
                    .font(.system(size:30))
                    Spacer()
                    NavigationLink(destination:
                        MemeView().onAppear {
                        model.getMeme()
                    }) {
                        Image("mainPage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                            .padding()
                    }
                    .padding()
                    Spacer()
                    NavigationLink(destination:
                        MemeView().onAppear {
                        model.getFrenchSpeical()
                    }) {
                        Text("bonus")
                        .padding()
                        .foregroundColor(.yellow)
                        .font(.system(size:35))

                    }
                    .padding()
                    Spacer()
                    Text("meme_counts \(model.memeCount)", tableName:"LocalizableDict")
                    .font(.system(size:21))
                    .padding()
                    
                }//end of VStack
            }//end of ZStack
           
        }//end of NavigationView
        .environmentObject(model)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
                .environment(\.locale,
                              .init(identifier:"fr"))
            ContentView()
                .environment(\.locale,
                              .init(identifier:"en"))
        }
    }
}

