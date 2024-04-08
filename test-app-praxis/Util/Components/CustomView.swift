//
//  CustomView.swift
//  Yummy Rides
//
//  Created by pedro.daza on 12/11/21.
//  Copyright © 2021 Elluminati. All rights reserved.
//

import Foundation
import UIKit

// MARK: - @IBInspectable variables
@IBDesignable class CustomView: UIView {

    @IBInspectable var cornerRadiusCustom: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
    @IBInspectable var topLeft: Bool {
        get { return self.layer.maskedCorners.contains(.layerMinXMinYCorner) }
        set { addCornerMask(newValue, cornerMask: .layerMinXMinYCorner) }
    }

    @IBInspectable var topRight: Bool {
        get { return self.layer.maskedCorners.contains(.layerMaxXMinYCorner) }
        set { addCornerMask(newValue, cornerMask: .layerMaxXMinYCorner) }
    }

    @IBInspectable var bottomLeft: Bool {
        get { return self.layer.maskedCorners.contains(.layerMinXMaxYCorner) }
        set { addCornerMask(newValue, cornerMask: .layerMinXMaxYCorner) }
    }

    @IBInspectable var bottomRight: Bool {
        get { return self.layer.maskedCorners.contains(.layerMaxXMaxYCorner) }
        set { addCornerMask(newValue, cornerMask: .layerMaxXMaxYCorner) }
    }
    
    @IBInspectable var borderWidthCustom: CGFloat {
        get { return self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColorCustom: UIColor? {
        get { return self.layer.borderColor != nil ? UIColor(cgColor: self.layer.borderColor!) : nil }
        set { self.layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var shadowOffsetCustom: CGSize {
        get { return self.layer.shadowOffset }
        set { self.layer.shadowOffset = newValue }
    }
    
    @IBInspectable var shadowColorCustom: UIColor? {
        get { return self.layer.shadowColor != nil ? UIColor(cgColor: self.layer.shadowColor!) : nil }
        set { self.layer.shadowColor = newValue?.cgColor }
    }
    
    @IBInspectable var shadowOpacityCustom: Float {
        get { return self.layer.shadowOpacity }
        set { self.layer.shadowOpacity = newValue }
    }
    
    @IBInspectable var shadowRadiusCustom: CGFloat {
        get { return self.layer.shadowRadius }
        set { self.layer.shadowRadius = newValue }
    }
}

// MARK: - Setup
extension CustomView {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func addCornerMask(_ add: Bool, cornerMask: CACornerMask) {
        if add {
            self.layer.maskedCorners.insert(cornerMask)
        }
        else {
            self.layer.maskedCorners.remove(cornerMask)
        }
    }
}
