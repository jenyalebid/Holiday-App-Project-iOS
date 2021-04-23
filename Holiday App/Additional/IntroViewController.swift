//
//  IntroViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/8/20.
//

import UIKit
import AVFoundation

class IntroViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var h1: UILabel!
    @IBOutlet weak var h2: UILabel!
    @IBOutlet weak var h3: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    var clickSound = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.isHidden = true
        
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "BGMusic", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            clickSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "clickSound", ofType: "wav")!))
            clickSound.prepareToPlay()
        }
        catch {
            
            print("Can't play audio")
        }
        
        
        
        startButton.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startBut(_ sender: Any) {
        
        logo.isHidden = true
        h1.isHidden = true
        h2.isHidden = true
        h3.isHidden = true
        startButton.isHidden = true
        spinner.isHidden = false
        
        clickSound.play()
        
        
        spinner.startAnimating()
        performSegue(withIdentifier: "toTab_seg", sender: self)
    }
}
