//
//  BlurButton.swift
//  BlurButton
//
//  Created by Breno Pinheiro Aquino on 16/10/17.
//  Copyright © 2017 Breno Pinheiro Aquino. All rights reserved.
//

import UIKit

class BlurButton: UIButton {
    
    var backgroundBlur: BlurView!
    
    var isON: Bool = false
    
    var colorON: UIColor!
    var alphaON: Double = 0.8
    
    var colorOFF: UIColor!
    var alphaOFF: Double = 0.3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundBlur = BlurView(frame: self.bounds)
        
        self.addSubview(self.backgroundBlur)
        
        self.sendSubview(toBack: self.backgroundBlur)
        
        self.alphaON = 0.8
        
        self.alphaOFF = 0.3
        
        self.colorON = UIColor.white.withAlphaComponent(CGFloat(self.alphaON))
        
        self.colorOFF = UIColor.white.withAlphaComponent(CGFloat(self.alphaOFF))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        self.isON = !self.isON
        
        if self.isON {
            
            self.backgroundBlur.changeColorWithAnimation(color: self.colorON, alphaColor: self.alphaON, duration: 0.5)
            
        } else {
            
            self.backgroundBlur.changeColorWithAnimation(color: self.colorOFF, alphaColor: self.alphaOFF, duration: 0.5)
        }
    }

}
