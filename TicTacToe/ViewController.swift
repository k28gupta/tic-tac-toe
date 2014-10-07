//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kanupriya Gupta on 17/09/14.
//  Copyright (c) 2014 kanupriya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIAlertViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var player2Control: UISegmentedControl!
    @IBOutlet weak var player1Control: UISegmentedControl!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    @IBOutlet weak var currentPlayerValue: UILabel!
    var p2Value = 2
    var p1Value = 1
    
    override func viewDidLoad() {
        player1Control.addTarget(self, action: Selector("firstPlayerControlToggle:"), forControlEvents: UIControlEvents.AllEvents)
        Player.sharedInstance.setValueForPlayerOne(p1Value)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func firstPlayerControlToggle(sender :UISegmentedControl) {
        p1Value = player1Control.selectedSegmentIndex==0 ? 1 :2;
        
        player2Control.selectedSegmentIndex = player1Control.selectedSegmentIndex==0 ? 1:0
        Player.sharedInstance.setValueForPlayerOne(p1Value)
    }
    
    /* Collection View methods */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:Cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as Cell
        cell.setUp()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var cell :Cell = collectionView.cellForItemAtIndexPath(indexPath) as Cell
        var gameBoard = Board.sharedInstance
        
        if (gameBoard.state[indexPath.section][indexPath.row] == 0) {
            var player = Player.sharedInstance
            var value = player.getValues()
            currentPlayerValue.text = p1Value==value.value ? "Player 2" : "Player 1"
            cell.imageView.image = UIImage(named: value.imageName)
            
            var isGameOver:Bool = gameBoard.updateBoard(indexPath.section, mColumn: indexPath.row, value: value.value)
            if (isGameOver) {
                var alert :UIAlertView = UIAlertView(title: "Congrats", message: "Game Over", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                gameBoard.reset()
                collectionView.reloadData()
            }
        }
    }
}

