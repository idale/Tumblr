//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Ida Leung on 10/9/14.
//  Copyright (c) 2014 test. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var searchResults: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResults.alpha = 0
        var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
        loadingImage.image = images
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(2) {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.loadingImage.hidden = true
                self.searchResults.alpha = 1
            })
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
