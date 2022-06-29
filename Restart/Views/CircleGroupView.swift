//
//  CircleGroupView.swift
//  Restart
//
//  Created by John Michael Baldonado on 6/28/22.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var IsAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle().stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40).frame(width: 260, height: 260, alignment: .center)
            Circle().stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80).frame(width: 260, height: 260, alignment: .center)
        } //: Zstack
        .blur(radius: IsAnimating ? 0 : 10)
        .opacity(IsAnimating ? 1 : 0)
        .scaleEffect(IsAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: IsAnimating)
        .onAppear(perform: {
            IsAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
