//
//  MyTabBarViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit

class MyTabBarViewController: UITabBarController {
    
    func setTabBarItems(){
          
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
          myTabBarItem1.image = UIImage(named: "HomeUn")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          myTabBarItem1.selectedImage = UIImage(named: "HomeSe")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          myTabBarItem1.title = "Home"
//          myTabBarItem1.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
          
          let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "PlusUn")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          myTabBarItem2.selectedImage = UIImage(named: "PlusSe")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          myTabBarItem2.title = "New Task"
//          myTabBarItem2.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
          
          
          let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
          myTabBarItem3.image = UIImage(named: "DocumenSe")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          myTabBarItem3.selectedImage = UIImage(named: "DocumentUn")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
          myTabBarItem3.title = "Tasks"
//          myTabBarItem3.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        
          
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems()
        self.navigationItem.hidesBackButton = true;
        self.tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.itemWidth = self.view.frame.size.width/8

        delegate = self
    }
}



extension MyTabBarViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MyTransition(viewControllers: tabBarController.viewControllers)
    }
}

class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 0.5

    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(transitionDuration)
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
            else {
                transitionContext.completeTransition(false)
                return
        }

        let frame = transitionContext.initialFrame(for: fromVC)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart

        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(withDuration: self.transitionDuration, animations: {
                fromView.frame = fromFrameEnd
                toView.frame = frame
            }, completion: {success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    }

    func getIndex(forViewController vc: UIViewController) -> Int? {
        guard let vcs = self.viewControllers else { return nil }
        for (index, thisVC) in vcs.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}


extension UIImage  {
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
