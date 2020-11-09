//
//  StartResetButtons.swift
//  iphoneClock
//
//  Created by Алексей Злотник on 09.11.2020.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        
        layer.cornerRadius = 50
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
//        layer.borderWidth = 3
//        layer.borderColor = UIColor.red.cgColor
//        layer.borderColor = backgroundColor?.cgColor
        
//        // adding border with gap (using subview)
//        let borderWithGap = CGRect(x: -5, y: -5, width: 110, height: 110)
//        let borderWithGapView : UIView = UIView(frame: borderWithGap)
//        borderWithGapView.backgroundColor = .clear
//        borderWithGapView.layer.borderWidth = 3
//        borderWithGapView.layer.cornerRadius = borderWithGap.size.width / 2
//        self.addSubview(borderWithGapView)
        
        
    }

}
