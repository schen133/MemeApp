//
//  MemeView.swift
//  CSC214_Project1
//
//  Created by Sifeng Chen on 9/30/22.
//

import SwiftUI

struct MemeView: View {
    @Environment (\.dismiss) private var dismiss
    @EnvironmentObject var model: Memes

    var body: some View {
        ZStack{
            Color.teal.edgesIgnoringSafeArea(.all)

        VStack{
            Spacer()
            Image(model.chosenMeme.image)
//                .onTapGesture(count:2){
//                    model.setFav()
//                }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .overlay(ZStack{
                Text(model.chosenMeme.line.localized()).font(.system(size:35)).fontWeight(.heavy).padding(6).foregroundColor(.white)
                
                }.opacity(0.8).padding(6), alignment: .bottom)
            .onTapGesture(count:2){
                model.setFav()
            }
            
            Text(model.showFav())
                .font(.system(size:30))
                .padding()

            Spacer()

            Button("goBack"){
                dismiss()
            }
            .font(.system(size:30))
            .padding()
            .foregroundColor(.white)
        }//end of VStack
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MemeView_Previews: PreviewProvider {
    static var previews: some View {
        MemeView()
    }
}
