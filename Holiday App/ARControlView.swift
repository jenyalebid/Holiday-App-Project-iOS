//
//  ARControlView.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/6/21.
//

import SwiftUI


struct ARControlView: View {
    
    @Binding var isControlsVisible: Bool
    @Binding var showBrowse: Bool

    
    var body: some View {
         
        VStack {
            
            ControlButton(isControlsVisible: $isControlsVisible)
            
            Spacer()
            
            if isControlsVisible {
                
                ControlButtonBar(showBrowse: $showBrowse)
            }
        }
    }
}


struct ControlButton: View {
    
    @Binding var isControlsVisible: Bool
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            ZStack {
                
                Color.black.opacity(0.25)
                
                Button(action: {
                    
                    print("Top Pressed")
                    self.isControlsVisible.toggle()
                    
                }) {
                    Image(systemName: self.isControlsVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
        }
        .padding(.top, 20)
        .padding(.trailing, 20)
    }
}


struct ControlButtonBar: View {
    
    @Binding var showBrowse: Bool
    
    var body: some View {
        
        HStack {
            
            ControlButtonSingle(systemIconName: "square.grid.2x2") {
                
                print("Button Press")
            }
            
            Spacer()
            
            ControlButtonSingle(systemIconName: "square.grid.2x2") {
                
                print("Button Press")
                self.showBrowse.toggle()
                
            }.sheet(isPresented: $showBrowse, content: {
                
                TreeBrowse(showBrowse: $showBrowse)
            })
            
            Spacer()
            
            ControlButtonSingle(systemIconName: "square.grid.2x2") {
                
                print("Button Press")
            }
        }
        
        .frame(maxWidth: 500)
        .padding(20)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButtonSingle: View {
    
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}
