//
//  AnimationViewController.swift
//  colorPlay
//
//  Created by 李世文 on 2020/7/25.
//

import UIKit
import SpriteKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定image播放
        let gastlyAnimatedImage = UIImage.animatedImageNamed("60da847995dd4c15a93bc279af58e1c0xO1CPVUthSsOradC-", duration: 7)
        let gastlyAnimatedImageView = UIImageView(frame: CGRect(x: 40, y: 200, width: 300, height: 300))
        gastlyAnimatedImageView.image = gastlyAnimatedImage
        gastlyAnimatedImageView.contentMode = .scaleAspectFit
        view.addSubview(gastlyAnimatedImageView)
        
        //加入粒子效果
        let skView = SKView(frame: view.frame)
        view.insertSubview(skView, at: 0)
        
        let scene = SKScene(size: skView.frame.size)
        scene.backgroundColor = UIColor.clear
        skView.presentScene(scene)
        
        let emitterNode = SKEmitterNode(fileNamed: "MagicParticle.sks")
        scene.addChild(emitterNode!)
        
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
