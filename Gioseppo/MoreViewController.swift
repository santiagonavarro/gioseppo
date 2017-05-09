//
//  MoreViewController.swift
//  Gioseppo
//
//  Created by Santiago Navarro Ruiz on 22/3/17.
//  Copyright © 2017 Santiago Navarro Ruiz. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    convenience init() {
        //Calling the designated initializer of same class
        self.init(nibName: "MoreViewController", bundle: nil)
        //initializing the view Controller form specified NIB file
    }

}

