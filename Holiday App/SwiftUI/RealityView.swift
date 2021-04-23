////
////  ContentView.swift
////  mono
////
////  Created by Jenya Lebid on 1/26/21.
////
//
//import SwiftUI
//import RealityKit
//import ARKit
//
//
//struct SecondRealityView : View {
//    
//    @State private var isPlacementEnabled = false
//    @State private var isPlaced = false
//    @State private var modelConfirmed: String?
//    
//    var body: some View {
//        
//        
//        ZStack(alignment: .bottom, content: {
//            
//
//            RealityViewAR(modelConfirmed: self.$modelConfirmed, isPlaced: self.$isPlaced)
//            
//            if self.isPlacementEnabled {
//                
//                placementButtons(isPlacementEnabled: self.$isPlacementEnabled, isPlaced: self.$isPlaced, modelConfirmed: self.$modelConfirmed)
//            }
//            else {
//                
//                modelPicker(isPlacementEnabled: self.$isPlacementEnabled, modelConfirmed: self.$modelConfirmed)
//            }
//        })
//    }
//}
//
//
//struct RealityViewAR: UIViewRepresentable {
//    
//    @Binding var modelConfirmed: String?
//    @Binding var isPlaced: Bool
//    
//    
//    func makeUIView(context: Context) -> ARView {
//
//        let arView = ARView(frame: .zero)
//        
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = [.horizontal, .vertical]
//        config.environmentTexturing = .automatic
//        
//        if #available(iOS 13.4, *) {
//            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
//                
//            }
//        }
//
//        arView.session.run(config)
//        return arView
//
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {
//        
//        print("IN AR")
//        print(modelConfirmed)
//        
//        if let model = self.modelConfirmed {
//            
//            print("Confirmed")
//            //print(modelConfirmed?.modelName)
//            //print(model.modelEntity)
//
//            
//            
//            let modelEntity = try!
//                ModelEntity.load(named: model)
//                
//                print("Adding Model")
//                
//                let anchorEntity = AnchorEntity(plane: .any)
//                anchorEntity.addChild(modelEntity)
//                
//                uiView.scene.addAnchor(anchorEntity)
//            
//            
//            
//            DispatchQueue.main.async {
//                
//                self.modelConfirmed = nil
//            }
//            
//        }
//        else {
//            
//            print("Model Not Confirmed")
//            
//        }
//    }
//
////    func updateUIView(_ uiView: ARView, context: Context) {
////
////        print("IN AR")
////
////        if let model = self.modelConfirmed {
////
////            print("Confirmed")
////            //print(modelConfirmed?.modelName)
////            //print(model.modelEntity)
////
////            if let modelEntity = model.modelEntity {
////
////                print("Adding Model")
////
////                let anchorEntity = AnchorEntity(plane: .any)
////                anchorEntity.addChild(modelEntity)
////
////                uiView.scene.addAnchor(anchorEntity)
////            }
////            else {
////
////                print("Unable to load model!")
////            }
////
////
////
////            DispatchQueue.main.async {
////
////                self.modelConfirmed = nil
////            }
////
////        }
////        else {
////
////            print("Model Not Confirmed")
////
////        }
////    }
//    
//        
//
//}
//
//struct modelPicker: View {
//    
//    @Binding var isPlacementEnabled: Bool
//    @Binding var modelConfirmed: String?
//    
//    var body: some View {
//        
//        Button(action: {
//            
//            isPlacementEnabled = true
//            //let model = Model(modelName: "toy_drummer")
//            //self.modelConfirmed = model
//
//            
//            
//        }, label: {
//            Text("Place Tree")
//                .frame(width: 200, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .font(.title)
//                .background(Color.white.opacity(0.75))
//                .cornerRadius(5)
//                .padding(20)
//        })
//        
//    }
//}
//
//
//struct placementButtons: View {
//    
//    @Binding var isPlacementEnabled: Bool
//    @Binding var isPlaced: Bool
//    @Binding var modelConfirmed: String?
//    
//    var body: some View {
//        
//        HStack {
//            
//            Button(action: {
//                
//                print("Cancel Placement")
//                isPlacementEnabled = false
//                
//                
//                
//            }, label: {
//                Image(systemName: "xmark")
//                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .font(.title)
//                    .background(Color.white.opacity(0.75))
//                    .cornerRadius(30)
//                    .padding(20)
//            })
//            Button(action: {
//                    
//                print("Confirm Placement")
//                //isPlacementEnabled = false
//                modelConfirmed = "treeFile.rcproject"
//            
//
//                isPlacementEnabled = false
//                isPlaced = true
//                
//            }, label: {
//                Image(systemName: "checkmark")
//                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .font(.title)
//                    .background(Color.white.opacity(0.75))
//                    .cornerRadius(30)
//                    .padding(20)
//            })
//        }
//    }
//}
//
//class RealityView: UIHostingController<SecondRealityView> {
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder,rootView: SecondRealityView());
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}
//
//
//
//#if DEBUG
//struct RealityView_Previews : PreviewProvider {
//    static var previews: some View {
//        SecondRealityView()
//    }
//}
//#endif
