//
//  HomeVC.swift
//  FrameVsBounds
//
//  Created by Jing Wang on 8/29/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var BGImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Bounds/Frame 1 >> \(imageView.bounds)/\(imageView.frame)")

//        imageView.bounds.size = CGSize(width: 400, height: 400)
//        imageView.frame.origin = CGPoint(x: 57, y: 115)
        
        // It seems that it will not affect the imageView at all, as long as the bounds.size does not change
        imageView.bounds.origin = CGPoint(x: 300, y: 300)
        
        containerView.bounds.origin = CGPoint(x: 250, y: 250)
        containerView.bounds.size = CGSize(width: 200, height: 200)
//        containerView.frame.origin = CGPoint(x: 57, y: 92)
        containerView.frame.size = CGSize(width: 300, height: 300)
        print("Bounds/Frame 2 >> \(imageView.bounds)/\(imageView.frame)")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
