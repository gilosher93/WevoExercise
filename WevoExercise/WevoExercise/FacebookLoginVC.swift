//
//  FacebookLoginVC.swift
//  WevoExercise
//
//  Created by גיל אושר on 12.1.2016.
//  Copyright © 2016 gil osher. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class FacebookLogin: UIViewController {
    
    var statusBar: UIView!;
    var imgLogo: UIImageView!;
    var lblFBLogin: UILabel!;
    var btnLoginFacebook: FBSDKLoginButton!;
    var lblDontHaveFB: UILabel!;
    var navBar: UINavigationBar!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "wevo_bg_full")!);
        statusBar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: UIApplication.sharedApplication().statusBarFrame.height))
        statusBar.backgroundColor = UIColor(red: 89.0/255.0, green: 105.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        view.addSubview(statusBar);
        navBar = UINavigationBar(frame: CGRect(x: 0, y: statusBar.frame.height, width: view.frame.width, height: 40))
        let navItem = UINavigationItem();
        navItem.titleView = UIImageView(image: UIImage(named: "wevo_wevo_logo"));
        let btnBarItem = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.Done, target: self, action: "back");
        btnBarItem.tintColor = UIColor.whiteColor();
        navItem.leftBarButtonItem = btnBarItem
        navBar.barTintColor = UIColor(red: 89.0/255.0, green: 105.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        navBar.translucent = false;
        navBar.items = [navItem];
        view.addSubview(navBar);
        imgLogo = UIImageView(image: UIImage(named: "wevo_wevo_logo"));
        imgLogo.frame = CGRect(x: 0, y: 0, width: 180, height: 50);
        imgLogo.center = view.center;
        imgLogo.frame.origin.y = navBar.frame.maxY + 30;
        view.addSubview(imgLogo);
        lblFBLogin = UILabel(frame: CGRect(x: 30, y: imgLogo.frame.maxY + 10, width: view.frame.width - 60, height: 100));
        lblFBLogin.text = "To complete the registration,\nplease login using a social profile";
        lblFBLogin.contentMode = .Center;
        lblFBLogin.numberOfLines = 3;
        lblFBLogin.textAlignment = .Center;
        lblFBLogin.textColor = UIColor.whiteColor();
        view.addSubview(lblFBLogin);
        btnLoginFacebook = FBSDKLoginButton(type: UIButtonType.System);
        btnLoginFacebook.frame = CGRect(x: 0, y: 0, width: 100, height: 40);
        btnLoginFacebook.center = view.center;
        btnLoginFacebook.frame.origin.y = lblFBLogin.frame.maxY + 30;
        btnLoginFacebook.center = view.center;
        btnLoginFacebook.addTarget(self, action: "loginFB", forControlEvents: UIControlEvents.TouchUpInside);
        view.addSubview(btnLoginFacebook);
        let lblDontHaveFB = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20));
        lblDontHaveFB.center = view.center;
        lblDontHaveFB.frame.origin.y = btnLoginFacebook.frame.maxY + 30;
        lblDontHaveFB.font = UIFont(name: lblDontHaveFB.font!.fontName, size: 10);
        lblDontHaveFB.text = "Dont have facebook?";
        lblDontHaveFB.textAlignment = .Center;
        lblDontHaveFB.textColor = UIColor.whiteColor();
        view.addSubview(lblDontHaveFB);
        let lblSinginDiffrent = UnderlinedLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20));
        lblSinginDiffrent.center = view.center;
        lblSinginDiffrent.frame.origin.y = lblDontHaveFB.frame.maxY;
        lblSinginDiffrent.font = UIFont(name: lblDontHaveFB.font!.fontName, size: 10);
        lblSinginDiffrent.text = "Sign up with a diffrent social account";
        lblSinginDiffrent.textAlignment = .Center;
        lblSinginDiffrent.textColor = UIColor.whiteColor();
        view.addSubview(lblSinginDiffrent);
    }
    
    func loginFB(){
        let prefrences = NSUserDefaults.standardUserDefaults();
        prefrences.setBool(true, forKey: "FB_LOGIN")
        prefrences.synchronize();
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        let prefrences = NSUserDefaults.standardUserDefaults();
        let isConnectToFB = prefrences.objectForKey("FB_LOGIN");
        if let theConnection = isConnectToFB{
            if (theConnection as! Bool){
                prefrences.setBool(false, forKey: "FB_LOGIN")
                presentViewController(MainVC(), animated: false, completion: nil);
            }
        }
        
    }
    
    class UnderlinedLabel: UILabel {
        
        override var text: String! {
            
            didSet {
                let textRange = NSMakeRange(0, (text as NSString).length)
                let attributedText = NSMutableAttributedString(string: text)
                attributedText.addAttribute(NSUnderlineStyleAttributeName , value:NSUnderlineStyle.StyleSingle.rawValue, range: textRange)
                // Add other attributes if needed
                
                self.attributedText = attributedText
            }
        }
    }
    
    func back(){
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
}
