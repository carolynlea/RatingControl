//
//  ViewController.swift
//  RatingControl
//
//  Created by Carolyn Lea on 8/28/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBAction func updateRating(_ sender: CustomControl)
    {
        let N:Int = sender.starValue
        
        if N == 1
        {
           title = "User Rating: \(N) star"
        }
        else
        {
           title = "User Rating: \(N) stars"
        }
        
        if sender.starValue == 1
        {
            view.backgroundColor = UIColor(red: 254.0/255.0, green: 254.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        }
        else if sender.starValue == 2
        {
            view.backgroundColor = UIColor(red: 253.0/255.0, green: 254.0/255.0, blue: 159.0/255.0, alpha: 1.0)
        }
        else if sender.starValue == 3
        {
            view.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        }
        else if sender.starValue == 4
        {
            view.backgroundColor = UIColor(red: 255.0/255.0, green: 238.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
        else if sender.starValue == 5
        {
            view.backgroundColor = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
        
        
    }
    


}

