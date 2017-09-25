//
//  RoomView.swift
//  LibraryReserveRoom
//
//  Created by LALIT JAGTAP on 9/6/17.
//  Copyright © 2017 LALIT JAGTAP. All rights reserved.
//

import UIKit

class RoomView: UIView {

    // this one needs to similar to RatingControl ...only components are layed uniquly and different sizes
    // similar to rating it can have method
    // roomButtonTapped ...need to add this target button to all room buttons
    // 
    
    // layout of all 9 rooms (a to i)
    // layout of labels to show capacity, board and display 
    // roomSelected(name)   - set selcted button
    // roomAvailable(name)  - set room color in GREEN
    // roomBooked(name)     - set room color in RED
    // roomHasCapacity(name)    - person per room
    // roomHasChair(name)       -
    // roomHasWhiteboard(name)  -
}

/*
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
*/
