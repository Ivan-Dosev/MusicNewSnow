//
//  ContentView.swift
//  MusicNewSnow
//
//  Created by Ivan Dimitrov on 8.12.20.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var scene : SKScene {

        let scene = LoveScene()
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }
    
    var sceneGasenik : SKScene {

        let scene = GasenikScene()
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }
    
    
    @State var taraleg : Bool = false
    @State var gasenik : Bool = false
 
    
    var body: some View {
        ZStack {
        
            if taraleg {
                SpriteView(scene: scene)
                  .background(Color.clear)
                    .frame(width: 480, height: 680, alignment: .center)
                    .disabled(false)
            }
            
            if gasenik {
                SpriteView(scene: sceneGasenik)
                  .background(Color.clear)
                    .frame(width: 480, height: 680, alignment: .center)
                    .disabled(false)
            }

            VStack {
                Button(action: {
                    self.taraleg = true
                    self.gasenik = false
                   
                }) {
                    
                    Text("Taraleg")
                        .padding()
                        .background(
                            ZStack {
                                Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4.0)
                                    .offset(x: -8.0, y: -8.0) })
                
                         .foregroundColor(.gray)
                         .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                         .shadow(color: Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255), radius: 20, x: 20.0  , y:  20.0)
                         .shadow(color: Color.white, radius: 20, x: -20.0 , y: -20.0)
                    
                    
                    
                    Button(action: {
                        self.taraleg = false
                        self.gasenik = true
                    
                    }) {
                        
                        Text("Gsenik")
                            .padding()
                            .background(
                                ZStack {
                                    Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .foregroundColor(.white)
                                        .blur(radius: 4.0)
                                        .offset(x: -8.0, y: -8.0) })
                    
                             .foregroundColor(.gray)
                             .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                             .shadow(color: Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255), radius: 20, x: 20.0  , y:  20.0)
                             .shadow(color: Color.white, radius: 20, x: -20.0 , y: -20.0)
            }

                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class LoveScene: SKScene {
    override func didMove(to view: SKView) {
       super.didMove(to: view)


     if let   emitter: SKEmitterNode = SKEmitterNode(fileNamed: "Gasenic") {
              emitter.particleTexture = SKTexture(imageNamed: "taraleg")
              emitter.setScale(0.001)
              emitter.position = CGPoint(x: frame.midX, y: frame.maxY)
              emitter.alpha = 1
     addChild(emitter)
   
            emitter.run(SKAction.fadeIn(withDuration: 0.5)) {
                emitter.run(SKAction.fadeOut(withDuration: 5.0)) {
                    emitter.removeFromParent()

                }
            }
        }
    }

}

    class GasenikScene: SKScene {
        override func didMove(to view: SKView) {
           super.didMove(to: view)


         if let   emitter: SKEmitterNode = SKEmitterNode(fileNamed: "Gasenic") {
                  emitter.particleTexture = SKTexture(imageNamed: "gasenik")
                  emitter.setScale(0.001)
                  emitter.position = CGPoint(x: frame.midX, y: frame.maxY)
                  emitter.alpha = 1
         addChild(emitter)
       
                emitter.run(SKAction.fadeIn(withDuration: 0.5)) {
                    emitter.run(SKAction.fadeOut(withDuration: 5.0)) {
                        emitter.removeFromParent()
    
                    }
                }
            }
        }

    }
    
}






