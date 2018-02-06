//
//  ViewController.swift
//  Day 7 - Gesture on Ball
//
//  Created by Prashant Gaikwad on 1/8/18.
//  Copyright © 2018 Prashant Gaikwad. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIGestureRecognizerDelegate{

    @IBOutlet weak var ballImageView: UIImageView!
    
    fileprivate func setBackColor() {
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(named: "newColor")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   @IBAction func handlePan(recogniser:UIPanGestureRecognizer)  {
        
        let translation = recogniser.translation(in: self.view)
        if let view = recogniser.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recogniser.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    

}

