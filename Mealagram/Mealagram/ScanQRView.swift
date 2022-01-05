//
//  ScanQRView.swift
//  Mealagram
//
//  Created by Brandon Shaw on 9/3/21.
//

import SwiftUI
import CarBode

struct ScanQRView: View {
    @Binding var dimissView: Bool
    @Binding var foundUserId: String
    @Binding var showingOrderSheet: Bool
    @State var torchIsOn = false
    @State var foundUser = false

    var body: some View {
        //MARK: Scan View
        ZStack(alignment: .center) {
            ZStack(alignment: .bottomTrailing) {
                CBScanner(supportBarcode: .constant([.qr, .code128]), torchLightIsOn: self.$torchIsOn, scanInterval: .constant(0.5)) {
                    if self.foundUser == false {
                        UINotificationFeedbackGenerator().notificationOccurred(.success)
                        self.foundUserId = $0.value
                        self.foundUser = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            self.showingOrderSheet.toggle()
                        }
                        //print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
                        
                        print("have received incoming link!: \(String(describing: $0.value))")
                    }
                }
                .foregroundColor(Color("bgColor"))
                
                HStack {
                    Button(action: {
                        self.torchIsOn.toggle()
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                    }) {
                        ZStack {
                            BlurView(style: .systemUltraThinMaterial)
                                .frame(width: 50, height: 50)
                                .cornerRadius(15)
                                .foregroundColor(Color("bgColor"))
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            
                            Image(systemName: self.torchIsOn ? "lightbulb.fill" : "lightbulb.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.primary)
                                .frame(width: 25, height: 25, alignment: .center)
                        }
                    }.buttonStyle(MainButtonStyle())
                }.padding(.all, 10)
            }
            
            if self.foundUser {
                VStack {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55, height: 55, alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
                        .padding(.bottom, 10)
                    
                    Text("Found QR Code!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
                        
                    Text("redirecting shortly...")
                        .font(.subheadline)
                        .fontWeight(.none)
                        .foregroundColor(.white)
                        .opacity(0.8)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
                }.animation(.linear)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.foundUser = false
                        withAnimation {
                            self.dimissView.toggle()
                        }
                    }
                }
            }
        }
    }
}

