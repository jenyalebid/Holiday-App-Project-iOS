////
////  treeBrowse.swift
////  Holiday App
////
////  Created by Jenya Lebid on 3/10/21.
////
//
//import SwiftUI
//
//struct TreeBrowse: View {
//    
//    @Binding var showBrowse: Bool
//    
//    var body: some View {
//        
//        NavigationView {
//            
//            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
//                
//                if #available(iOS 14.0, *) {
//                    
//                    ModelsByCatGrid(showBrowse: $showBrowse)
//                } else {
//                    // Fallback on earlier versions
//                }
//                
//            })
//            .navigationBarTitle(Text("Select Tree"), displayMode: .large)
//            .navigationBarItems(trailing:
//                                    Button(action: {
//                                        self.showBrowse.toggle()
//                                    }, label: {
//                                        Text("Done").bold()
//                                    }))
//        }
//    }
//}
//
//struct ModelsByCatGrid: View {
//    
//    @Binding var showBrowse: Bool
//
//    
//    let models = TreeModels()
//    
//    var body: some View {
//        
//        VStack {
//            
//            ForEach(ModelCat.allCases, id: \.self) {
//                
//                category in
//                if let modelsByCategory = models.get(category: category) {
//                    
//                    if #available(iOS 14.0, *) {
//                        HorizontalGrid(showBrowse: $showBrowse, title: category.label, items: modelsByCategory)
//                    } else {
//                        // Fallback on earlier versions
//                    }
//                }
//            }
//        }
//    }
//    
//}
//
//@available(iOS 14.0, *)
//@available(iOS 14.0, *)
//struct HorizontalGrid: View {
//    
//    @EnvironmentObject var placeSettings: PlacementSettings
//    @Binding var showBrowse: Bool
//
//    
//    var title: String
//    var items: [TreeModel]
//    
//    private let gridItemLayout = [GridItem(.fixed(150))]
//    
//    var body: some View {
//        
//        VStack(alignment: .leading) {
//            
//            Text(title)
//                .font(.title2).bold()
//                .padding(.leading, 22)
//                .padding(.top, 22)
//            
//            ScrollView(.horizontal, showsIndicators: false ) {
//                
//                LazyHGrid(rows: gridItemLayout, spacing: 30) {
//                    
//                    ForEach(0..<items.count) { index in
//                        
////                        Color(UIColor.secondarySystemFill)
////                            .frame(width: 150, height: 150)
////                            .cornerRadius(8)
//                        
//                        let model = items[index]
//                        
//                        ItemButton(model: model) {
//                            
//                            //async load
//                            
//                            model.asyncLoadModelEntity()
//                            //select model for placement
//                            self.placeSettings.selectModel = model
//                            
//                            print("Item selected")
//                            self.showBrowse = false
//                        }
//
//                    }
//                }
//                .padding(.horizontal, 22)
//                .padding(.vertical, 10)
//            }
//            
//        }
//    }
//}
//
//struct ItemButton: View {
//    
//    let model : TreeModel
//    let action: () -> Void
//    
//    var body: some View {
//        
//        Button(action: {
//            
//            self.action()
//        }) {
//            
//            Image(uiImage: self.model.thumb)
//                .resizable()
//                .frame(height: 150)
//                .aspectRatio(1/1, contentMode: .fit)
//                .background(Color(UIColor.secondarySystemFill))
//                .cornerRadius(8.0)
//        }
//    }
//}
