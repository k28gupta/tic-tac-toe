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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
            cell.imageView.image = UIImage(named: value.imageName)
            
            var tmep:Bool = gameBoard.updateBoard(indexPath.section, mColumn: indexPath.row, value: value.value)
            if (tmep) {
                var alert :UIAlertView = UIAlertView(title: "Congrats", message: "Game Over", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                gameBoard.reset()
                collectionView.reloadData()
            }
        }
    }
}

