//
//  HomeViewController.swift
//  NaviDrawer
//
//  Created by Ân Lê on 5/2/20.
//  Copyright © 2020 Ân Lê. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var delegate : HomeControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        confignavigaitonBar()
        // Do any additional setup after loading the view.
    }
    func confignavigaitonBar(){
        navigationController?.navigationBar.barTintColor = .gray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "icons8-list-48")?.withRenderingMode((.alwaysOriginal)) , style: .plain, target: self, action: #selector(handleMenu))
        
    }
    
    @objc func handleMenu(){
        delegate?.handleMenu()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
