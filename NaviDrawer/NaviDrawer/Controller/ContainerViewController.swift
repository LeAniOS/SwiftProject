//
//  ContainerViewController.swift
//  NaviDrawer
//
//  Created by Ân Lê on 5/2/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    var menucontroller : UIViewController!
    var centerController :UIViewController!
    var isExpanded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeViewController()
        // Do any additional setup after loading the view.
    }
    
    func configHomeViewController (){
        let home = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.delegate = self
        centerController = UINavigationController(rootViewController: home)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    func configMenuViewController(){
        if menucontroller == nil {
            menucontroller = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            view.insertSubview(menucontroller.view, at: 0)
            addChild(menucontroller)
            menucontroller.didMove(toParent: self)
            
        }
    }
    func showMenuController(shouldEx: Bool){
        if shouldEx{
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: nil)
        }
    }

}
extension ContainerViewController : HomeControllerDelegate{
    func handleMenu() {
        if !isExpanded {
            configMenuViewController()
        }
        
            isExpanded = !isExpanded
            showMenuController(shouldEx: isExpanded)
            
    
        
    }
    
    
}
