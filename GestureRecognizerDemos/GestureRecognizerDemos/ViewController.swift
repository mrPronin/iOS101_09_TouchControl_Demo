//
//  ViewController.swift
//  GestureRecognizerDemos
//
//  Created by Brian on 9/1/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var gestureView: UIImageView!
    
    //MARK: - Vars
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gestureView.userInteractionEnabled = true
        gestureView.tag = 111
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("tapView:"))
        tapGesture.numberOfTapsRequired = 3
        
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("moveView:"))
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: Selector("rotateView:"))
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: Selector("pinchView:"))
        
        gestureView.gestureRecognizers = [tapGesture, panGesture, rotateGesture, pinchGesture]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    func tapView(gesture: UITapGestureRecognizer) {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        gesture.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func moveView(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
//        print("translation \(translation)")
        recognizer.view?.center = CGPoint(x: self.view.center.x + translation.x, y: self.view.center.y + translation.y)
    }
    
    func rotateView(recognizer: UIRotationGestureRecognizer) {
        recognizer.view?.transform = CGAffineTransformRotate((recognizer.view?.transform)!, recognizer.rotation)
        recognizer.rotation = 0
    }
    
    func pinchView(recognizer: UIPinchGestureRecognizer) {
        recognizer.view?.transform = CGAffineTransformScale((recognizer.view?.transform)!, recognizer.scale, recognizer.scale)
        recognizer.scale = 1
    }
}

