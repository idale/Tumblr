//
//  TabViewController.swift
//  Tumblr
//
//  Created by Ida Leung on 10/9/14.
//  Copyright (c) 2014 test. All rights reserved.
//

import UIKit

class TabViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var contentView: UIView!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    @IBOutlet weak var onCompose: UIButton!
    @IBOutlet weak var onAccount: UIButton!
    @IBOutlet weak var onHome: UIButton!
    @IBOutlet weak var onTrending: UIButton!
    @IBOutlet weak var onSearch: UIButton!
    
    var pressedButton: UIButton!
    @IBOutlet weak var popBubble: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard (name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        contentView.addSubview(homeViewController.view)
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.popBubble.transform = CGAffineTransformMakeTranslation(0, 5)
        }, completion: nil)
 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = destinationVC as ComposeViewController
        
    }
    
    
    @IBAction func onPressedTabButton(sender: AnyObject) {
        
        pressedButton = sender as UIButton
        popBubble.hidden = false
        
        
        if pressedButton == onHome {
            homeViewController.view.frame = contentView.frame
            contentView.addSubview(homeViewController.view)
            
        } else if pressedButton == onSearch {
            
            searchViewController.view.frame = contentView.frame
            contentView.addSubview(searchViewController.view)
            popBubble.hidden = true
        
        } else if pressedButton == onAccount {
            accountViewController.view.frame = contentView.frame
            contentView.addSubview(accountViewController.view)
        
        } else if pressedButton == onTrending {
            trendingViewController.view.frame = contentView.frame
            contentView.addSubview(trendingViewController.view)
        
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
