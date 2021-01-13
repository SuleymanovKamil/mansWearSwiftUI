//
//  Extensions.swift
//  mrKingsman
//
//  Created by Камиль  Сулейманов on 07.01.2021.
//

import SwiftUI

let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width
let small = UIScreen.main.bounds.height < 750


struct BlurView : UIViewRepresentable {
    
    var style : UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}



struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            let pt1 = CGPoint(x: rect.width, y: rect.height - 80)
            let pt2 = CGPoint(x: 0, y: 0)
            let pt3 = CGPoint(x: 0, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y: rect.height)
            
            // setting last point as start...
            // since it ends at last...
            
            path.move(to: pt4)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 30)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 30)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 30)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 30)
        }
    }
}


struct CustomShape2: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            let pt1 = CGPoint(x: rect.width, y: 150)
            let pt2 = CGPoint(x: 0, y: 350)
            let pt3 = CGPoint(x: 0, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y: rect.height)
            
            path.move(to: pt4)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 30)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 80)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 30)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 30)
        }
    }
}


struct CustomCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        
        return Path(path.cgPath)
    }
}
