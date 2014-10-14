//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Ida Leung on 10/9/14.
//  Copyright (c) 2014 test. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var buttonPhoto: UIButton!
    @IBOutlet weak var buttonQuote: UIButton!
    @IBOutlet weak var buttonLink: UIButton!
    @IBOutlet weak var buttonChat: UIButton!
    @IBOutlet weak var buttonVideo: UIButton!
    
    var isPresenting: Bool = true

    
    func originButtonLocation() {
        buttonText.frame.origin.y = 800
        buttonPhoto.frame.origin.y = 700
        buttonQuote.frame.origin.y = 900
        buttonLink.frame.origin.y = 1000
        buttonChat.frame.origin.y = 1200
        buttonVideo.frame.origin.y = 1100
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originButtonLocation()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTapDismiss(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                println("it does something")
                
                toViewController.view.alpha = 1
                
                self.buttonText.frame.origin.y = 136
                self.buttonPhoto.frame.origin.y = 136
                self.buttonQuote.frame.origin.y = 136
                self.buttonLink.frame.origin.y = 262
                self.buttonChat.frame.origin.y = 262
                self.buttonVideo.frame.origin.y = 262
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
            
            
            
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                
                self.buttonText.frame.origin.y = -1000
                self.buttonPhoto.frame.origin.y = -1000
                self.buttonQuote.frame.origin.y = -1000
                self.buttonLink.frame.origin.y = -1000
                self.buttonChat.frame.origin.y = -1000
                self.buttonVideo.frame.origin.y = -1000
                
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
