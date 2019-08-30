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
        
        print("Bounds/Frame/Center 1 >> \(imageView.bounds)/\(imageView.frame)/\(imageView.center)")
        
        // It seems that it will not affect the imageView at all, as long as the bounds.size does not change
        imageView.bounds.origin = CGPoint(x: 300, y: 300)
        // frame.size will also change to (200, 200) after the following line, where its center will not move
        imageView.bounds.size = CGSize(width: 200, height: 200)
        // You can move the object's superview to its origin and center will update at the same time
        imageView.frame.origin = CGPoint(x: 57, y: 92)
        //        // 1.You can scale it back to its original size by changing bounds.size, where its center will not change
        //        imageView.bounds.size = CGSize(width: 300, height: 300)
        
        // 2.You can scale it back to its original size by changing frame.size, where its orign will not change
        imageView.frame.size = CGSize(width: 300, height: 300)
        // Also, when you change bounds, frame will automatically update to the same size,
        // TODO: Guess this will be different for transformed view object ???
        
        // Then reset its frame.origin
        imageView.frame.origin = CGPoint(x: 57, y: 92)
        
        //        // Again change bounds.size, where center will not move
        //        imageView.bounds.size = CGSize(width: 400, height: 400)
        
        print("Bounds/Frame/Center 2 >> \(imageView.bounds)/\(imageView.frame)/\(imageView.center)")
        print("")
        
        
        
        print("Bounds/Frame/Center 3 >> \(containerView.bounds)/\(containerView.frame)/\(containerView.center)")
        
        containerView.bounds.origin = CGPoint(x: 250, y: 250)
        // 1. Center will not move when you change bounds.size
        containerView.bounds.size = CGSize(width: 200, height: 200)
        // Then you need to reset its origin
        containerView.frame.origin = CGPoint(x: 57, y: 471)
        // Then you can scale it back
        containerView.bounds.size = CGSize(width: 300, height: 300)
        // Then you need to reset its origin
        containerView.frame.origin = CGPoint(x: 57, y: 471)
        
        //        // 2. Origin will not move when you change frame.size
        //        containerView.frame.size = CGSize(width: 200, height: 200)
        //        // Then you can scale it back
        //        containerView.frame.size = CGSize(width: 300, height: 300)
        
        print("Bounds/Frame/Center 4 >> \(containerView.bounds)/\(containerView.frame)/\(containerView.center)")
        
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
