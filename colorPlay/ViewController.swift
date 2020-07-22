//
//  ViewController.swift
//  colorPlay
//
//  Created by 李世文 on 2020/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var outsideView: UIView!
    
    @IBOutlet weak var inNoutSegment: UISegmentedControl!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var randomForAlphaSwitch: UISwitch!
    
    var bodyR:Float = 60/255
    var bodyG:Float = 78/255
    var bodyB:Float = 87/255
    var bodyA:Float = 1.0
    
    var outsideR:Float = 112/255
    var outsideG:Float = 78/255
    var outsideB:Float = 165/255
    var outsideA:Float = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var image = UIImage(named: "body")
        let bodyImageView = UIImageView(image: image)
        bodyImageView.frame = bodyView.bounds
        bodyImageView.contentMode = .scaleAspectFill
        bodyView.mask = bodyImageView
        bodyView.backgroundColor = UIColor(red: 60/255, green: 78/255, blue: 87/255, alpha: 1)
//        bodyView.backgroundColor = UIColor(red: 255/255, green: 78/255, blue: 0/255, alpha: 1)
        
        image = UIImage(named: "outside")
        let outsideImageView = UIImageView(image: image)
        outsideImageView.frame = outsideView.bounds
        outsideImageView.contentMode = .scaleAspectFill
        outsideView.mask = outsideImageView
        outsideView.backgroundColor = UIColor(red: 112/255, green: 78/255, blue: 165/255, alpha: 1)
//        outsideView.backgroundColor = UIColor(red: 0/255, green: 78/255, blue: 255/255, alpha: 1)
        
        redSlider.value = 60 / 255
        greenSlider.value = 78 / 255
        blueSlider.value = 87 / 255
        alphaSlider.value = 1
    }
    
    @IBAction func colorSliderChanged(_ sender: UISlider) {
        let inNoutNum = inNoutSegment.selectedSegmentIndex
        if inNoutNum == 0 {
            bodyR = redSlider.value
            bodyG = greenSlider.value
            bodyB = blueSlider.value
            bodyA = alphaSlider.value
            bodyView.backgroundColor = UIColor(red: CGFloat(bodyR), green: CGFloat(bodyG), blue: CGFloat(bodyB), alpha: CGFloat(bodyA))
        }else{
            outsideR = redSlider.value
            outsideG = greenSlider.value
            outsideB = blueSlider.value
            outsideA = alphaSlider.value
            outsideView.backgroundColor = UIColor(red: CGFloat(outsideR), green: CGFloat(outsideG), blue: CGFloat(outsideB), alpha: CGFloat(outsideA))
        }
        redLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        alphaLabel.text = String(format: "%.0f", alphaSlider.value * 100) + "%"
        
    }
    
    @IBAction func randomRGBA(_ sender: UIButton) {
        //宣告亂數RGBA
        let randomR = Float.random(in: 0.0...1.0)
        let randomG = Float.random(in: 0.0...1.0)
        let randomB = Float.random(in: 0.0...1.0)
        let randomA = Float.random(in: 0.0...1.0)
        let alphaSwitch = randomForAlphaSwitch.isOn
        var numAlpha = bodyView.backgroundColor?.cgColor.alpha
        
        if inNoutSegment.selectedSegmentIndex == 0 {
            bodyR = randomR
            bodyG = randomG
            bodyB = randomB
            //設定 body 的 Background Color
            if alphaSwitch {
                bodyA = randomA
                numAlpha = CGFloat(bodyA)
            }
            bodyView.backgroundColor = UIColor(red: CGFloat(bodyR), green: CGFloat(bodyG), blue: CGFloat(bodyB), alpha: CGFloat(numAlpha!))
            
        } else {
            outsideR = randomR
            outsideG = randomG
            outsideB = randomB
            //設定 outside 的 Background Color
            numAlpha = outsideView.backgroundColor?.cgColor.alpha
            if alphaSwitch {
                outsideA = randomA
                numAlpha = CGFloat(outsideA)
            }
            outsideView.backgroundColor = UIColor(red: CGFloat(outsideR), green: CGFloat(outsideG), blue: CGFloat(outsideB), alpha: CGFloat(numAlpha!))
        }
        //設定Slider
        redSlider.setValue(randomR, animated: true)
        greenSlider.setValue(randomG, animated: true)
        blueSlider.setValue(randomB, animated: true)
        if alphaSwitch {
            alphaSlider.setValue(randomA, animated: true)
        }
        
        //設定顯示的RGBA數值
        redLabel.text = String(format: "%.0f", randomR * 255)
        greenLabel.text = String(format: "%.0f", randomG * 255)
        blueLabel.text = String(format: "%.0f", randomB * 255)
        if alphaSwitch {
            alphaLabel.text = String(format: "%.0f", randomA * 100) + "%"
        }
 
    }
    
    @IBAction func inNoutSegmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            redSlider.setValue(bodyR, animated: true)
            greenSlider.setValue(bodyG, animated: true)
            blueSlider.setValue(bodyB, animated: true)
            alphaSlider.setValue(bodyA, animated: true)
            
            redLabel.text = String(format: "%.0f", bodyR * 255)
            greenLabel.text = String(format: "%.0f", bodyG * 255)
            blueLabel.text = String(format: "%.0f", bodyB * 255)
            alphaLabel.text = String(format: "%.0f", bodyA * 100) + "%"
        } else {
            redSlider.setValue(outsideR, animated: true)
            greenSlider.setValue(outsideG, animated: true)
            blueSlider.setValue(outsideB, animated: true)
            alphaSlider.setValue(outsideA, animated: true)
            
            redLabel.text = String(format: "%.0f", outsideR * 255)
            greenLabel.text = String(format: "%.0f", outsideG * 255)
            blueLabel.text = String(format: "%.0f", outsideB * 255)
            alphaLabel.text = String(format: "%.0f", outsideA * 100) + "%"
        }
    }
    
}

