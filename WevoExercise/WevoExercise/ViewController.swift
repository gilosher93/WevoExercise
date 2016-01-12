//
//  ViewController.swift
//  WevoExercise
//
//  Created by גיל אושר on 12.1.2016.
//  Copyright © 2016 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapGesture: UITapGestureRecognizer!;
    var statusBar: UIView!;
    var imgLogo: UIImageView!;
    var lblEnterPhoneNumber: UILabel!;
    var txtPhoneNumber: UITextField!;
    var btnEnterPhone: UIButton!;
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
        navBar.barTintColor = UIColor(red: 89.0/255.0, green: 105.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        navBar.translucent = false;
        navBar.items = [navItem];
        view.addSubview(navBar);
        imgLogo = UIImageView(image: UIImage(named: "wevo_wevo_logo"));
        imgLogo.frame = CGRect(x: 0, y: 0, width: 180, height: 50);
        imgLogo.center = view.center;
        imgLogo.frame.origin.y = navBar.frame.maxY + 30;
        view.addSubview(imgLogo);
        lblEnterPhoneNumber = UILabel(frame: CGRect(x: 30, y: imgLogo.frame.maxY + 10, width: view.frame.width - 60, height: 100));
        lblEnterPhoneNumber.text = "Wellcome to wevo,\n to create a secure account please enter your phone number";
        lblEnterPhoneNumber.contentMode = .Center;
        lblEnterPhoneNumber.numberOfLines = 3;
        lblEnterPhoneNumber.textAlignment = .Center;
        lblEnterPhoneNumber.textColor = UIColor.whiteColor();
        view.addSubview(lblEnterPhoneNumber);
        txtPhoneNumber = UITextField(frame: CGRect(x: 15, y: lblEnterPhoneNumber.frame.maxY + 20, width: view.frame.width - 30, height: 30));
        txtPhoneNumber.borderStyle = .RoundedRect;
        txtPhoneNumber.backgroundColor = UIColor.whiteColor();
        txtPhoneNumber.keyboardType = .PhonePad;
        view.addSubview(txtPhoneNumber);
        btnEnterPhone = UIButton(type: UIButtonType.System);
        btnEnterPhone.frame = CGRect(x: 0, y: 0, width: 100, height: 40);
        btnEnterPhone.center = view.center;
        btnEnterPhone.frame.origin.y = txtPhoneNumber.frame.maxY + 30;
        btnEnterPhone.addTarget(self, action: "SendSMS:", forControlEvents: UIControlEvents.TouchUpInside);
        btnEnterPhone.setTitle("Continue", forState: UIControlState.Normal);
        btnEnterPhone.titleLabel!.font = UIFont(name: btnEnterPhone.titleLabel!.font!.fontName, size: 18);
        btnEnterPhone.tintColor = UIColor(netHex: 0xB71C1C);
        btnEnterPhone.backgroundColor = UIColor.whiteColor();
        btnEnterPhone.layer.cornerRadius = 20;
        view.addSubview(btnEnterPhone);
    }
    
    func SendSMS(sender: UIButton){
        if !ViewController.isValidPhone(txtPhoneNumber.text!){
            let invalidController = UIAlertController(title: "שגיאה", message: "אנא וודא שהכנסת מספר טלפון תקין", preferredStyle: UIAlertControllerStyle.Alert);
            invalidController.addAction(UIAlertAction(title: "אישור", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) -> Void in
                
            }))
            presentViewController(invalidController, animated: true, completion: nil);
            return;
        }
        presentViewController(VerifyPhoneVC(), animated: false, completion: nil);
    }
    
    func back(){
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeKeyboard(sender: UITapGestureRecognizer){
        txtPhoneNumber.resignFirstResponder();
    }
    
    static func isValidPhone(str: NSString)->Bool{
        if str.length == 0 || str.length < 10{
            return false;
        }
        for i in 0..<(str as NSString).length{
            let asciiNum = Int(str.characterAtIndex(i));
            if(asciiNum < 48 || asciiNum > 57){
                return false;
            }
        }
        return true;
    }
    
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


