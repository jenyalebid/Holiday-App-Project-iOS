//
//  SUIARViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/5/21.
//

import UIKit
import SwiftUI

class SUIARViewController: UIViewController {
    
    @IBOutlet var localVIew: UIView!
    @IBOutlet weak var localInnerView: UIView!
    @StateObject var placeSettings = PlacementSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TreeApp()
        
        let arView = UIHostingController(rootView: CView().environmentObject(placeSettings))
        arView.view.translatesAutoresizingMaskIntoConstraints = false
        arView.view.clipsToBounds = true
        self.addChild(arView)
        self.view.addSubview(arView.view)
        arView.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            arView.view.widthAnchor.constraint(equalTo: localInnerView.widthAnchor),
            arView.view.heightAnchor.constraint(equalTo: localInnerView.heightAnchor),
            arView.view.centerXAnchor.constraint(equalTo: localInnerView.centerXAnchor),
            arView.view.centerYAnchor.constraint(equalTo: localInnerView.centerYAnchor)
        ])
    }

}
