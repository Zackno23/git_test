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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ryu.image = UIImage(named: "attak1")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ryu: UIImageView!
    @IBAction func command(_ sender: Any) {
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
            audioPlayer.play()
        }
        for i in 1 ... 20{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1 * Double(i)) {
                self.ryu.image = UIImage(named: "attak\(i)")
            }
        }
        audioPlayer.play()
    }
    
}

