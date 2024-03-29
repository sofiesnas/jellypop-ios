//
//  Bubble.swift
//  JellyPop
//
//  Created by Syafa Sofiena on 28/4/2023.
//

import UIKit

class Bubble: UIButton {
    // class for Bubble as a button

    let userDefaults = UserDefaults.standard
    var imageName: String?
    var frameWidth: Int
    var frameHeight: Int
    var xPosition: Int
    var yPosition: Int
    
    override init(frame: CGRect) {
        // Get frame size for bubble positioning
        frameWidth = userDefaults.value(forKey: "frameWidth") as! Int
        frameHeight = userDefaults.value(forKey: "frameHeight") as! Int
        xPosition = Int.random(in: 65...self.frameWidth-65)
        yPosition = Int.random(in: 65...self.frameHeight-65)
        super.init(frame: frame)
        self.frame = CGRect(x: xPosition, y: yPosition, width: 50, height: 50)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(imageName: String) {
        // Set image for bubble
        let bubbleImage = UIImage(named: imageName)
        self.setBackgroundImage(bubbleImage, for: .normal)
        // Update imageName property
        self.imageName = imageName
    }
    
    func animation() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.duration = 0.6
        springAnimation.fromValue = 1
        springAnimation.toValue = 0.8
        springAnimation.repeatCount = 1
        springAnimation.initialVelocity = 0.5
        springAnimation.damping = 1
        layer.add(springAnimation, forKey: nil)
    }
}

