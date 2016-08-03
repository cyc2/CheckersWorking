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
    var blackTurn = true
    
    var jumpLimiter = 0
    var invalidMove = false
    var win = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingBoard()
        squaresArray = [GridLabel2, GridLabel4, GridLabel6, GridLabel8, GridLabel9, GridLabel11, GridLabel13, GridLabel15, GridLabel18, GridLabel20, GridLabel22, GridLabel24, GridLabel25, GridLabel27, GridLabel29, GridLabel31, GridLabel34, GridLabel36, GridLabel38, GridLabel40, GridLabel41, GridLabel43, GridLabel45, GridLabel47, GridLabel50, GridLabel52, GridLabel54, GridLabel56, GridLabel57, GridLabel59, GridLabel61, GridLabel63]
    }
    @IBAction func onTappedGridLabel(sender: UITapGestureRecognizer) {
        invalidMove = false
        openSquareChecker()
        notKingFunction()
        for label in squaresArray {
            if CGRectContainsPoint(label.frame, sender.locationInView(BackgroundView)) {
                if blackTurn == true {
                    if (label.piece) {
                        if label.piece == true && label.inactive == false {
                            label.selected = true
                            label.moving = true
                            notKingFunction()
                        }
                    } else if label.openSquare {
                        label.destination = true
                        notKingFunction()
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                moveBlackPieces()
                                print(blackTurn)
                            }
                        }
                    } else if label.inactive {
                        label.eaten = true
                        if label.eaten == true {
                            print("eaten is true 1")
                        }
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
                            notKingFunction()
                        }
                    } else if label.openSquare {
                        label.destination = true
                        notKingFunction()
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                moveRedPieces()
                                print(blackTurn)
                            }
                        }
                    } else if label.inactive {
                        label.eaten = true
                        if label.eaten == true {
                            print("eaten is true 2")
                        }
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
        GridLabel2.text = "•"
        GridLabel2.textColor = UIColor.redColor()
        GridLabel4.text = "•"
        GridLabel4.textColor = UIColor.redColor()
        GridLabel6.text = "•"
        GridLabel6.textColor = UIColor.redColor()
        GridLabel8.text = "•"
        GridLabel8.textColor = UIColor.redColor()
        GridLabel9.text = "•"
        GridLabel9.textColor = UIColor.redColor()
        GridLabel11.text = "•"
        GridLabel11.textColor = UIColor.redColor()
        GridLabel13.text = "•"
        GridLabel13.textColor = UIColor.redColor()
        GridLabel15.text = "•"
        GridLabel15.textColor = UIColor.redColor()
        GridLabel18.text = "•"
        GridLabel18.textColor = UIColor.redColor()
        GridLabel20.text = "•"
        GridLabel20.textColor = UIColor.redColor()
        GridLabel22.text = "•"
        GridLabel22.textColor = UIColor.redColor()
        GridLabel24.text = "•"
        GridLabel24.textColor = UIColor.redColor()
        
        GridLabel41.text = "•"
        GridLabel41.textColor = UIColor.blackColor()
        GridLabel43.text = "•"
        GridLabel43.textColor = UIColor.blackColor()
        GridLabel45.text = "•"
        GridLabel45.textColor = UIColor.blackColor()
        GridLabel47.text = "•"
        GridLabel47.textColor = UIColor.blackColor()
        GridLabel50.text = "•"
        GridLabel50.textColor = UIColor.blackColor()
        GridLabel52.text = "•"
        GridLabel52.textColor = UIColor.blackColor()
        GridLabel54.text = "•"
        GridLabel54.textColor = UIColor.blackColor()
        GridLabel56.text = "•"
        GridLabel56.textColor = UIColor.blackColor()
        GridLabel57.text = "•"
        GridLabel57.textColor = UIColor.blackColor()
        GridLabel59.text = "•"
        GridLabel59.textColor = UIColor.blackColor()
        GridLabel61.text = "•"
        GridLabel61.textColor = UIColor.blackColor()
        GridLabel63.text = "•"
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
            if label.text == "•" {
                label.piece = true
                label.openSquare = false
                label.inactive = false
                label.eaten = false
                label.destination = false
            }
            if blackTurn == true {
                if label.text == "•" && label.textColor == UIColor.redColor() {
                    label.inactive = true
                    label.piece = false
                    label.moving = false
                    label.selected = false
                }
            } else if blackTurn == false {
                if label.text == "•" && label.textColor == UIColor.blackColor() {
                    label.inactive = true
                    label.piece = false
                    label.moving = false
                    label.selected = false
                }
                
            }
        }
        invalidMove = false
    }
    func moveBlackPieces() {
        if invalidMove == true {
            
        } else {
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
                            label.text = "•"
                            label.textColor = UIColor.blackColor()
                            openSquareChecker()
                            blackTurn = !blackTurn
                        }
                    }
                }
            }
        }
        resetLabelValues()
    }
    func moveRedPieces() {
        if invalidMove == true {
            
        } else {
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
                            label.text = "•"
                            label.textColor = UIColor.redColor()
                            openSquareChecker()
                            blackTurn = !blackTurn
                        }
                    }
                }
            }
        }
        resetLabelValues()
    }
    func blackPiecesEat() {
        var mLabelIndex = 0
        if invalidMove == true {
            
        } else {
            for label in squaresArray {
                if label.selected == true {
                    //print("Test 1")
                    for label in squaresArray {
                        if label.moving == true {
                            label.text = ""
                            label.moving = false
                            mLabelIndex = squaresArray.indexOf(label)!
                            //print(squaresArray.indexOf(label))
                            //print("Test 2")
                        } else {
                            label.selected = false
                            //print("Test 3")
                        }
                        if label.eaten == true {
                            label.text = ""
                            label.textColor = UIColor.blackColor()
                            let labelIndex = squaresArray.indexOf(label)
                            //print(labelIndex)
                            let label2 = squaresArray[labelIndex! - 4]
                            let label3 = squaresArray[labelIndex! - 6]
                            if labelIndex == 0 {
                                label2.text = "•"
                                label2.textColor = UIColor.blackColor()
                            }
                            if labelIndex == 0 {
                                label3.text = "•"
                                label3.textColor = UIColor.blackColor()
                            }
                            openSquareChecker()
                            blackTurn = !blackTurn
                            //print("Test 4")
                            redCheckerCount -= 1
                            checkForWinner()
                            resetGame()
                        }
                    }
                }
            }
        }
        resetLabelValues()
    }
    func redPiecesEat() {
        var mLabelIndex = 0
        if invalidMove == true {
            
        } else {
            for label in squaresArray {
                if label.selected == true {
                    //print("Test 1")
                    for label in squaresArray {
                        if label.moving == true {
                            label.text = ""
                            label.moving = false
                            //print("Test 2")
                        } else {
                            label.selected = false
                            //print("Test 3")
                        }
                        if label.eaten == true {
                            label.text = ""
                            label.textColor = UIColor.redColor()
                            let labelIndex = squaresArray.indexOf(label)
                            let label2 = squaresArray[labelIndex! + 4]
                            let label3 = squaresArray[labelIndex! + 6]
                            if labelIndex == 0 {
                                label2.text = "•"
                                label2.textColor = UIColor.redColor()
                            }
                            if labelIndex == 0 {
                                label3.text = "•"
                                label3.textColor = UIColor.redColor()
                            }
                            openSquareChecker()
                            blackTurn = !blackTurn
                            //print("Test 4")
                            blackCheckerCount -= 1
                            checkForWinner()
                            resetGame()
                        }
                    }
                }
            }
        }
        resetLabelValues()
    }
    func checkForWinner() {
        if blackCheckerCount == 0 {
            let alert = UIAlertController(title: "Red wins the Game!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Reset", style: .Default, handler: { (action) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            win = true
        }
        if redCheckerCount == 0 {
            let alert = UIAlertController(title: "Black wins the Game!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Reset", style: .Default, handler: { (action) in
            }))
            presentViewController(alert, animated: true, completion: nil)
            win = true
        }
    }
    func resetGame() {
        if win == true {
            let alert = UIAlertController(title: "Are you sure you want to restart?", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "No", style: .Destructive, handler: nil))
            alert.addAction(UIAlertAction(title: "Restart", style: .Default, handler: { (action) in
                self.blackCheckerCount = 12
                self.redCheckerCount = 12
                self.startingBoard()
            }))
            presentViewController(alert, animated: true, completion: nil)
        }
        win = false
    }
    func notKingFunction() -> Bool {
        var mLabelValue = 0
        var dLabelValue = 10
        for label in squaresArray {
            if label.moving == true {
                mLabelValue = label.tag
            }
            if label.destination == true {
                dLabelValue = label.tag
            }
            if dLabelValue != 10 && mLabelValue != 0 {
                if mLabelValue < dLabelValue && blackTurn == true && label.destination == true {
                    invalidMove = true
                }
                if mLabelValue > dLabelValue && blackTurn == false && label.destination == false {
                    invalidMove = true
                }
            }
        }
        return invalidMove
    }
    func resetLabelValues() {
        for label in squaresArray {
            label.piece = false
            label.openSquare = false
            label.inactive = false
            label.moving = false
            label.destination = false
            label.eaten = false
            label.selected = false
            label.king = false
        }
    }
}

