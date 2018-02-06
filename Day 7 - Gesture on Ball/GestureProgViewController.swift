//
//  GestureProgViewController.swift
//  Day 7 - Gesture on Ball
//
//  Created by Prashant Gaikwad on 1/8/18.
//  Copyright © 2018 Prashant Gaikwad. All rights reserved.
//

import UIKit

class GestureProgViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    var currentRadius:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: Selector(("rotateBall:")))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotateBall(sender: UIScreenEdgePanGestureRecognizer) {
        // 1
        if sender.state == .ended {
            // 2
            if self.currentRadius==360.0 {
                self.currentRadius=0.0
            }
            
            UIView.animate(withDuration: 1.0, animations: {
                self.currentRadius += 90.0
                self.imageView.transform = CGAffineTransform(rotationAngle: (self.currentRadius * CGFloat(M_PI)) / 180.0)
            })
        }
        
    }
        
}
