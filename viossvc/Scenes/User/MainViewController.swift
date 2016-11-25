//
//  MainViewController.swift
//  viossvc
//
//  Created by yaowang on 2016/10/27.
//  Copyright © 2016年 ywwlcom.yundian. All rights reserved.
//

import Foundation
import XCGLogger
class MainViewController: UIViewController {
    var childViewControllerIdentifier:String?
    var childViewControllerData:AnyObject?
    static var childViewControllerIdentifierKey = "childViewControllerIdentifier"
    static var childViewControllerDataKey = "childViewControllerData"
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initChildViewController()
    }
    
    private func initChildViewController() {
        if childViewControllerIdentifier != nil {
            let childViewController:UIViewController! = storyboard!.instantiateViewControllerWithIdentifier(childViewControllerIdentifier!)
            if childViewControllerData != nil {
                childViewController.setValue(childViewControllerData, forKey: MainViewController.childViewControllerDataKey)
            }
            
            addChildViewController(childViewController)
            view.addSubview(childViewController.view)
            visualEffectView.hidden = false
            loginButton.hidden = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    @IBAction func didActionLogin(sender: AnyObject) {
        
        navigationController?.pushViewControllerWithIdentifier(MainViewController.className(), animated: true, valuesForKeys: [MainViewController.childViewControllerIdentifierKey:LoginViewController.className()])
    }
    @IBAction func didActionRegister(sender: AnyObject) {
        navigationController?.pushViewControllerWithIdentifier(MainViewController.className(), animated: true, valuesForKeys: [MainViewController.childViewControllerIdentifierKey:RegisterViewController.className()])
    }
    
}