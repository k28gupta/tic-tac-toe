//
//  Cell.swift
//  TicTacToe
//
//  Created by Kanupriya Gupta on 18/09/14.
//  Copyright (c) 2014 kanupriya. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setUp () {
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.5
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
}
