//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //Audio Visual... para reproducir audio

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(letra: sender.currentTitle!)
        //print(sender.currentTitle)
        sender.alpha = 0.5;
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            sender.alpha = 1;
        })
    }
    
    func playSound(letra: String) {
        let url = Bundle.main.url(forResource: letra, withExtension: "wav")

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}

