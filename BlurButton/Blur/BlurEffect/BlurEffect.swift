//
//  BlurEffect.swift
//  BlurButton
//
//  Created by Breno Pinheiro Aquino on 16/10/17.
//  Copyright © 2017 Breno Pinheiro Aquino. All rights reserved.
//

import ARKit

class BlurEffect {
    
    var blurEffectView: UIVisualEffectView!
    
    var color: UIColor!
    
    var alphaBlur: Double!
    
    var alphaColor: Double!
    
    var isOn: Bool!
    
    init(effect: UIBlurEffectStyle, color: UIColor = .black, alphaBlur: Double = 1, alphaColor: Double = 0.3) {
        
        self.isOn = false
        
        self.color = color
        
        self.alphaBlur = 1
        
        self.alphaColor = 0.3
        
        self.blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        
        self.blurEffectView.autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin]
    }
    
    init(effect: UIBlurEffectStyle, viewToPresent: UIView, sendToBack: Bool = true, color: UIColor = .black, alphaBlur: Double = 1, alphaColor: Double = 0.3) {
        
        self.isOn = true
        
        self.color = color
        
        self.alphaBlur = 1
        
        self.alphaColor = 0.3
        
        self.blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        
        self.blurEffectView.autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin]
        
        self.blurEffectView.frame = viewToPresent.bounds
        
        viewToPresent.addSubview(self.blurEffectView)
        
        if sendToBack {
            
            viewToPresent.sendSubview(toBack: self.blurEffectView)
        }
    }
    
    // MARK: - Show
    
    func showWithAnimation(duration: Double, viewToPresent: UIView, sendToBack: Bool = true, animations: (() -> ())? = nil, completion: (() -> ())? = nil) {
        
        self.isOn = true
        
        self.blurEffectView.frame = viewToPresent.bounds
        
        viewToPresent.addSubview(self.blurEffectView)
        
        if sendToBack {
            
            viewToPresent.sendSubview(toBack: self.blurEffectView)
        }
        
        self.blurEffectView.alpha = 0
        
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            
            if let animations = animations {
                
                animations()
            }
            
            viewToPresent.backgroundColor = self.color.withAlphaComponent(CGFloat(self.alphaColor))
            
            self.blurEffectView.alpha = CGFloat(self.alphaBlur)
            
        }) { (Bool) in
            
            if let completion = completion {
                
                completion()
            }
        }
    }
    
    func showWithAnimation(alphaBlur: Double, alphaColor: Double, duration: Double, viewToPresent: UIView, sendToBack: Bool = true, animations: (() -> ())? = nil, completion: (() -> ())? = nil) {
        
        self.isOn = true
        
        self.blurEffectView.frame = viewToPresent.bounds
        
        viewToPresent.addSubview(self.blurEffectView)
        
        if sendToBack {
            
            viewToPresent.sendSubview(toBack: self.blurEffectView)
        }
        
        self.blurEffectView.alpha = 0
        
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            
            if let animations = animations {
                
                animations()
            }
            
            self.alphaBlur = alphaBlur
            
            self.alphaColor = alphaColor
            
            viewToPresent.backgroundColor = self.color.withAlphaComponent(CGFloat(self.alphaColor))
            
            self.blurEffectView.alpha = CGFloat(self.alphaBlur)
            
        }) { (Bool) in
            
            if let completion = completion {
                
                completion()
            }
        }
    }
    
    func show(viewToPresent: UIView, sendToBack: Bool = true) {
        
        self.isOn = true
        
        self.blurEffectView.frame = viewToPresent.bounds
        
        viewToPresent.addSubview(self.blurEffectView)
        
        if sendToBack {
            
            viewToPresent.sendSubview(toBack: self.blurEffectView)
        }
            
        viewToPresent.backgroundColor = self.color.withAlphaComponent(CGFloat(self.alphaColor))
        
        self.blurEffectView.alpha = CGFloat(self.alphaBlur)
    }
    
    func show(alphaBlur: Double, alphaColor: Double, viewToPresent: UIView, sendToBack: Bool = true) {
        
        self.isOn = true
        
        self.blurEffectView.frame = viewToPresent.bounds
        
        viewToPresent.addSubview(self.blurEffectView)
        
        if sendToBack {
            
            viewToPresent.sendSubview(toBack: self.blurEffectView)
        }
            
        self.alphaBlur = alphaBlur
        
        self.alphaColor = alphaColor
            
        viewToPresent.backgroundColor = self.color.withAlphaComponent(CGFloat(self.alphaColor))
        
        self.blurEffectView.alpha = CGFloat(self.alphaBlur)
    }

    // MARK: - Dismiss
    
    func dismiss(duration: Float, animations: (() -> ())? = nil, completion: (() -> ())? = nil) {
        
        self.isOn = false
        
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            
            if let animations = animations {
                
                animations()
            }
            
            self.blurEffectView.alpha = 0
        }) { (Bool) in
            
            if let completion = completion {
                
                completion()
            }
        }
    }
    
    func dismiss() {
        
        self.isOn = false
        
        self.blurEffectView.alpha = 0
    }
}
