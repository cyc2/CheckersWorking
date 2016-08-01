//
//  ViewController.swift
//  Checkers
//
//  Created by Chris on 7/29/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var GridLabel1: GridLabel!
    @IBOutlet weak var GridLabel2: GridLabel!
    @IBOutlet weak var GridLabel3: GridLabel!
    @IBOutlet weak var GridLabel4: GridLabel!
    @IBOutlet weak var GridLabel5: GridLabel!
    @IBOutlet weak var GridLabel6: GridLabel!
    @IBOutlet weak var GridLabel7: GridLabel!
    @IBOutlet weak var GridLabel8: GridLabel!
    @IBOutlet weak var GridLabel9: GridLabel!
    @IBOutlet weak var GridLabel10: GridLabel!
    @IBOutlet weak var GridLabel11: GridLabel!
    @IBOutlet weak var GridLabel12: GridLabel!
    @IBOutlet weak var GridLabel13: GridLabel!
    @IBOutlet weak var GridLabel14: GridLabel!
    @IBOutlet weak var GridLabel15: GridLabel!
    @IBOutlet weak var GridLabel16: GridLabel!
    @IBOutlet weak var GridLabel17: GridLabel!
    @IBOutlet weak var GridLabel18: GridLabel!
    @IBOutlet weak var GridLabel19: GridLabel!
    @IBOutlet weak var GridLabel20: GridLabel!
    @IBOutlet weak var GridLabel21: GridLabel!
    @IBOutlet weak var GridLabel22: GridLabel!
    @IBOutlet weak var GridLabel23: GridLabel!
    @IBOutlet weak var GridLabel24: GridLabel!
    @IBOutlet weak var GridLabel25: GridLabel!
    @IBOutlet weak var GridLabel26: GridLabel!
    @IBOutlet weak var GridLabel27: GridLabel!
    @IBOutlet weak var GridLabel28: GridLabel!
    @IBOutlet weak var GridLabel29: GridLabel!
    @IBOutlet weak var GridLabel30: GridLabel!
    @IBOutlet weak var GridLabel31: GridLabel!
    @IBOutlet weak var GridLabel32: GridLabel!
    @IBOutlet weak var GridLabel33: GridLabel!
    @IBOutlet weak var GridLabel34: GridLabel!
    @IBOutlet weak var GridLabel35: GridLabel!
    @IBOutlet weak var GridLabel36: GridLabel!
    @IBOutlet weak var GridLabel37: GridLabel!
    @IBOutlet weak var GridLabel38: GridLabel!
    @IBOutlet weak var GridLabel39: GridLabel!
    @IBOutlet weak var GridLabel40: GridLabel!
    @IBOutlet weak var GridLabel41: GridLabel!
    @IBOutlet weak var GridLabel42: GridLabel!
    @IBOutlet weak var GridLabel43: GridLabel!
    @IBOutlet weak var GridLabel44: GridLabel!
    @IBOutlet weak var GridLabel45: GridLabel!
    @IBOutlet weak var GridLabel46: GridLabel!
    @IBOutlet weak var GridLabel47: GridLabel!
    @IBOutlet weak var GridLabel48: GridLabel!
    @IBOutlet weak var GridLabel49: GridLabel!
    @IBOutlet weak var GridLabel50: GridLabel!
    @IBOutlet weak var GridLabel51: GridLabel!
    @IBOutlet weak var GridLabel52: GridLabel!
    @IBOutlet weak var GridLabel53: GridLabel!
    @IBOutlet weak var GridLabel54: GridLabel!
    @IBOutlet weak var GridLabel55: GridLabel!
    @IBOutlet weak var GridLabel56: GridLabel!
    @IBOutlet weak var GridLabel57: GridLabel!
    @IBOutlet weak var GridLabel58: GridLabel!
    @IBOutlet weak var GridLabel59: GridLabel!
    @IBOutlet weak var GridLabel60: GridLabel!
    @IBOutlet weak var GridLabel61: GridLabel!
    @IBOutlet weak var GridLabel62: GridLabel!
    @IBOutlet weak var GridLabel63: GridLabel!
    @IBOutlet weak var GridLabel64: GridLabel!
    
    var squaresArray : [GridLabel]!
    
    var blackCheckerCount = 12
    var redCheckerCount = 12
    var king = false
    var blackTurn = true
    var pieceSelected = false
    
    var redCheckers = [UIView]()
    var blackCheckers = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingBoard()
        squaresArray = [GridLabel2, GridLabel4, GridLabel6, GridLabel8, GridLabel9, GridLabel11, GridLabel13, GridLabel15, GridLabel18, GridLabel20, GridLabel22, GridLabel24, GridLabel25, GridLabel27, GridLabel29, GridLabel31, GridLabel34, GridLabel36, GridLabel38, GridLabel40, GridLabel41, GridLabel43, GridLabel45, GridLabel47, GridLabel50, GridLabel52, GridLabel54, GridLabel56, GridLabel57, GridLabel59, GridLabel61, GridLabel63]
    }
    @IBAction func onTappedGridLabel(sender: UITapGestureRecognizer) {
        print("tapped gridLabel")
        checkPieces()
        for label in squaresArray {
            if CGRectContainsPoint(label.frame, sender.locationInView(BackgroundView)) {
                if (label.canTap) {
                    if blackTurn == true {
                        pieceSelected = true
                        print(pieceSelected)
                        label.wasTapped = true
                    } else {
                    }
                } else {
                    label.wasTapped = true
                    label.canTap = true
                    movePieces()
                }
            }
        }
    }
    func startingBoard() {
        GridLabel2.text = "O"
        GridLabel4.text = "O"
        GridLabel6.text = "O"
        GridLabel8.text = "O"
        GridLabel9.text = "O"
        GridLabel11.text = "O"
        GridLabel13.text = "O"
        GridLabel15.text = "O"
        GridLabel18.text = "O"
        GridLabel20.text = "O"
        GridLabel22.text = "O"
        GridLabel24.text = "O"
        
        GridLabel41.text = "O"
        GridLabel43.text = "O"
        GridLabel45.text = "O"
        GridLabel47.text = "O"
        GridLabel50.text = "O"
        GridLabel52.text = "O"
        GridLabel54.text = "O"
        GridLabel56.text = "O"
        GridLabel57.text = "O"
        GridLabel59.text = "O"
        GridLabel61.text = "O"
        GridLabel63.text = "O"
    }
    func checkPieces() {
        for label in squaresArray {
            if label.text == "O" {
                label.canTap = true
            }
            
        }
    }
    func movePieces() {
        if pieceSelected == true {
            for label in squaresArray {
                if label.wasTapped == true {
                    label.text = "O"

                    label.wasTapped = false
                } else {
                    pieceSelected = false
                }
            }
        } else {
            
        }
    }
}
