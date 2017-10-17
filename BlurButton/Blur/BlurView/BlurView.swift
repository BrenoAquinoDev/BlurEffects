//
//  BlurView.swift
//  BlurButton
//
//  Created by Breno Pinheiro Aquino on 16/10/17.
//  Copyright © 2017 Breno Pinheiro Aquino. All rights reserved.
//

import UIKit

class BlurView: UIView {

    var blurEffect: BlurEffect = BlurEffect(effect: .dark, color: .black, alphaBlur: 0.95, alphaColor: 0.2)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.blurEffect.show(viewToPresent: self)
    }
    
    func changeColorWithAnimation(color: UIColor, alphaColor: Double, duration: Double) {
        
        self.blurEffect.color = color
        
        self.blurEffect.alphaColor = alphaColor
        
        self.blurEffect.showWithAnimation(duration: duration, viewToPresent: self)
    }
}
