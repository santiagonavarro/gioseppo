//
//  ThirdViewController.swift
//  Gioseppo
//
//  Created by Santiago Navarro Ruiz on 22/3/17.
//  Copyright © 2017 Santiago Navarro Ruiz. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    convenience init() {
        //Calling the designated initializer of same class
        self.init(nibName: "ThirdViewController", bundle: nil)
        //initializing the view Controller form specified NIB file
    }
}
