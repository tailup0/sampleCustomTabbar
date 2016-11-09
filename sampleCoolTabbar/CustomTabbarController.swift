//
//  CustomTabbarController.swift
//  sampleCoolTabbar
//
//  Created by Muneharu Onoue on 2016/11/09.
//  Copyright © 2016年 Muneharu Onoue. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController, UITabBarControllerDelegate
{
    internal var vBase: UIView!
    private var btnLeft: UIButton!
    private var btnMid: UIButton!
    private var btnRight: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let V1 = Vc1() // UIViewController
        let V2 = Vc2() // UIViewController
        let V3 = Vc3() // UIViewController
        
        viewControllers = [V1, V2, V3]
        
        setupButtons()
        
        selectedIndex = 1
        
        tabBar.isHidden = true
    }

    func animateToTab(toIndex: Int)
    {
        if  let vcTabs:[UIViewController] = viewControllers,
            let vcSelected = selectedViewController,
            let fromInx = vcTabs.index(of: vcSelected)
        {
            guard fromInx != toIndex else {return}
            
            view.isUserInteractionEnabled = false
            
            selectedIndex = toIndex
            
            let orgSize = CGAffineTransform(scaleX: 1, y: 1)
            let tapSize = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
            UIView.animate(withDuration: 0.1, animations: {
                
                switch toIndex {
                case 0:
                    self.btnLeft?.transform = tapSize
                    self.btnMid?.transform = orgSize
                    self.btnRight?.transform = orgSize
                    
                case 1:
                    self.btnLeft?.transform = orgSize
                    self.btnMid?.transform = tapSize
                    self.btnRight?.transform = orgSize

                case 2:
                    self.btnLeft?.transform = orgSize
                    self.btnMid?.transform = orgSize
                    self.btnRight?.transform = tapSize
                    
                default:
                  break
                }

                
                }, completion: { finished in
                    self.view.isUserInteractionEnabled = true
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tapLeft(sender:AnyObject){
        let toIndex = 0
        animateToTab(toIndex: toIndex)
    }

    func tapMiddle(sender:AnyObject){
        let toIndex = 1
        animateToTab(toIndex: toIndex)
    }

    func tapRight(sender:AnyObject){
        let toIndex = 2
        animateToTab(toIndex: toIndex)
    }
    
    internal func setupButtons()
    {
        let scWidth = view.bounds.size.width
        let scHeight = view.bounds.size.height

        let hv = 60 as CGFloat
        vBase = UIView()
        vBase.frame = CGRect(x: 0, y: scHeight - hv, width: scWidth, height: hv)
        self.view.addSubview(vBase)
        
        btnLeft = UIButton()
        btnLeft.frame = CGRect(x: 0, y: 0, width: hv, height: hv)
        btnLeft.center = CGPoint(x: scWidth / 6, y: hv / 2)
        btnLeft.backgroundColor = UIColor.yellow
        btnLeft.addTarget(self, action: #selector(CustomTabbarController.tapLeft), for: UIControlEvents.touchUpInside)
        vBase.addSubview(btnLeft)
        
        btnMid = UIButton()
        btnMid.frame = CGRect(x: 0, y: 0, width: hv, height: hv)
        btnMid.center = CGPoint(x: scWidth / 2, y: hv / 2)
        btnMid.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        btnMid.backgroundColor = UIColor.yellow
        btnMid.addTarget(self, action: #selector(CustomTabbarController.tapMiddle), for: UIControlEvents.touchUpInside)
        vBase.addSubview(btnMid)
        
        btnRight = UIButton()
        btnRight.frame = CGRect(x: 0, y: 0, width: hv, height: hv)
        btnRight.center = CGPoint(x: scWidth / 6 * 5, y: hv / 2)
        btnRight.backgroundColor = UIColor.yellow
        btnRight.addTarget(self, action: #selector(CustomTabbarController.tapRight), for: UIControlEvents.touchUpInside)
        vBase.addSubview(btnRight)
    }
}
