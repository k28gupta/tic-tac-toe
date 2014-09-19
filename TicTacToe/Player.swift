//
//  Player.swift
//  TicTacToe
//
//  Created by Kanupriya Gupta on 19/09/14.
//  Copyright (c) 2014 kanupriya. All rights reserved.
//

import UIKit

class Player: NSObject {
    var value :Int = 1
    
    override init() {
        super.init()
        initializePlayer()
    }
    
    class var sharedInstance :Player {
    struct Singleton {
        static let instance = Player()
        }
        return Singleton.instance
    }
    
    func toggle () {
        value = value==1 ? 2 : 1
    }
    func initializePlayer() {
        value = 1
    }
    
    func getValues () -> (value:Int, imageName:String) {
        var imageName:String
        var val = value
        if val == 1 {
            imageName = "zero"
        }
        else {
            imageName = "cross"
        }
        toggle()
        return (val, imageName)
        
    }
}
