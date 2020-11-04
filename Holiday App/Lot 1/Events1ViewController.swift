//
//  EventsViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/17/20.
//

import UIKit

class Events1ViewController: UIViewController {
    
    @IBOutlet weak var event_image: UIImageView!
    @IBOutlet weak var event_title: UILabel!
    @IBOutlet weak var event_date_time: UILabel!
    @IBOutlet weak var event_description: UILabel!
    
    
    var localIndex = Int()
    //var eventTitle = String()
    //var eventDate = String()
    //var eventDesc = String()
    
    
    
    let event_titles =
        ["Title 1", "Title 2"]

    let event_date_times =
        ["Dec 17 at 7 PM", "Dec 21 at 3 PM"]

    let event_descriptions =
        ["Description 1 and whaterver else you want here so I dont know", "Description 2 and what you want to make and I will make"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("On events", localIndex)
        
        event_title.text = event_titles[localIndex]
        event_date_time.text = event_date_times[localIndex]
        event_description.text = event_descriptions[localIndex]
        
    }
}
