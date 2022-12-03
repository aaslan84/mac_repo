//
//  popupSheet.swift
//  DrinkWater
//
//  Created by aslan on 29.05.2022.
//

import SwiftUI

struct popupSheet: View {
    @State var showSheet: Bool = false
    var body: some View {
        NavigationView {
            Button {
                showSheet.toggle()
            } label: {
                Text("Present Sheet")
            }
            .navigationTitle("Half Modal Sheet")
            .cupAddSheet(showSheet: $showSheet) {
                // Our Half Sheet View ...
                Text("This is Half Sheet")
                    .font(.title.bold())
            } onEnd: {
                print("Dismissed")
            }
        }
    }
}

struct popupSheet_Previews: PreviewProvider {
    static var previews: some View {
        popupSheet()
    }
}

// Custom Half Sheet Modifier ...
extension View {
    // Binding Show Variable ...
    func cupAddSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView, onEnd: @escaping ()->())->some View {
        
        // why we using overlay
        // because it will automatically use the swiftUI frame size only ...
        return self
            .background(
                cupAddSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd)
            )
    }
}

// UIKit Integration ...
struct cupAddSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: ()->()
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if showSheet{
            // Presenting Modal View ...
            let sheetController = CustomHostingController(rootView: sheetView)
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
        else {
            // closing view when showSeet toggle again
            
        }
    }
    
    // On dismiss ...
    class Coordinator: NSObject,UISheetPresentationControllerDelegate{
        var parent: cupAddSheetHelper
        
        init(parent: cupAddSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController){
            parent.onEnd()
        }
    }
}

// Custom UIHostingController for halfSheet ...
class CustomHostingController<Content: View>: UIHostingController<Content>{
    override func viewDidLoad() {
        // setting presentation controller properties ...
        if let presentationController = presentationController as?
            UISheetPresentationController{
            presentationController.detents = [
                .medium()
                //.large()
            ]
        }
    }
}
