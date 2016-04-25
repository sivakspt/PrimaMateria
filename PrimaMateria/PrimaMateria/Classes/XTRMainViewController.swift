//
//  XTRMainViewController.swift
//  PrimaMateria
//
//  Created by Jerry Porter on 4/15/16.
//  Copyright © 2016 xTrensa. All rights reserved.
//

@objc class XTRMainViewController : UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Initialization Methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: - Internal Methods
    
    func customizeTabBarItems() {
        let rect : CGRect = self.tabBar.frame
        let newSize : CGSize = CGSizeMake(90, rect.size.height)
        let selectionImage : UIImage = UIImage.imageFromColor(UIColor.lightGrayColor(), andSize: newSize)
        let imageView : UIImageView = UIImageView(image: selectionImage)
        
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, UIScreen.mainScreen().scale)
        
        UIBezierPath.init(roundedRect: imageView.bounds, cornerRadius: 8.0).addClip()
        
        selectionImage.drawInRect(imageView.bounds)
        
        self.tabBar.selectionIndicatorImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    func showSplash() {
        let defaultState : Bool = XTRPropertiesStore.retreiveSplashScreenState()
        
        if (defaultState) {
            let splashViewController : XTRSplashViewController = XTRAppDelegate.storyboard().instantiateViewControllerWithIdentifier("XTRSplashViewController") as! XTRSplashViewController
            self.view.addSubview(splashViewController.view)
        }
    }
    
    // MARK: - Action Methods
    
    // MARK: - UITabBarControllerDelegate Methods
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        let defaultState : Bool = XTRPropertiesStore.retreiveShowTransitionsState()
        
        if (defaultState) {
            let currentVC : UIViewController = tabBarController.selectedViewController!
            
            if (currentVC == viewController) {
                return false
            }
            
            UIView.beginAnimations("View Flip", context: nil)
            UIView.setAnimationDuration(1.5)
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView:tabBarController.view, cache:true)
            
            currentVC.viewWillAppear(true)
            viewController.viewWillDisappear(true)
            viewController.viewDidDisappear(true)
            currentVC.viewDidAppear(true)
            
            UIView.commitAnimations()
        }
        return true
    }
    
    // MARK: - View Management Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSplash()
        self.customizeTabBarItems()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.LandscapeLeft, UIInterfaceOrientationMask.LandscapeRight]
    }
    
    // MARK: - Memory Management Methods
    
}
