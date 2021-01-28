//
//  TimerViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/9/20.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var shareView: UIView!
    
    @IBAction func counterShare(_ sender: Any) {
        
        UIGraphicsBeginImageContext(shareView.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            
            return
        }
        
        let share = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        

        
        present(share, animated: true, completion: nil)
    }
    
    var timer: Timer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true) // Repeat "func Update() " every second and update the label
    }
    
    @objc func UpdateTime() {
        let userCalendar = Calendar.current
        // Set Current Date
        let date = Date()
        let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
        let currentDate = userCalendar.date(from: components)!
        
        // Set Event Date
        var eventDateComponents = DateComponents()
        eventDateComponents.year = 2020
        eventDateComponents.month = 12
        eventDateComponents.day = 24
        eventDateComponents.hour = 09
        eventDateComponents.minute = 00
        eventDateComponents.second = 00
        eventDateComponents.timeZone = TimeZone(abbreviation: "GMT")
        
        // Convert eventDateComponents to the user's calendar
        let eventDate = userCalendar.date(from: eventDateComponents)!
        
        // Change the seconds to days, hours, minutes and seconds
        let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
        
        // Display Countdown
        daysLabel.text = "\(timeLeft.day!) Days"
        hoursLabel.text = "\(timeLeft.hour!) Hours"
        minutesLabel.text = "\(timeLeft.minute!) Minutes"
        secondsLabel.text = "and \(timeLeft.second!) Seconds"
        
        // Show diffrent text when the event has passed
        //endEvent(currentdate: currentDate, eventdate: eventDate)
    }
    
//    func endEvent(currentdate: Date, eventdate: Date) {
//        if currentdate >= eventdate {
//            countDownLabel.text = "Happy New Year!"
//            // Stop Timer
//            timer.invalidate()
//        }
//    }
}
    
    

//    var counter = 30
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//    }
//
//
//
//    @objc func updateCounter() {
//        //example functionality
//        if counter > 0 {
//            print("\(counter) seconds to the end of the world")
//            countDownLabel.text = String(counter)
//            counter -= 1
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
