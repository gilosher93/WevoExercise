//
//  MainVC.swift
//  WevoExercise
//
//  Created by גיל אושר on 12.1.2016.
//  Copyright © 2016 gil osher. All rights reserved.
//

import UIKit

class MainVC: UIViewController{
    
    var navBar: UINavigationBar!;
    var bottomNavBar: UINavigationBar!;
    var statusBar: UIView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = UIColor(patternImage: UIImage(named: "wevo_bg_full")!);
        statusBar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: UIApplication.sharedApplication().statusBarFrame.height));
        statusBar.backgroundColor = UIColor(red: 89.0/255.0, green: 105.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        view.addSubview(statusBar);
        navBar = UINavigationBar(frame: CGRect(x: 0, y: statusBar.frame.height, width: view.frame.width, height: 40));
        navBar.barTintColor = UIColor(red: 89.0/255.0, green: 105.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        navBar.translucent = false;
        let navItem = UINavigationItem();
        navItem.titleView = UIImageView(image: UIImage(named: "wevo_wevo_logo"));
        let img1 = UIBarButtonItem(image: UIImage(named: "wevo_icon_filter"), style: UIBarButtonItemStyle.Done, target: self, action: "doSomething")
        img1.tintColor = UIColor.whiteColor();
        let img2 = UIBarButtonItem(image: UIImage(named: "wevo_icon_notifications"), style: UIBarButtonItemStyle.Done, target: self, action: "doSomething")
        img2.tintColor = UIColor.whiteColor();
        let img3 = UIBarButtonItem(image: UIImage(named: "wevo_icon_my_profile"), style: UIBarButtonItemStyle.Done, target: self, action: "doSomething")
        img3.tintColor = UIColor.whiteColor();
        let img4 = UIBarButtonItem(image: UIImage(named: "wevo_icon_privet"), style: UIBarButtonItemStyle.Done, target: self, action: "doSomething")
        img4.tintColor = UIColor.whiteColor();
        navItem.setLeftBarButtonItems([img1,img2], animated: false);
        navItem.setRightBarButtonItems([img4,img3], animated: false);
        navBar.items = [navItem];
        view.addSubview(navBar);
        
        bottomNavBar = UINavigationBar(frame: CGRect(x: 40, y: view.frame.height - 45, width: view.frame.width - 80, height: 55));
        bottomNavBar.barTintColor = UIColor(netHex: 0xB71C1C);
        bottomNavBar.layer.cornerRadius = 10;
        bottomNavBar.clipsToBounds = true;
        
        let img5 = UIBarButtonItem(image: UIImage(named: "wevo_icon_search"), style: UIBarButtonItemStyle.Done, target: self, action: "doSomething")
        img5.tintColor = UIColor.whiteColor();
        let img6 = UIBarButtonItem(image: UIImage(named: "wevo_icon_messeges"), style: UIBarButtonItemStyle.Done, target: self, action: "doSomething")
        img6.tintColor = UIColor.whiteColor();
        let bottomNavItem = UINavigationItem();
        bottomNavItem.titleView = UIImageView(image: UIImage(named: "wevo_icon_create_group"));
        bottomNavItem.titleView!.tintColor = UIColor.whiteColor();
        bottomNavItem.setRightBarButtonItem(img5, animated: false)
        bottomNavItem.setLeftBarButtonItem(img6, animated: false);
        bottomNavBar.items = [bottomNavItem];
        view.addSubview(bottomNavBar);
    }
    
    func doSomething(){
        
    }
    
    func back(){
        dismissViewControllerAnimated(false, completion: nil)
    }
}
