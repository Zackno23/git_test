//
//  ViewController.swift
//  syoryuken
//
//  Created by 吉田力 on 2019/06/03.
//  Copyright © 2019 吉田力. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    let attackImage = UIImageView()
    var audioPlayer: AVAudioPlayer!
    let correctCommand : Array <String> = ["→","↓","↘","Y"]
    var commandCount : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ryu.image = UIImage(named: "attak1")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var down: UIButton!
    @IBOutlet weak var lowerRight: UIButton!
    @IBOutlet weak var y: UIButton!
    
    @IBOutlet weak var ryu: UIImageView!
    
    @IBAction func command(_ sender: UIButton) {
        sender.isEnabled = false
        if sender.titleLabel?.text! == correctCommand[commandCount] && commandCount < 3{
            commandCount += 1
        }else if sender.titleLabel?.text! == correctCommand[commandCount] && commandCount == 3{
            commandCount = 0
            let audioPath = Bundle.main.path(forResource: "nc177750", ofType: "wav")!
            let audioUrl = URL(fileURLWithPath: audioPath)
            var audioError: NSError?
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            }catch let error as NSError{
                audioError = error
                audioPlayer = nil
                if let error = audioError{
                    print("Error \(error.localizedDescription)")
                }
                audioPlayer.delegate = self
                audioPlayer.prepareToPlay()
            }
            for i in 1 ... 20{
                let time = DispatchTime.now()
                DispatchQueue.main.asyncAfter(deadline: time + 0.1 * Double(i)) {
                    self.ryu.image = UIImage(named: "attak\(i)")
                    if i == 20{
                        self.right.isEnabled = true
                        self.down.isEnabled = true
                        self.lowerRight.isEnabled = true
                        self.y.isEnabled = true
                    }
                }
            }
            audioPlayer.play()
        }else{
            commandCount = 0
        }
    }
}

