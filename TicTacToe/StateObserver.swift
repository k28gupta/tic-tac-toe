//
//  StateObserver.swift
//  TicTacToe
//
//  Created by Kanupriya Gupta on 17/09/14.
//  Copyright (c) 2014 kanupriya. All rights reserved.
//

import UIKit

class StateObserver: NSObject {
    var state: Array<Array<Int>>
    let maxIndex:Int
    
    override init() {
        maxIndex = 0
        self.state = []
    }
    
    init(gameState: Array<Array<Int>>) {
    self.state = gameState
    maxIndex = state.count-1
    }
    
    func continueGame(updatedState :Array<Array<Int>>,row :Int, col :Int) -> Bool {
        self.state = updatedState
        var complete :Bool = false
        if (row == col) {
            complete = complete || primaryDiagonalComplete() || rowComplete(row) || columnComplete(col)
        }
        else if (col == state.count-row-1) {
            complete = complete || secondaryDiagComplete() || rowComplete(row) || columnComplete(col)
        }
        else {
            complete = complete || rowComplete(row) || columnComplete(col)
        }
        
      return complete
    }
    
    func rowComplete(row :Int) -> Bool {
        var firstVal:Int = state[row][0]
        for count in 0...maxIndex {
            if state[row][count] != firstVal {
                return false
            }
        }
        return true
    }
    
    func columnComplete(col :Int) -> Bool {
        var firstVal:Int = state[0][col]
        for count in 0...maxIndex {
            if firstVal !=   state[count][col] {
                return false
            }
            
        }
        return true
    }
    
    func primaryDiagonalComplete() -> Bool {
        var primaryDiagValue:Int = state[0][0]
        for row in 0...maxIndex {
            if (state[row][row] != primaryDiagValue) {
                return false
            }
        }
        return true
    }
    
    func secondaryDiagComplete() -> Bool {
         var secDiagValue = state[0][2]
        for row in 0...maxIndex {
            for col in 0...maxIndex {
                if (col == state.count-row-1) {
                    if (state[row][col] != secDiagValue) {
                        return false
                    }
                }
            }
        }
        return true
    }
 }
