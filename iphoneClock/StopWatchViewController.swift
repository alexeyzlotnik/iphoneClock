//
//  StopWatchViewController.swift
//  iphoneClock
//
//  Created by Алексей Злотник on 09.11.2020.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    
    
    @IBOutlet weak var startButton: CustomButton!
    @IBOutlet weak var resetButton: CustomButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var isTapped = true
    var timer: Timer?
    var seconds = 0
    var miliSeconds = 0
    var minutes = 0
    var hours = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seconds = 0
        minutes = seconds % 60
        hours = minutes % 60
        miliSeconds = seconds / 100
        
        timerLabel.text = "00:00,00"
        
        // styling buttons
        startButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        startButton.setTitleColor(UIColor(rgb: 0x73B177), for: .normal)
        startButton.backgroundColor = UIColor(rgb: 0x203621)
        
        resetButton.setTitleColor(UIColor(rgb: 0xffffff), for: .normal)
        resetButton.backgroundColor = UIColor(rgb: 0x3D3D3D)
        
        
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        isTapped = !isTapped
        if isTapped {
            sender.setTitle("Start", for: .normal)
            sender.setTitleColor(UIColor(rgb: 0x73B177), for: .normal)
            sender.backgroundColor = UIColor(rgb: 0x203621)
            
            timer?.invalidate()
            
        } else {
            sender.setTitle("Stop", for: .normal)
            sender.setTitleColor(UIColor(rgb: 0xB85C4F), for: .normal)
            sender.backgroundColor = UIColor(rgb: 0x331A17)
            
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(StopWatchViewController.action), userInfo: nil, repeats: true)
        }
        
        
        
//        startButton.setTitle("Stop", for: .normal)
        
        
        
        
//        startButton.set
        
    }
    
    @objc func action(){
        
        miliSeconds += 1
        
        guard miliSeconds <= 100 else {return miliSeconds = 0}
            
        // seconds
            if miliSeconds % 100 == 0 {
                seconds += 1
                
                // minutes
                guard seconds <= 60 else {return seconds = 0}
                if seconds % 60 == 0 {
                    minutes += 1
                }
            }
        
        // format time to view 00:00:00
        let finalTime = String(format: "%02u:%02u,%01u", minutes,seconds,miliSeconds)
        timerLabel.text = finalTime
       
      
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        miliSeconds = 0
        seconds = 0
        minutes = 0
        timerLabel.text = "00:00,00"
        
    }
    
    
    
    
}
