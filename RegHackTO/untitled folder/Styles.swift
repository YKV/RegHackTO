//
//  Styles.swift
//  RegHackTO
//
//  Created by Yevhen Kim on 2016-11-26.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation
import UIKit

class Styles {
    static let sharedInstance = Styles()
    
    let textColor:UIColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
    let backgroundColor:UIColor = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
    let whiteColor:UIColor = UIColor.white
    let blackColor: UIColor = UIColor.black
    let lightgrayColor: UIColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    let transparentWhite:UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
    
    let fontLarge:UIFont = UIFont.systemFont(ofSize: 24, weight: 0.5)
    let fontMedium:UIFont = UIFont.systemFont(ofSize: 18, weight: 0.5)
    let fontSmall:UIFont = UIFont.systemFont(ofSize: 14, weight: 0.5)
    let sizeLarge:CGFloat = 24
    let sizeMedium:CGFloat = 18
    let sizeSmall:CGFloat = 14
    
    let buttonCornerRadius:CGFloat = 10
    
    let highlightColor:UIColor = UIColor(red: 84/255, green: 135/255, blue: 255/255, alpha: 0.5)
    
    let invisbleColor:UIColor = UIColor.clear
    let greenColor:UIColor = UIColor(red: 89/255, green: 152/255, blue: 59/255, alpha: 1.0)
    
    let titleFont: UIFont = UIFont(name: "Avenir", size: CGFloat(18.0))!
}
