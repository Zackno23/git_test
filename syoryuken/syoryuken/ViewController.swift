//
//  ViewController.swift
//  syoryuken
//
//  Created by 吉田力 on 2019/06/03.
//  Copyright © 2019 吉田力. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let attackImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ryu.image = UIImage(named: "attak1")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ryu: UIImageView!
    @IBAction func command(_ sender: Any) {
        for i in 1 ... 20{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1 * Double(i)) {
                self.ryu.image = UIImage(named: "attak\(i)")
            }
        }
    }
    
}

