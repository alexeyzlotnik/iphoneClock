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
    
    var isTapped = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.datePickerMode = .countDownTimer
        
        // styling buttons
        startTimerButton.translatesAutoresizingMaskIntoConstraints = false
        resetTimerButton.translatesAutoresizingMaskIntoConstraints = false
        
        startTimerButton.setTitleColor(UIColor(rgb: 0x73B177), for: .normal)
        startTimerButton.backgroundColor = UIColor(rgb: 0x203621)
        
        resetTimerButton.setTitleColor(UIColor(rgb: 0xffffff), for: .normal)
        resetTimerButton.backgroundColor = UIColor(rgb: 0x3D3D3D)
        
        let time = timerPicker.countDownDuration
        print(time)
        
        
    }
    
    @IBAction func timerPickerValueChanged(_ sender: UIDatePicker) {

        let countDownDuration = timerPicker.countDownDuration
        let datePicked = timerPicker.date
        
        print(countDownDuration, datePicked)
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timerPicker.isHidden = true
        
        isTapped = !isTapped
        if isTapped {
            sender.setTitle("Start", for: .normal)
            sender.setTitleColor(UIColor(rgb: 0x73B177), for: .normal)
            sender.backgroundColor = UIColor(rgb: 0x203621)
            
//            timer?.invalidate()
            
        } else {
            sender.setTitle("Stop", for: .normal)
            sender.setTitleColor(UIColor(rgb: 0xB85C4F), for: .normal)
            sender.backgroundColor = UIColor(rgb: 0x331A17)
            
//            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(StopWatchViewController.action), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timerPicker.isHidden = false
        
    }
    
    
    
}
