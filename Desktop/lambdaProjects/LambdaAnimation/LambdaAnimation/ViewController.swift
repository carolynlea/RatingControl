//
//  ViewController.swift
//  LambdaAnimation
//
//  Created by Carolyn Lea on 8/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var shouldScramble: Bool = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //logoImageView.alpha = 0.1
        //fadeIn()
        self.lLabel.alpha = 0.0
        self.aLabel.alpha = 0.0
        self.mLabel.alpha = 0.0
        self.bLabel.alpha = 0.0
        self.dLabel.alpha = 0.0
        self.a2Label.alpha = 0.0
    }
    
    func gather()
    {
        UIView.animate(withDuration: 0.5) {
            
            self.logoImageView.frame = CGRect(x: 34, y: 150, width: 256, height: 116)
            self.logoImageView.alpha = 1.0
            self.lLabel.frame = CGRect(x: 34, y: 129, width: 10, height: 21)
            self.aLabel.frame = CGRect(x: 48, y: 129, width: 12, height: 21)
            self.mLabel.frame = CGRect(x: 63, y: 129, width: 15, height: 21)
            self.bLabel.frame = CGRect(x: 81, y: 129, width: 11, height: 21)
            self.dLabel.frame = CGRect(x: 96, y: 129, width: 12, height: 21)
            self.a2Label.frame = CGRect(x: 112, y: 129, width: 12, height: 21)
            self.lLabel.alpha = 0.0
            self.aLabel.alpha = 0.0
            self.mLabel.alpha = 0.0
            self.bLabel.alpha = 0.0
            self.dLabel.alpha = 0.0
            self.a2Label.alpha = 0.0
            
        }
        
    }
    
    @IBAction func toggle(_ sender: Any)
    {
        if shouldScramble
        {
            fadeOut()
            stretch()
            spring()
            //tryThis()
            shouldScramble = false
        }
        else
        {
            gather()
            shouldScramble = true
        }
        
        
    }
    
    func fadeIn(withDuration duration: TimeInterval = 1.0)
    {
        UIView.animate(withDuration: duration) {
            self.logoImageView.alpha = 1.0
        }
    }
    
    func fadeOut()
    {
        UIView.animate(withDuration: 0.4) {
            //self.logoImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4.0)
            self.spin()
            self.logoImageView.alpha = 0.0
            
        }
    }
    
    func spin()
    {
        UIView.animate(withDuration: 0.5) { () -> Void in
            self.logoImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.45, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            self.logoImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
        }, completion: nil)
    }
    
    func stretch()
    {
        UIView.animate(withDuration: 2.0)
        {
            
            self.lLabel.frame.size.width += 60
            self.lLabel.frame.size.height += 100
            self.lLabel.font = UIFont.systemFont(ofSize: 113, weight: .regular)
            
            self.aLabel.font = UIFont.systemFont(ofSize: 113, weight: .regular)
            self.aLabel.frame.size.width += 60
            self.aLabel.frame.size.height += 100
            
            self.mLabel.font = UIFont.systemFont(ofSize: 113, weight: .regular)
            self.mLabel.frame.size.width += 60
            self.mLabel.frame.size.height += 100
            
            self.bLabel.font = UIFont.systemFont(ofSize: 113, weight: .regular)
            self.bLabel.frame.size.width += 60
            self.bLabel.frame.size.height += 100
            
            self.dLabel.font = UIFont.systemFont(ofSize: 113, weight: .regular)
            self.dLabel.frame.size.width += 60
            self.dLabel.frame.size.height += 100
            
            self.a2Label.font = UIFont.systemFont(ofSize: 113, weight: .regular)
            self.a2Label.frame.size.width += 60
            self.a2Label.frame.size.height += 100
            
        }
    }
    
    func growAndMove()
    {
        UIView.animate(withDuration: 1.6) {
            
            self.lLabel.alpha = 1.0
            self.aLabel.alpha = 1.0
            self.mLabel.alpha = 1.0
            self.bLabel.alpha = 1.0
            self.dLabel.alpha = 1.0
            self.a2Label.alpha = 1.0
            
            let textAlign = NSTextAlignment.center
            let viewWidth = self.view.bounds.width
            let viewHeight = self.view.bounds.height
            let labelFont = UIFont.systemFont(ofSize: 52, weight: .bold)
            
            let lLabelWidth = self.lLabel.frame.size.width
            let lLabelHeight = self.lLabel.frame.size.height
            let xWidth = viewWidth - lLabelWidth
            let yHeight = viewHeight - lLabelHeight
            let xOffset = CGFloat(arc4random_uniform(UInt32(xWidth)))
            let yOffset = CGFloat(arc4random_uniform(UInt32(yHeight)))
            self.lLabel.center.x = xOffset + lLabelWidth / 2
            self.lLabel.center.y = yOffset + lLabelHeight / 2
            self.lLabel.font = labelFont
            self.lLabel.textAlignment = textAlign
            self.lLabel.textColor = self.getRandomColor()
            self.lLabel.backgroundColor = self.getRandomColor()
            self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random()))
            
            let aLabelWidth = self.aLabel.frame.size.width
            let aLabelHeight = self.aLabel.frame.size.height
            let axWidth = viewWidth - aLabelWidth
            let ayHeight = viewHeight - aLabelHeight
            let axOffset = CGFloat(arc4random_uniform(UInt32(axWidth)))
            let ayOffset = CGFloat(arc4random_uniform(UInt32(ayHeight)))
            self.aLabel.center.x = axOffset + lLabelWidth / 2
            self.aLabel.center.y = ayOffset + lLabelHeight / 2
            self.aLabel.font = labelFont
            self.aLabel.textAlignment = textAlign
            self.aLabel.textColor = self.getRandomColor()
            self.aLabel.backgroundColor = self.getRandomColor()
            self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random()))
            
            let mLabelWidth = self.mLabel.frame.size.width
            let mLabelHeight = self.mLabel.frame.size.height
            let mxWidth = viewWidth - mLabelWidth
            let myHeight = viewHeight - mLabelHeight
            let mxOffset = CGFloat(arc4random_uniform(UInt32(mxWidth)))
            let myOffset = CGFloat(arc4random_uniform(UInt32(myHeight)))
            self.mLabel.center.x = mxOffset + lLabelWidth / 2
            self.mLabel.center.y = myOffset + lLabelHeight / 2
            self.mLabel.font = labelFont
            self.mLabel.textAlignment = textAlign
            self.mLabel.textColor = self.getRandomColor()
            self.mLabel.backgroundColor = self.getRandomColor()
            self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random()))
            
            let bLabelWidth = self.bLabel.frame.size.width
            let bLabelHeight = self.bLabel.frame.size.height
            let bxWidth = viewWidth - bLabelWidth
            let byHeight = viewHeight - bLabelHeight
            let bxOffset = CGFloat(arc4random_uniform(UInt32(bxWidth)))
            let byOffset = CGFloat(arc4random_uniform(UInt32(byHeight)))
            self.bLabel.center.x = bxOffset + lLabelWidth / 2
            self.bLabel.center.y = byOffset + lLabelHeight / 2
            self.bLabel.font = labelFont
            self.bLabel.textAlignment = textAlign
            self.bLabel.textColor = self.getRandomColor()
            self.bLabel.backgroundColor = self.getRandomColor()
            self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random()))
            
            let dLabelWidth = self.dLabel.frame.size.width
            let dLabelHeight = self.dLabel.frame.size.height
            let dxWidth = viewWidth - dLabelWidth
            let dyHeight = viewHeight - dLabelHeight
            let dxOffset = CGFloat(arc4random_uniform(UInt32(dxWidth)))
            let dyOffset = CGFloat(arc4random_uniform(UInt32(dyHeight)))
            self.dLabel.center.x = dxOffset + lLabelWidth / 2
            self.dLabel.center.y = dyOffset + lLabelHeight / 2
            self.dLabel.font = labelFont
            self.dLabel.textAlignment = textAlign
            self.dLabel.textColor = self.getRandomColor()
            self.dLabel.backgroundColor = self.getRandomColor()
            self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random()))
            
            let a2LabelWidth = self.a2Label.frame.size.width
            let a2LabelHeight = self.a2Label.frame.size.height
            let a2xWidth = viewWidth - a2LabelWidth
            let a2yHeight = viewHeight - a2LabelHeight
            let a2xOffset = CGFloat(arc4random_uniform(UInt32(a2xWidth)))
            let a2yOffset = CGFloat(arc4random_uniform(UInt32(a2yHeight)))
            self.a2Label.center.x = a2xOffset + lLabelWidth / 2
            self.a2Label.center.y = a2yOffset + lLabelHeight / 2
            self.a2Label.font = labelFont
            self.a2Label.textAlignment = textAlign
            self.a2Label.textColor = self.getRandomColor()
            self.a2Label.backgroundColor = self.getRandomColor()
            self.a2Label.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random()))
            
        }
    }
    
    func spring()
    {
        UIView.animate(withDuration: 1.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            self.growAndMove()
            
            
        }, completion: nil)
    }


    func getRandomColor() -> UIColor
    {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func tryThis()
    {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [.calculationModeCubic], animations: {
            // Add animations
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4/4.0, animations: {
                
                self.fadeOut()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4/4.0, relativeDuration: 2.0/4.0, animations: {
                
                self.stretch()
            })
            UIView.addKeyframe(withRelativeStartTime: 2.4/4.0, relativeDuration: 1.6/4.0, animations: {
                
                self.spring()
            })
            
        }, completion:{ _ in
            print("I'm done!")
        })
    }
    
    
    //@end
}

