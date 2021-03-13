//
//  TreePlacementView.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/11/21.
//

import SwiftUI


struct PlacementView: View {
    
    @EnvironmentObject var placeSettings: PlacementSettings
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            PlacementButton(systemIconName: "xmark.circle.fill") {
                
                print("Placement Pressed")
                self.placeSettings.selectModel = nil
            }
            
            Spacer()
            
            PlacementButton(systemIconName: "checkmark.circle.fill") {
                
                print("Placement Pressed")
                self.placeSettings.confirmedModel = self.placeSettings.selectModel
                
                self.placeSettings.selectModel = nil
            }
            Spacer()
        }
        .padding(.bottom, 30)
    }    
}

struct PlacementButton: View {
    
    let systemIconName: String
    
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 50, weight: .light, design: .default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 75, height: 75)
    }
}
