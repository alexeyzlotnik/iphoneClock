//
//  TimerViewController.swift
//  iphoneClock
//
//  Created by Алексей Злотник on 09.11.2020.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var startTimerButton: CustomButton!
    @IBOutlet weak var resetTimerButton: CustomButton!
    @IBOutlet weak var timerPicker: UIDatePicker!
    @IBOutlet weak var timerLabel: UILabel!{
        didSet{
            timerLabel.isHidden = true
        }
    }
    
    var isTapped = true
    var timer: Timer?
    var seconds = 0
    var miliSeconds = 0
    var minutes = 0
    var hours = 0
    var totalSeconds = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.datePickerMode = .countDownTimer
        
        // styling buttons
        startTimerButton.translatesAutoresizingMaskIntoConstraints = false
        resetTimerButton.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false 
        
        startTimerButton.setTitleColor(UIColor(rgb: 0x73B177), for: .normal)
        startTimerButton.backgroundColor = UIColor(rgb: 0x203621)
        
        resetTimerButton.setTitleColor(UIColor(rgb: 0xffffff), for: .normal)
        resetTimerButton.backgroundColor = UIColor(rgb: 0x3D3D3D)
        
        
        
        let time = timerPicker.countDownDuration
        print(time)
        
        
    }
    
    @IBAction func timerPickerValueChanged(_ sender: UIDatePicker) {
        
        totalSeconds = Int(timerPicker.countDownDuration)
        print(totalSeconds)
//        miliSeconds = seconds / 100
//        minutes = seconds / 60
//        hours = minutes / 60
        
//        print("Seconds: \(seconds), miliseconds: \(miliSeconds), minutes: \(minutes), hours: \(hours)")
        
        
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timerPicker.isHidden = true
        timerLabel.isHidden = false
        
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
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.action), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timerPicker.isHidden = false
        timerLabel.isHidden = true
        setupBasicTimer()
    }
    
    @objc func action(){
        
//        miliSeconds -= 1
//
//        guard miliSeconds <= 100 else {return miliSeconds = 0}
            
        // seconds
//            if miliSeconds % 100 == 0 {
//                seconds -= 1
//
//                // minutes
//                guard seconds <= 60 else {return seconds = 0}
//                if seconds % 60 == 0 {
//                    minutes -= 1
//
//                    // hours
//                    guard seconds <= 60 else {return seconds = 0}
//                    if minutes % 60 == 0 {
//                        hours -= 1
//                    }
//                }
//            }
        
        // MARK: last time I stopped here.
        guard totalSeconds != 0 else {return}
        seconds = totalSeconds % 60
        minutes = seconds / 60 % 60
        hours = seconds / 60 % 360
        let finalTime = String(format: "%02u:%02u,%02u", hours,minutes,seconds)
        timerLabel.text = finalTime
        
//        seconds -= 1
        
        
//        // minutes
//        guard seconds <= 60 else {return seconds = 0}
//        if seconds % 60 == 0 {
//            minutes -= 1
//
//            // hours
//            guard seconds <= 60 else {return seconds = 0}
//            if minutes % 60 == 0 {
//                hours -= 1
//            }
//        }
        
        // format time to view 00:00:00
       
       
      
    }
    
    func setupBasicTimer(){
        miliSeconds = 0
        totalSeconds = 0
        seconds = 0
        minutes = 0
        hours = 0
        timerLabel.text = "00:00,00"
    }

    
    
}
