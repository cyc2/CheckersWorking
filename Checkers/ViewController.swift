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
    @IBOutlet weak var jumpButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    
    var squaresArray : [GridLabel]!
    
    var blackCheckerCount = 12
    var redCheckerCount = 12
    var blackTurn = true
    
    var jumpLimiter = 0
    var invalidMove = false
    var win = false
    var mLabelIndex = 0
    var previousMLabelIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squaresArray = [GridLabel2, GridLabel4, GridLabel6, GridLabel8, GridLabel9, GridLabel11, GridLabel13, GridLabel15, GridLabel18, GridLabel20, GridLabel22, GridLabel24, GridLabel25, GridLabel27, GridLabel29, GridLabel31, GridLabel34, GridLabel36, GridLabel38, GridLabel40, GridLabel41, GridLabel43, GridLabel45, GridLabel47, GridLabel50, GridLabel52, GridLabel54, GridLabel56, GridLabel57, GridLabel59, GridLabel61, GridLabel63]
        startingBoard()
        jumpButton.enabled = false
        statusLabel.text = "Standard"
        turnLabel.text = "Black's Turn"
        jumpButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        jumpButton.setTitleColor(UIColor(white: 0, alpha: 0.2), forState: .Disabled)
    }
    @IBAction func onTappedGridLabel(sender: UITapGestureRecognizer) {
        invalidMove = false
        statusLabel.text = "Standard"
        openSquareChecker()
        notKingFunction()
        isKingFunction()
        for label in squaresArray {
            if CGRectContainsPoint(label.frame, sender.locationInView(BackgroundView)) {
                if blackTurn == true {
                    if (label.piece) {
                        if label.piece == true && label.inactive == false {
                            label.selected = true
                            label.moving = true
                            notKingFunction()
                            isKingFunction()
                        }
                    } else if label.destination == true {
                        resetLabelValues()
                        break
                    } else if label.openSquare {
                        label.destination = true
                        notKingFunction()
                        isKingFunction()
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                moveBlackPieces()
                            }
                        }
                    } else if label.inactive {
                        label.eaten = true
                        if label.eaten == true {
                            //print("eaten is true 1")
                        }
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                blackPiecesEat()
                            }
                        }
                    }
                } else if blackTurn == false {
                    if (label.piece) {
                        if label.piece == true && label.inactive == false {
                            label.selected = true
                            label.moving = true
                            notKingFunction()
                            isKingFunction()
                        }
                    } else if label.destination == true {
                        resetLabelValues()
                        break
                    } else if label.openSquare {
                        label.destination = true
                        notKingFunction()
                        isKingFunction()
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                moveRedPieces()
                            }
                        }
                    } else if label.inactive {
                        label.eaten = true
                        if label.eaten == true {
                            //print("eaten is true 2")
                        }
                        for label in squaresArray {
                            if label.moving == true {
                                label.piece = true
                                redPiecesEat()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func startingBoard() {
        for label in squaresArray {
            let labelPlace = squaresArray.indexOf(label)
            print(labelPlace)
            switch labelPlace! {
            case 0...11:
                label.text = "•"
                label.textColor = UIColor.redColor()
            case 20...31:
                label.text = "•"
                label.textColor = UIColor.blackColor()
            default:
                label.text = ""
                label.textColor = UIColor.blackColor()
            }
        }

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
        if blackTurn == true {
            for label in squaresArray {
                if label.openSquare == true {
                    label.textColor = UIColor.blackColor()
                }
            }
        } else {
            for label in squaresArray {
                if label.openSquare == true {
                    label.textColor = UIColor.redColor()
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
                            turnLabel.text = "Red's Turn"
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
                            turnLabel.text = "Black's Turn"
                        }
                    }
                }
            }
        }
        resetLabelValues()
    }
    func blackPiecesEat() {
        if invalidMove == true {
            
        } else {
            for label in squaresArray {
                if label.selected == true {
                    //print("Test 1")
                    if label.king == true {
                        blackKingEats()
                    } else {
                        for label in squaresArray.reverse() {
                            if label.moving == true {
                                label.text = ""
                                label.moving = false
                                label.jumping = true
                                previousMLabelIndex = mLabelIndex
                                mLabelIndex = squaresArray.indexOf(label)!
                                //print(squaresArray.indexOf(label))
                                //print("Test 2")
                            } else {
                                label.selected = false
                                //print("Test 3")
                            }
                            if label.eaten == true {
                                let labelIndex = squaresArray.indexOf(label)
                                let label2 = squaresArray[labelIndex! - 4]
                                let label3 = squaresArray[labelIndex! - 5]
                                /*if label2.text == "•" {
                                 break
                                 }
                                 if label3.text == "•" {
                                 break
                                 }*/
                                label.text = ""
                                label.textColor = UIColor.blackColor()
                                print(mLabelIndex - labelIndex!)
                                if (mLabelIndex - labelIndex! == 3) {
                                    label2.text = "•"
                                    label2.textColor = UIColor.blackColor()
                                }
                                if (mLabelIndex - labelIndex! == 4) {
                                    label3.text = "•"
                                    label3.textColor = UIColor.blackColor()
                                }
                                if (mLabelIndex - labelIndex! == 5) {
                                    label2.text = "•"
                                    label2.textColor = UIColor.blackColor()
                                }
                                openSquareChecker()
                                //print("Test 4")
                                multipleJumps()
                                redCheckerCount -= 1
                                checkForWinner()
                                resetGame()
                            }
                        }
                    }
                }
            }
        }
        resetLabelValues()
    }
    func redPiecesEat() {
        if invalidMove == true {
            
        } else {
            for label in squaresArray {
                if label.selected == true {
                    //print("Test 1")
                    if label.king == true {
                        redKingEats()
                    } else {
                        for label in squaresArray {
                            if label.moving == true {
                                label.text = ""
                                label.moving = false
                                label.jumping = true
                                mLabelIndex = squaresArray.indexOf(label)!
                                //print("Test 2")
                            } else {
                                label.selected = false
                                //print("Test 3")
                            }
                            if label.eaten == true {
                                let labelIndex = squaresArray.indexOf(label)
                                let label2 = squaresArray[labelIndex! + 4]
                                let label3 = squaresArray[labelIndex! + 5]
                                /*if label2.text == "•" {
                                 break
                                 }
                                 if label3.text == "•" {
                                 break
                                 }*/
                                label.text = ""
                                label.textColor = UIColor.redColor()
                                print(labelIndex! - mLabelIndex)
                                if (labelIndex! - mLabelIndex == 3) {
                                    label2.text = "•"
                                    label2.textColor = UIColor.redColor()
                                }
                                if (labelIndex! - mLabelIndex == 4) {
                                    label3.text = "•"
                                    label3.textColor = UIColor.redColor()
                                }
                                if (labelIndex! - mLabelIndex == 5) {
                                    label2.text = "•"
                                    label2.textColor = UIColor.redColor()
                                }
                                openSquareChecker()
                                //print("Test 4")
                                multipleJumps()
                                blackCheckerCount -= 1
                                checkForWinner()
                                resetGame()
                            }
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
            
            //print(mLabelValue - 1 != dLabelValue)
            //print(blackTurn)
            //print(label.destination)
            
            if dLabelValue != 10 && mLabelValue != 0 && label.king == false {
                if mLabelValue < dLabelValue && blackTurn == true && label.destination == true {
                    invalidMove = true
                    //print(mLabelValue)
                    //print(dLabelValue)
                    //print("Invalid 1")
                }
                if mLabelValue > dLabelValue && blackTurn == false && label.destination == false {
                    invalidMove = true
                    //print(mLabelValue)
                    //print(dLabelValue)
                    //print("Invalid 2")
                }
                if  mLabelValue - 1 != dLabelValue && blackTurn == true {
                    invalidMove = true
                    //print(mLabelValue)
                    //print(dLabelValue)
                    //print("Invalid 3")
                }
                if  mLabelValue + 1 != dLabelValue && blackTurn == false {
                    invalidMove = true
                    //print(mLabelValue)
                    //print(dLabelValue)
                    //print("Invalid 4")
                }
            }
        }
        return invalidMove
    }
    func isKingFunction() {
        for label in squaresArray {
            if label.tag == 0 && label.textColor == UIColor.blackColor() {
                label.king = true
                invalidMove = false
            } else if label.tag == 7 && label.textColor == UIColor.redColor() {
                label.king = true
                invalidMove = false
            }
            if label.selected == true && label.king == true {
                statusLabel.text = "King"
            }
        }
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
            label.jumping = false
        }
        if blackTurn == true {
            for label in squaresArray {
                if label.openSquare == true {
                    label.textColor = UIColor.blackColor()
                }
            }
        } else {
            for label in squaresArray {
                if label.openSquare == true {
                    label.textColor = UIColor.redColor()
                }
            }
        }
    }
    func multipleJumps() {
        jumpButton.enabled = true
        
    }
    @IBAction func onTappedJumpButton(sender: UIButton) {
        blackTurn = !blackTurn
        if blackTurn == true {
            turnLabel.text = "Black's Turn"
        } else {
            turnLabel.text = "Red's Turn"
        }
        jumpButton.enabled = false
    }
    @IBAction func onTappedResignButton(sender: AnyObject) {
        let alert = UIAlertController(title: "Are you sure you want to resign?", message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "No", style: .Destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action) in
            self.playerResigned()
        }))
        presentViewController(alert, animated: true, completion: nil)
    }
    func playerResigned() {
        if blackTurn == true {
            let alert = UIAlertController(title: "Red Wins!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Destructive, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Black Wins!", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Destructive, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
        blackCheckerCount = 12
        redCheckerCount = 12
        startingBoard()
    }
    func redKingEats() {
        for label in squaresArray.reverse() {
            if label.moving == true {
                label.text = ""
                label.moving = false
                label.jumping = true
                previousMLabelIndex = mLabelIndex
                mLabelIndex = squaresArray.indexOf(label)!
                //print(squaresArray.indexOf(label))
                //print("Test 2")
            } else {
                label.selected = false
                //print("Test 3")
            }
            if label.eaten == true {
                let labelIndex = squaresArray.indexOf(label)
                var label2 = squaresArray[labelIndex! - 2]
                var label3 = squaresArray[labelIndex! - 3]
                if label.tag < 6 || labelIndex == 29 || labelIndex == 30 {
                    label2 = squaresArray[labelIndex! - 4]
                    label3 = squaresArray[labelIndex! - 5]
                }
                /*if label2.text == "•" {
                 break
                 }
                 if label3.text == "•" {
                 break
                 }*/
                label.text = ""
                label.textColor = UIColor.redColor()
                print(mLabelIndex - labelIndex!)
                if (mLabelIndex - labelIndex! == 3) {
                    label2.text = "•"
                    label2.textColor = UIColor.redColor()
                }
                if (mLabelIndex - labelIndex! == 4) {
                    label3.text = "•"
                    label3.textColor = UIColor.redColor()
                }
                if (mLabelIndex - labelIndex! == 5) {
                    label2.text = "•"
                    label2.textColor = UIColor.redColor()
                }
                openSquareChecker()
                //print("Test 4")
                multipleJumps()
                blackCheckerCount -= 1
                checkForWinner()
                resetGame()
            }
        }
        resetLabelValues()
    }
    func blackKingEats() {
        for label in squaresArray {
            if label.moving == true {
                label.text = ""
                label.moving = false
                label.jumping = true
                mLabelIndex = squaresArray.indexOf(label)!
                //print("Test 2")
            } else {
                label.selected = false
                //print("Test 3")
            }
            if label.eaten == true {
                let labelIndex = squaresArray.indexOf(label)
                var label2 = squaresArray[labelIndex! + 2]
                var label3 = squaresArray[labelIndex! + 3]
                if label.tag > 1 || labelIndex == 2 || labelIndex == 3 {
                    label2 = squaresArray[labelIndex! - 4]
                    label3 = squaresArray[labelIndex! - 5]
                }
                /*if label2.text == "•" {
                 break
                 }
                 if label3.text == "•" {
                 break
                 }*/
                label.text = ""
                label.textColor = UIColor.blackColor()
                print(labelIndex! - mLabelIndex)
                if (labelIndex! - mLabelIndex == 3) {
                    label2.text = "•"
                    label2.textColor = UIColor.blackColor()
                }
                if (labelIndex! - mLabelIndex == 4) {
                    label3.text = "•"
                    label3.textColor = UIColor.blackColor()
                }
                if (labelIndex! - mLabelIndex == 5) {
                    label2.text = "•"
                    label2.textColor = UIColor.blackColor()
                }
                openSquareChecker()
                //print("Test 4")
                multipleJumps()
                redCheckerCount -= 1
                checkForWinner()
                resetGame()
            }
        }
        resetLabelValues()
    }
}

