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
    @IBOutlet weak var GridLabel2: GridLabel!
    @IBOutlet weak var GridLabel4: GridLabel!
    @IBOutlet weak var GridLabel6: GridLabel!
    @IBOutlet weak var GridLabel8: GridLabel!
    @IBOutlet weak var GridLabel9: GridLabel!
    @IBOutlet weak var GridLabel11: GridLabel!
    @IBOutlet weak var GridLabel13: GridLabel!
    @IBOutlet weak var GridLabel15: GridLabel!
    @IBOutlet weak var GridLabel18: GridLabel!
    @IBOutlet weak var GridLabel20: GridLabel!
    @IBOutlet weak var GridLabel22: GridLabel!
    @IBOutlet weak var GridLabel24: GridLabel!
    @IBOutlet weak var GridLabel25: GridLabel!
    @IBOutlet weak var GridLabel27: GridLabel!
    @IBOutlet weak var GridLabel29: GridLabel!
    @IBOutlet weak var GridLabel31: GridLabel!
    @IBOutlet weak var GridLabel34: GridLabel!
    @IBOutlet weak var GridLabel36: GridLabel!
    @IBOutlet weak var GridLabel38: GridLabel!
    @IBOutlet weak var GridLabel40: GridLabel!
    @IBOutlet weak var GridLabel41: GridLabel!
    @IBOutlet weak var GridLabel43: GridLabel!
    @IBOutlet weak var GridLabel45: GridLabel!
    @IBOutlet weak var GridLabel47: GridLabel!
    @IBOutlet weak var GridLabel50: GridLabel!
    @IBOutlet weak var GridLabel52: GridLabel!
    @IBOutlet weak var GridLabel54: GridLabel!
    @IBOutlet weak var GridLabel56: GridLabel!
    @IBOutlet weak var GridLabel57: GridLabel!
    @IBOutlet weak var GridLabel59: GridLabel!
    @IBOutlet weak var GridLabel61: GridLabel!
    @IBOutlet weak var GridLabel63: GridLabel!
    
    
    var squaresArray : [GridLabel]!
    
    var blackCheckerCount = 12
    var redCheckerCount = 12
    var king = false
    var blackTurn = true
    
    var redCheckers = [UIView]()
    var blackCheckers = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingBoard()
        squaresArray = [GridLabel2, GridLabel4, GridLabel6, GridLabel8, GridLabel9, GridLabel11, GridLabel13, GridLabel15, GridLabel18, GridLabel20, GridLabel22, GridLabel24, GridLabel25, GridLabel27, GridLabel29, GridLabel31, GridLabel34, GridLabel36, GridLabel38, GridLabel40, GridLabel41, GridLabel43, GridLabel45, GridLabel47, GridLabel50, GridLabel52, GridLabel54, GridLabel56, GridLabel57, GridLabel59, GridLabel61, GridLabel63]
    }
    @IBAction func onTappedGridLabel(sender: UITapGestureRecognizer) {
        openSquareChecker()
        for label in squaresArray {
            if CGRectContainsPoint(label.frame, sender.locationInView(BackgroundView)) {
                if blackTurn == true {
                    if (label.piece) {
                        if label.piece == true && label.inactive == false {
                            label.selected = true
                            label.moving = true
                        }
                    } else if label.openSquare {
                        label.destination = true
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                moveBlackPieces()
                                print(blackTurn)
                            }
                        }
                    } else if label.inactive {
                        label.eaten = true
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                blackPiecesEat()
                                print(blackTurn)
                            }
                        }
                    }
                } else if blackTurn == false {
                    if (label.piece) {
                        if label.piece == true && label.inactive == false {
                            label.selected = true
                            label.moving = true
                        }
                    } else if label.openSquare {
                        label.destination = true
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                moveRedPieces()
                                print(blackTurn)
                            }
                        }
                    } else if label.inactive {
                        label.eaten = true
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                redPiecesEat()
                                print(blackTurn)
                            }
                        }
                    }
                }
            }
        }
    }
    func startingBoard() {
        GridLabel2.text = "O"
        GridLabel2.textColor = UIColor.redColor()
        GridLabel4.text = "O"
        GridLabel4.textColor = UIColor.redColor()
        GridLabel6.text = "O"
        GridLabel6.textColor = UIColor.redColor()
        GridLabel8.text = "O"
        GridLabel8.textColor = UIColor.redColor()
        GridLabel9.text = "O"
        GridLabel9.textColor = UIColor.redColor()
        GridLabel11.text = "O"
        GridLabel11.textColor = UIColor.redColor()
        GridLabel13.text = "O"
        GridLabel13.textColor = UIColor.redColor()
        GridLabel15.text = "O"
        GridLabel15.textColor = UIColor.redColor()
        GridLabel18.text = "O"
        GridLabel18.textColor = UIColor.redColor()
        GridLabel20.text = "O"
        GridLabel20.textColor = UIColor.redColor()
        GridLabel22.text = "O"
        GridLabel22.textColor = UIColor.redColor()
        GridLabel24.text = "O"
        GridLabel24.textColor = UIColor.redColor()
        
        GridLabel41.text = "O"
        GridLabel41.textColor = UIColor.blackColor()
        GridLabel43.text = "O"
        GridLabel43.textColor = UIColor.blackColor()
        GridLabel45.text = "O"
        GridLabel45.textColor = UIColor.blackColor()
        GridLabel47.text = "O"
        GridLabel47.textColor = UIColor.blackColor()
        GridLabel50.text = "O"
        GridLabel50.textColor = UIColor.blackColor()
        GridLabel52.text = "O"
        GridLabel52.textColor = UIColor.blackColor()
        GridLabel54.text = "O"
        GridLabel54.textColor = UIColor.blackColor()
        GridLabel56.text = "O"
        GridLabel56.textColor = UIColor.blackColor()
        GridLabel57.text = "O"
        GridLabel57.textColor = UIColor.blackColor()
        GridLabel59.text = "O"
        GridLabel59.textColor = UIColor.blackColor()
        GridLabel61.text = "O"
        GridLabel61.textColor = UIColor.blackColor()
        GridLabel63.text = "O"
        GridLabel63.textColor = UIColor.blackColor()
    }
    func openSquareChecker() {
        for label in squaresArray {
            if label.text == "" {
                label.openSquare = true
                label.piece = false
                label.moving = false
                label.selected = false
            }
            if label.text == "O" {
                label.piece = true
                label.openSquare = false
                label.inactive = false
                label.eaten = false
                label.destination = false
            }
            if blackTurn == true {
                if label.text == "O" && label.textColor == UIColor.redColor() {
                    label.inactive = true
                    label.piece = false
                    label.moving = false
                    label.selected = false
                }
            } else if blackTurn == false{
                if label.text == "O" && label.textColor == UIColor.blackColor() {
                    label.inactive = true
                    label.piece = false
                    label.moving = false
                    label.selected = false
                }
                
            }
            
        }
    }
    func moveBlackPieces() {
        for label in squaresArray {
            if label.selected == true {
                for label in squaresArray {
                    if label.moving == true && label.textColor == UIColor.blackColor() {
                        label.text = ""
                        label.moving = false
                        openSquareChecker()
                    } else {
                        label.selected = false
                    }
                    if label.destination == true {
                        label.text = "O"
                        label.textColor = UIColor.blackColor()
                        openSquareChecker()
                        blackTurn = !blackTurn
                    }
                }
            }
        }
    }
    func moveRedPieces() {
        for label in squaresArray {
            if label.selected == true {
                for label in squaresArray {
                    if label.moving == true && label.textColor == UIColor.redColor() {
                        label.text = ""
                        label.moving = false
                        openSquareChecker()
                    } else {
                        label.selected = false
                    }
                    if label.destination == true {
                        label.text = "O"
                        label.textColor = UIColor.redColor()
                        openSquareChecker()
                        blackTurn = !blackTurn
                    }
                }
            }
        }
    }
    func blackPiecesEat() {
        for label in squaresArray {
            if label.selected == true {
                for label in squaresArray {
                    if label.moving == true && label.textColor == UIColor.blackColor() {
                        label.text = ""
                        label.moving = false
                        openSquareChecker()
                    } else {
                        label.selected = false
                    }
                    if label.eaten == true {
                        label.text = "O"
                        label.textColor = UIColor.blackColor()
                        openSquareChecker()
                        blackTurn = !blackTurn
                    }
                }
            }
        }
    }
    func redPiecesEat() {
        for label in squaresArray {
            if label.selected == true {
                for label in squaresArray {
                    if label.moving == true && label.textColor == UIColor.redColor() {
                        label.text = ""
                        label.moving = false
                        openSquareChecker()
                    } else {
                        label.selected = false
                    }
                    if label.eaten == true {
                        label.text = "O"
                        label.textColor = UIColor.redColor()
                        openSquareChecker()
                        blackTurn = !blackTurn
                    }
                }
            }
        }
    }
}
