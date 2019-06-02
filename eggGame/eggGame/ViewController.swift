//
//  ViewController.swift
//  eggGame
//
//  Created by 吉田力 on 2019/06/02.
//  Copyright © 2019 吉田力. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        countLabel.text = String(number)
        textLabel.text = text
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var number = 10
    var text = "ゲーム開始"
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func eggButton(_ sender: UIButton) {
        if countLabel.text != "1"{
            switch countLabel.text{
            case "5":
                textLabel.text = "いいね"
            case "3":
                textLabel.text = "あとちょっと"
            default:
                textLabel.text = ""
            }
            number -= 1
            countLabel.text = String(number)
        }else{
            countLabel.text = "0"
            textLabel.text = "ゲーム終了"
        }
    }
    
}

