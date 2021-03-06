//
//  SUIARViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/5/21.
//

import UIKit
import SwiftUI

class SUIARViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arView = UIHostingController(rootView: CView())
        arView.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(arView)
        self.view.addSubview(arView.view)
        arView.didMove(toParent: self)
        
        
        NSLayoutConstraint.activate([arView.view.widthAnchor.constraint(equalToConstant: 200), arView.view.heightAnchor.constraint(equalToConstant: 200),])
    }

}
