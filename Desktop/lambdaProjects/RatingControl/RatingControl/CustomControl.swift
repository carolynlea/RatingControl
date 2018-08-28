//
//  CustomControl.swift
//  RatingControl
//
//  Created by Carolyn Lea on 8/28/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class CustomControl: UIControl
{
    var starValue: Int = 1
    
    private let componentDimension:CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    var labelArray: [UILabel] = []
    var label1 = UILabel()
    var label2 = UILabel()
    var label3 = UILabel()
    var label4 = UILabel()
    var label5 = UILabel()
    
    required init?(coder aCoder: NSCoder)
    {
        super.init(coder: aCoder)
        setUp()
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        addSubview(label1)
        addSubview(label2)
        addSubview(label3)
        addSubview(label4)
        addSubview(label5)
    }
    
    func setUp()
    {
        
        label1 = UILabel(frame: CGRect(x: 8, y: 0, width: componentDimension, height: componentDimension))
        label1.tag = 1
        label1.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label1.text = "★"
        label1.textColor = componentActiveColor
        label1.textAlignment = NSTextAlignment.center
        
        label2 = UILabel(frame: CGRect(x: componentDimension + 16.0, y: 0, width: componentDimension, height: componentDimension))
        label2.tag = 2
        label2.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label2.text = "★"
        label2.textColor = componentInactiveColor
        label2.textAlignment = NSTextAlignment.center
        
        label3 = UILabel(frame: CGRect(x: componentDimension + 64.0, y: 0, width: componentDimension, height: componentDimension))
        label3.tag = 3
        label3.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label3.text = "★"
        label3.textColor = componentInactiveColor
        label3.textAlignment = NSTextAlignment.center
        
        label4 = UILabel(frame: CGRect(x: componentDimension + 112.0, y: 0, width: componentDimension, height: componentDimension))
        label4.tag = 4
        label4.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label4.text = "★"
        label4.textColor = componentInactiveColor
        label4.textAlignment = NSTextAlignment.center
        
        label5 = UILabel(frame: CGRect(x: componentDimension + 160.0, y: 0, width: componentDimension, height: componentDimension))
        label5.tag = 5
        label5.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label5.text = "★"
        label5.textColor = componentInactiveColor
        label5.textAlignment = NSTextAlignment.center
        
        labelArray = [label1, label2, label3, label4, label5]
        
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
    {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool
    {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint)
        {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        }
        else
        {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?)
    {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint)
        {
            sendActions(for: [.touchUpInside, .valueChanged])
            performFlare()
        }
        else
        {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?)
    {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch)
    {
        for label in labelArray
        {
            let touchPoint = touch.location(in: label)
            if bounds.contains(touchPoint)
            {
                starValue = label.tag
                label.textColor = componentActiveColor
                sendActions(for: [.valueChanged])
            }
            else
            {
                label.textColor = componentInactiveColor
                sendActions(for: [.valueChanged])
            }
        }
    }
    
    
    
    
    
//@end
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare()
    {
        func flare()
        {
            transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            //transform = CGAffineTransform(rotationAngle: CGFloat(45 * Double.pi / 180))
        }
        
        func unflare()
        {
            transform = .identity
        }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
    
}
