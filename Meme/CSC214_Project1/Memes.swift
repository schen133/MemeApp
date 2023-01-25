//
//  Memes.swift
//  CSC214_Project1
//
//  Created by Sifeng Chen on 9/30/22.
//

import Foundation

extension String{ //using it to convert string variable name from string file Localizable.
    func localized() -> String{
        NSLocalizedString(self, tableName:"Localizable", bundle:.main, value:self, comment: self)
    }
    
}

class Memes: ObservableObject{
    @Published var memeCount = 0
    @Published var chosenMeme = meme(line:"initial", image:"bruh", fav:false)
    
    struct meme{
        let line: String
        let image: String
        var fav: Bool
    }
    
    //everytime reset button is pressed, calls reset function and increments memeCount
    func getMeme(){
        let memeList: [meme] = [//english
            meme(line:"s1", image:"littlegirl", fav:false),
                                meme(line:"s2", image:"ohnah", fav:false),
                                meme(line:"s3", image:"pikachu", fav:false),
                                meme(line:"s4", image:"frenchMeme".localized(), fav:false),
                                meme(line:"s5", image:"reddoll", fav:false),
                                meme(line:"s6", image:"shrek", fav:false),
                                meme(line:"s7", image:"whitecat", fav:false),
                                meme(line:"s8", image:"whylying", fav:false)
                               ]
        
       
        chosenMeme = memeList.randomElement()!
        memeCount+=1;
    }
    
    func getFrenchSpeical() {
        chosenMeme = meme(line:"s4", image:"frenchMeme".localized(), fav:false)
        memeCount += 1;
    }
    
    func setFav(){
        if chosenMeme.fav == false{
            chosenMeme.fav = true
        } else {
            chosenMeme.fav = false
        }
        
    }
    
    func showFav() -> String{
       
        if chosenMeme.fav == true{
            return "⭐️"
        }
        else {
            return ""
        }
    }
    
    
    
    
    
    
}



