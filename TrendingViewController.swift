//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by Ida Leung on 10/9/14.
//  Copyright (c) 2014 test. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var trendingFeed: UIImageView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        scrollView.contentSize =
            trendingFeed.frame.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
