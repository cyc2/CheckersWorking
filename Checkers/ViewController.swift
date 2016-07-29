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
    @IBOutlet weak var GridLabel1: UILabel!
    @IBOutlet weak var GridLabel2: UILabel!
    @IBOutlet weak var GridLabel3: UILabel!
    @IBOutlet weak var GridLabel4: UILabel!
    @IBOutlet weak var GridLabel5: UILabel!
    @IBOutlet weak var GridLabel6: UILabel!
    @IBOutlet weak var GridLabel7: UILabel!
    @IBOutlet weak var GridLabel8: UILabel!
    @IBOutlet weak var GridLabel9: UILabel!
    @IBOutlet weak var GridLabel10: UILabel!
    @IBOutlet weak var GridLabel11: UILabel!
    @IBOutlet weak var GridLabel12: UILabel!
    @IBOutlet weak var GridLabel13: UILabel!
    @IBOutlet weak var GridLabel14: UILabel!
    @IBOutlet weak var GridLabel15: UILabel!
    @IBOutlet weak var GridLabel16: UILabel!
    @IBOutlet weak var GridLabel17: UILabel!
    @IBOutlet weak var GridLabel18: UILabel!
    @IBOutlet weak var GridLabel19: UILabel!
    @IBOutlet weak var GridLabel20: UILabel!
    @IBOutlet weak var GridLabel21: UILabel!
    @IBOutlet weak var GridLabel22: UILabel!
    @IBOutlet weak var GridLabel23: UILabel!
    @IBOutlet weak var GridLabel24: UILabel!
    @IBOutlet weak var GridLabel25: UILabel!
    @IBOutlet weak var GridLabel26: UILabel!
    @IBOutlet weak var GridLabel27: UILabel!
    @IBOutlet weak var GridLabel28: UILabel!
    @IBOutlet weak var GridLabel29: UILabel!
    @IBOutlet weak var GridLabel30: UILabel!
    @IBOutlet weak var GridLabel31: UILabel!
    @IBOutlet weak var GridLabel32: UILabel!
    @IBOutlet weak var GridLabel33: UILabel!
    @IBOutlet weak var GridLabel34: UILabel!
    @IBOutlet weak var GridLabel35: UILabel!
    @IBOutlet weak var GridLabel36: UILabel!
    @IBOutlet weak var GridLabel37: UILabel!
    @IBOutlet weak var GridLabel38: UILabel!
    @IBOutlet weak var GridLabel39: UILabel!
    @IBOutlet weak var GridLabel40: UILabel!
    @IBOutlet weak var GridLabel41: UILabel!
    @IBOutlet weak var GridLabel42: UILabel!
    @IBOutlet weak var GridLabel43: UILabel!
    @IBOutlet weak var GridLabel44: UILabel!
    @IBOutlet weak var GridLabel45: UILabel!
    @IBOutlet weak var GridLabel46: UILabel!
    @IBOutlet weak var GridLabel47: UILabel!
    @IBOutlet weak var GridLabel48: UILabel!
    @IBOutlet weak var GridLabel49: UILabel!
    @IBOutlet weak var GridLabel50: UILabel!
    @IBOutlet weak var GridLabel51: UILabel!
    @IBOutlet weak var GridLabel52: UILabel!
    @IBOutlet weak var GridLabel53: UILabel!
    @IBOutlet weak var GridLabel54: UILabel!
    @IBOutlet weak var GridLabel55: UILabel!
    @IBOutlet weak var GridLabel56: UILabel!
    @IBOutlet weak var GridLabel57: UILabel!
    @IBOutlet weak var GridLabel58: UILabel!
    @IBOutlet weak var GridLabel59: UILabel!
    @IBOutlet weak var GridLabel60: UILabel!
    @IBOutlet weak var GridLabel61: UILabel!
    @IBOutlet weak var GridLabel62: UILabel!
    @IBOutlet weak var GridLabel63: UILabel!
    @IBOutlet weak var GridLabel64: UILabel!
    
    var squaresArray : [UILabel]!
    
    var blackCheckerCount = 12
    var redCheckerCount = 12
    var king = false
    
    var redCheckers = [UIView]()
    var blackCheckers = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squaresArray = [GridLabel1, GridLabel2, GridLabel3, GridLabel4, GridLabel5, GridLabel6, GridLabel7, GridLabel8, GridLabel9, GridLabel10, GridLabel11, GridLabel12, GridLabel13, GridLabel14,GridLabel15, GridLabel16, GridLabel17, GridLabel18, GridLabel19, GridLabel20, GridLabel21, GridLabel22, GridLabel23, GridLabel24, GridLabel25, GridLabel26, GridLabel27, GridLabel28, GridLabel29, GridLabel30, GridLabel31, GridLabel32, GridLabel33, GridLabel34, GridLabel35, GridLabel36, GridLabel37, GridLabel38, GridLabel39, GridLabel40, GridLabel41, GridLabel42, GridLabel43, GridLabel44, GridLabel45, GridLabel46, GridLabel47, GridLabel48, GridLabel49, GridLabel50, GridLabel51, GridLabel52, GridLabel53, GridLabel54, GridLabel55, GridLabel56, GridLabel57, GridLabel58, GridLabel59, GridLabel60, GridLabel61, GridLabel62, GridLabel63, GridLabel64]
    }
    @IBAction func onTappedGridLabel(sender: UITapGestureRecognizer) {
        print("tapped gridLabel")
        for label in squaresArray {
            if CGRectContainsPoint(label.frame, sender.locationInView(BackgroundView)) {
                if (label.canTap) {
                }
            }
        }
    }
}
