//
//  GradientViewController.swift
//  colorPlay
//
//  Created by 李世文 on 2020/7/24.
//

import UIKit

class GradientViewController: UIViewController {

    
    @IBOutlet weak var gastlyGradientView: UIView!
    @IBOutlet weak var blockSegment: UISegmentedControl!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var alphaLockSwitch: UISwitch!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    let gastlyGradientLayer = CAGradientLayer()
    var topR:Float = 1
    var topG:Float = 90/255
    var topB:Float = 86/255
    var topA:Float = 1
    var secendR:Float = 10/255
    var secendG:Float = 234/255
    var secendB:Float = 1
    var secendA:Float = 1
    var thirdR:Float = 50/255
    var thirdG:Float = 1
    var thirdB:Float = 10/255
    var thirdA:Float = 1
    var bottonR:Float = 111/255
    var bottonG:Float = 87/255
    var bottonB:Float = 193/255
    var bottonA:Float = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //需要漸層的圖案
        let gastlyImage = UIImage(named: "GastlyGradient")
        let gastlyImageView = UIImageView(image: gastlyImage)
        gastlyImageView.frame = gastlyGradientView.bounds
        gastlyImageView.contentMode = .scaleAspectFill
        //漸層的Layer
        GradientSet()
        //漸層Layer丟進View的Layer
        gastlyGradientView.layer.addSublayer(gastlyGradientLayer)
        //需要漸層的圖案丟進View的mask
        gastlyGradientView.mask = gastlyImageView
        //蓋在最上面的圖案
        let bodyImage = UIImage(named: "body")
        let bodyImageView = UIImageView(image: bodyImage)
        bodyImageView.contentMode = .scaleAspectFill
        bodyImageView.frame = gastlyGradientView.bounds
        gastlyGradientView.addSubview(bodyImageView)
        
        //slider 初始值設定
        sliderValueSet(R: topR, G: topG, B: topB, A: topA)
    }
    
    @IBAction func blockChangeSegment(_ sender: UISegmentedControl) {
        let segmentNum = sender.selectedSegmentIndex
        if segmentNum == 0 {
            sliderValueSet(R: topR, G: topG, B: topB, A: topA)
        } else if segmentNum == 1 {
            sliderValueSet(R: secendR, G: secendG, B: secendB, A: secendA)
        } else if segmentNum == 2 {
            sliderValueSet(R: thirdR, G: thirdG, B: thirdB, A: thirdA)
        } else {
            sliderValueSet(R: bottonR, G: bottonG, B: bottonB, A: bottonA)
        }
    }
    
    @IBAction func colorChangeSlider(_ sender: UISlider) {
        let value = sender.value
        let blockNum = blockSegment.selectedSegmentIndex
        if blockNum == 0 {
            if sender == redSlider {
                topR = value
            } else if sender == greenSlider {
                topG = value
            } else if sender == blueSlider {
                topB = value
            } else if sender == alphaSlider{
                topA = value
            }
        } else if blockNum == 1 {
            if sender == redSlider {
                secendR = value
            } else if sender == greenSlider {
                secendG = value
            } else if sender == blueSlider {
                secendB = value
            } else if sender == alphaSlider{
                secendA = value
            }
        } else if blockNum == 2 {
            if sender == redSlider {
                thirdR = value
            } else if sender == greenSlider {
                thirdG = value
            } else if sender == blueSlider {
                thirdB = value
            } else if sender == alphaSlider{
                thirdA = value
            }
        } else {
            if sender == redSlider {
                bottonR = value
            } else if sender == greenSlider {
                bottonG = value
            } else if sender == blueSlider {
                bottonB = value
            } else if sender == alphaSlider{
                bottonA = value
            }
        }
        
        labelSetForSliderChange(uiSlider: sender)
        GradientSet()
    }
    
    @IBAction func randomButton(_ sender: Any) {
        let randomR = Float.random(in: 0...1)
        let randomG = Float.random(in: 0...1)
        let randomB = Float.random(in: 0...1)
        let randomA = Float.random(in: 0...1)
        
        let blockNum = blockSegment.selectedSegmentIndex
        let alphaLockStatus = alphaLockSwitch.isOn
        
        if blockNum == 0{
            topR = randomR
            topG = randomG
            topB = randomB
            if alphaLockStatus {
                topA = randomA
            }
            sliderValueSet(R: topR, G: topG, B: topB, A: topA)
        } else if blockNum == 1{
            secendR = randomR
            secendG = randomG
            secendB = randomB
            if alphaLockStatus {
                secendA = randomA
            }
            sliderValueSet(R: secendR, G: secendG, B: secendB, A: secendA)
        } else if blockNum == 2{
            thirdR = randomR
            thirdG = randomG
            thirdB = randomB
            if alphaLockStatus {
                thirdA = randomA
            }
            sliderValueSet(R: thirdR, G: thirdG, B: thirdB, A: thirdA)
        } else {
            bottonR = randomR
            bottonG = randomG
            bottonB = randomB
            if alphaLockStatus {
                bottonA = randomA
            }
            sliderValueSet(R: bottonR, G: bottonG, B: bottonB, A: bottonA)
        }
        
        GradientSet()
    }
    
    func GradientSet() {
        gastlyGradientLayer.frame = gastlyGradientView.bounds
        gastlyGradientLayer.locations = [0.2, 0.4, 0.6, 0.8]
        gastlyGradientLayer.colors = [UIColor(red: CGFloat(topR), green: CGFloat(topG), blue: CGFloat(topB), alpha: CGFloat(topA)).cgColor,UIColor(red: CGFloat(secendR), green: CGFloat(secendG), blue: CGFloat(secendB), alpha: CGFloat(secendA)).cgColor,UIColor(red: CGFloat(thirdR), green: CGFloat(thirdG), blue: CGFloat(thirdB), alpha: CGFloat(thirdA)).cgColor,UIColor(red: CGFloat(bottonR), green: CGFloat(bottonG), blue: CGFloat(bottonB), alpha: CGFloat(bottonA)).cgColor]
    }
    
    func sliderValueSet(R: Float, G: Float, B: Float, A: Float) {
        redSlider.setValue(R, animated: true)
        redLabel.text = String(format: "%.0f", R * 255)
        greenSlider.setValue(G, animated: true)
        greenLabel.text = String(format: "%.0f", G * 255)
        blueSlider.setValue(B, animated: true)
        blueLabel.text = String(format: "%.0f", B * 255)
        alphaSlider.setValue(A, animated: true)
        alphaLabel.text = String(format: "%.0f", A * 100) + "%"
    }
    
    func labelSetForSliderChange(uiSlider: UISlider){
        let value = uiSlider.value
        if uiSlider == redSlider {
            redLabel.text = String(format: "%.0f", value * 255)
        } else if uiSlider == greenSlider {
            greenLabel.text = String(format: "%.0f", value * 255)
        } else if uiSlider == blueSlider {
            blueLabel.text = String(format: "%.0f", value * 255)
        } else if uiSlider == alphaSlider{
            alphaLabel.text = String(format: "%.0f", value * 100) + "%"
        }
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
