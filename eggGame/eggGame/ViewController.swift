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
        continueButton.isEnabled = false
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var number = 10
    var text = "ゲーム開始"
    
    let image0:UIImage = UIImage(named:"egg01")!
    let image1:UIImage = UIImage(named:"egg02")!
    let image2:UIImage = UIImage(named:"egg03")!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func eggButton(_ sender: UIButton) {
        if Int(countLabel.text!)! >= 1{
            switch countLabel.text{
            case "5":
                button.setImage(image1, for: .normal)
                textLabel.text = "いいね"
            case "3":
                textLabel.text = "あとちょっと"
            case "1":
                textLabel.text = "ゲーム終了"
                button.setImage(image2, for: .normal)
                if continueButton.isEnabled == false{
                    continueButton.isEnabled = true
                }

            default:
                textLabel.text = ""
            }
            number -= 1
            countLabel.text = String(number)
        }else{
            countLabel.text = "0"
        }
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        number = 10
        countLabel.text = String(number)
        textLabel.text = ""
        button.setImage(image0, for: .normal)
        continueButton.isEnabled = false
    }
}

