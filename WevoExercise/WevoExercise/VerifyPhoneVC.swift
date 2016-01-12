//
//  VerifyPhone.swift
//  WevoExercise_iOS
//
//  Created by גיל אושר on 12.1.2016.
//  Copyright © 2016 gil osher. All rights reserved.
//

import UIKit

class VerifyPhoneVC: UIViewController {
    
    var tapGesture: UITapGestureRecognizer!;
    var statusBar: UIView!;
    var imgLogo: UIImageView!;
    var lblVerifyPhone: UILabel!;
    var txtCode: UITextField!;
    var btnLogin: UIButton!;
    var navBar: UINavigationBar!;

    override func viewDidLoad() {
        super.viewDidLoad()
        view.userInteractionEnabled = true;
        tapGesture = UITapGestureRecognizer(target: self, action: "closeKeyboard:");
        view.addGestureRecognizer(tapGesture);
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
        lblVerifyPhone = UILabel(frame: CGRect(x: 30, y: imgLogo.frame.maxY + 10, width: view.frame.width - 60, height: 100));
        lblVerifyPhone.text = "Please enter the 4 digit code\nyou recive in the sms";
        lblVerifyPhone.contentMode = .Center;
        lblVerifyPhone.numberOfLines = 3;
        lblVerifyPhone.textAlignment = .Center;
        lblVerifyPhone.textColor = UIColor.whiteColor();
        view.addSubview(lblVerifyPhone);
        txtCode = UITextField(frame: CGRect(x: 15, y: lblVerifyPhone.frame.maxY + 20, width: view.frame.width - 30, height: 30));
        txtCode.borderStyle = .RoundedRect;
        txtCode.textAlignment = .Center;
        txtCode.backgroundColor = UIColor.whiteColor();
        txtCode.keyboardType = .PhonePad;
        view.addSubview(txtCode);
        btnLogin = UIButton(type: UIButtonType.System);
        btnLogin.frame = CGRect(x: 0, y: 0, width: 100, height: 40);
        btnLogin.center = view.center;
        btnLogin.frame.origin.y = txtCode.frame.maxY + 30;
        btnLogin.addTarget(self, action: "Login:", forControlEvents: UIControlEvents.TouchUpInside);
        btnLogin.setTitle("Log in", forState: UIControlState.Normal);
        btnLogin.titleLabel!.font = UIFont(name: btnLogin.titleLabel!.font!.fontName, size: 18);
        btnLogin.tintColor = UIColor(netHex: 0xB71C1C);
        btnLogin.backgroundColor = UIColor.whiteColor();
        btnLogin.layer.cornerRadius = 20;
        view.addSubview(btnLogin);
    }
    
    func Login(sender: UIButton){
        presentViewController(FacebookLogin(), animated: false, completion: nil);
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
    
    func closeKeyboard(sender: UITapGestureRecognizer){
        txtCode.resignFirstResponder();
    }
}
