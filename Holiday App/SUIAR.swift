//
//  SUIAR.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/5/21.
//

import SwiftUI
import RealityKit

struct CView : View {
    var body: some View {
        
        //ARViewContainer().edgesIgnoringSafeArea(.all)
        
        Text("Hello, world!")
            .padding()
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! TreeScene.loadTree()
        
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}
