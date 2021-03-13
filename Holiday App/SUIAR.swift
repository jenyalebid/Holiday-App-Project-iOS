//
//  SUIAR.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/5/21.
//

import SwiftUI
import RealityKit

struct CView : View {
    
    @EnvironmentObject var placeSettings: PlacementSettings
    @State private var isControlsVisible: Bool = true
    @State private var showBrowse: Bool = false

    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            ARViewContainer()
            
            if self.placeSettings.selectModel == nil {
                
                ARControlView(isControlsVisible: $isControlsVisible, showBrowse: $showBrowse)
            }
            else {
                
                PlacementView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @EnvironmentObject var placeSettings: PlacementSettings
    
    
    func makeUIView(context: Context) -> CustomAR {
        
        let arView = CustomAR(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! TreeScene.loadTree()
        
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        
        self.placeSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, {
            
            (event) in
            
            //updateScene
            
            self.updateScene(for: arView)
        })
        
        return arView
        
    }
    
    func updateUIView(_ uiView: CustomAR, context: Context) {
        
        
    }
    
    private func updateScene(for arView: CustomAR) {
        
        arView.focusEntity?.isEnabled = self.placeSettings.selectModel != nil
        
        
        if let confirmedModel = self.placeSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            
            // call place
            self.place(modelEntity, in: arView)
            
            self.placeSettings.confirmedModel = nil
        }
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        
        // clone multiple of same
        
        let cloneEntity = modelEntity.clone(recursive: true)
        
        // translate
        
        cloneEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation, .scale], for: cloneEntity)
        
        // anchor
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(cloneEntity)
        
        // place
        
        arView.scene.addAnchor(anchorEntity)
        print("Object Placed")
        
    
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
        
            .environmentObject(PlacementSettings())
    }
}

