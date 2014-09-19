//
//  Board.swift
//  TicTacToe
//
//  Created by Kanupriya Gupta on 17/09/14.
//  Copyright (c) 2014 kanupriya. All rights reserved.
//

import UIKit

class Board: NSObject {
    let size:Int = 3
    var state:Array<Array<Int>> = []
    var observer:StateObserver = StateObserver()

    override init() {
        super.init()
        initializeBoard()
    }
    
    class var sharedInstance :Board {
    struct Singleton {
        static let instance = Board()
        }
        return Singleton.instance
    }
    
    func updateBoard(mRow :Int, mColumn:Int, value:Int) -> Bool {
        
        for row in 0...self.state.count-1 {
            if (row == mRow) {
                for column in  0...self.state.count-1 {
                    if (column == mColumn) {
                        self.state[row][column] = value
                        return self.observer.continueGame(self.state,row: mRow, col: mColumn)
                    }
                }
            }
        }
        return false
    }

    func reset() {
       initializeBoard()
    }
    
    func initializeBoard () {
        self.state = [[0,0,0], [0,0,0], [0,0,0]]
        observer = StateObserver(gameState: self.state)
        
    }

}
