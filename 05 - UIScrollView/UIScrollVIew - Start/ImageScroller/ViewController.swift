/// Copyright (c) 2018 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    
    //    // Way #1 of setting contentSize for UIScrollView
    //        scrollView.contentSize = imageView.image?.size ?? UIScreen.main.bounds.size
    
    scrollView.delegate = self
    
    // Way #2 of setting contentSize for UIScrollView
    imageView.frame.size = imageView.image?.size ?? imageView.frame.size
    
    // You must set scrollView.zoomScale when you use func "viewForZooming()", otherwise you cannot drag and browse the image
    //    scrollView.zoomScale = 1
    
    //    setZoomPara()
    //    //    setZoomParameters(scrollView.bounds.size)
    //
    //    centerImage()
    scrollView.minimumZoomScale = 0.05
    scrollView.maximumZoomScale = 3.0
    scrollView.zoomScale = 1
    
  }
  
  
  override func viewWillLayoutSubviews() {
    //    print("Will layout subview")
    //    print("Rotation ended")
    //    print("imageView.bounds >> \(imageView.bounds)")
    //    print("scrollView.bounds.size >> \(scrollView.bounds)")
    //    print ("scrollView.contentSize >> \(scrollView.contentSize)")
    
//    setZoomPara()s
    //    setZoomParameters(scrollView.bounds.size)
    centerImage()
    
  }
  
  func setZoomPara() {
    let xScaleFactor = scrollView.bounds.width/imageView.bounds.width
    let yScaleFactor = scrollView.bounds.height/imageView.bounds.height
    
    //    // The same as the above two lines
    //    let xScaleFactor = scrollView.bounds.size.width/imageView.bounds.size.width
    //    let yScaleFactor = scrollView.bounds.size.height/imageView.bounds.size.height
    
    
    //    print("Before >> imageView.bounds >> \(imageView.bounds)")
    //    print("Before >> scrollView.bounds.size >> \(scrollView.bounds)")
    //    print ("Before >> scrollView.contentSize >> \(scrollView.contentSize)")
    
    let minScaleFactor = min(xScaleFactor, yScaleFactor)
    
    scrollView.minimumZoomScale = minScaleFactor
    scrollView.maximumZoomScale = 3
    scrollView.zoomScale = minScaleFactor
    
    
    //    print("After >> imageView.bounds >> \(imageView.bounds)")
    //    print("After >> scrollView.bounds >> \(scrollView.bounds)")
    //    print ("After >> scrollView.contentSize >> \(scrollView.contentSize)")
  }
  
  
  // Original function from CJC (CattieJesseC)
  func setZoomParameters(_ scrollViewSize: CGSize) {
    let imageSize = imageView.bounds.size
    let widthScale = scrollViewSize.width / imageSize.width
    let heightScale = scrollViewSize.height / imageSize.height
    let minScale = min(widthScale, heightScale)
    
    scrollView.minimumZoomScale = minScale
    scrollView.maximumZoomScale = 3.0
    scrollView.zoomScale = minScale
  }
  
  func centerImage() {

    let yPadding: CGFloat = scrollView.bounds.height > scrollView.contentSize.height ? (scrollView.bounds.height - scrollView.contentSize.height)/2 : 0
    let xPadding: CGFloat = scrollView.bounds.width > scrollView.contentSize.width ? (scrollView.bounds.width - scrollView.contentSize.width)/2 : 0
    
    if xPadding > 0 || yPadding > 0 {
      
      scrollView.contentInset = UIEdgeInsets(top: yPadding, left: xPadding, bottom: yPadding, right: xPadding)
      print("scrollView.zoomScale >> \(scrollView.zoomScale)")
      print("scrollView.contentInset >> \(scrollView.contentInset)")
    }
  }
  
}

extension ViewController: UIScrollViewDelegate {
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
    print("Zooming ended!")
    //    //        // These two sizes will be the same
    //    print("imageView.frame >> \(imageView.frame)")
    //    print ("scrollView.contentSize >> \(scrollView.contentSize)")
    //
    //    //     While bounds will be always the size of image
    //    print("imageView.bounds >> \(imageView.bounds) ")
    //    // These two will always be fixed to the size scrollView
    //    print ("scrollView.bounds >> \(scrollView.bounds)")
    //    print ("scrollView.frame >> \(scrollView.frame)")
    centerImage()
  }
  
}
