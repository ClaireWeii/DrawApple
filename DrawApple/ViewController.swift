//
//  ViewController.swift
//  DrawApple
//
//  Created by Wei Pan on 2023/1/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shapeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var fruitSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var multiFruitSwitch: UISwitch!
    @IBOutlet weak var numberSlider: UISlider!
    
    
    var content = ""
    var number = 1
    let fruitImages = ["🍎", "🍊", "🍋", "🥝", "🫐"]
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    

        
        
    }
    
    func square() {
        for _ in 1...number {
            for _ in 1...number {
                content += fruitImages[imageIndex]
            }
            content += "\n"
        }
        fruitLabel.text = content
    }
    
    func multiSquare() {
        for i in 1...number {
            for _ in 1...number {
                content += fruitImages[i-1]
            }
            content += "\n"
        }
        fruitLabel.text = content
    }
        
    func triangle(){
        for i in 1...number {
            for _ in 1...i {
                content += fruitImages[imageIndex]
            }
            content += "\n"
        }
        fruitLabel.text = content
    }
    
    func multiTriangle(){
        for i in 1...number {
            for _ in 1...i {
                content += fruitImages[i-1]
            }
            content += "\n"
        }
        fruitLabel.text = content
    }
    
    func pyramid(){
        for i in (1...number).reversed() {
            for _ in stride(from: i, to: 1, by: -1) {
                content += "🖤"
            }
            for _ in 1...2*number+1-2*i {
                content += fruitImages[imageIndex]
            }
            content += "\n"
        }
        fruitLabel.text = content
    }
    
    func multiPyramid(){
        for i in (1...number).reversed() {
            for _ in stride(from: i, to: 1, by: -1) {
                content += "🖤"
            }
            for _ in 1...2*number+1-2*i {
                content += fruitImages[i-1]
            }
            content += "\n"
        }
        fruitLabel.text = content
    }
    
    func rhombus(){
        for i in (1...number).reversed() {
            for _ in stride(from: i, to: 1, by: -1) {
                content += "🖤"
            }
            for _ in 1...2*number+1-2*i {
                content += fruitImages[imageIndex]
            }
            content += "\n"
        }
        if number > 2 {
            for i in 1...number-1 {
                for _ in 1...i {
                    content += "🖤"
                }
                for _ in 1...2*number-1-2*i {
                    content += fruitImages[imageIndex]
                }
                content += "\n"
        }
        }
        fruitLabel.text = content
    }
    
    func multiRhombus(){
        for i in (1...number).reversed() {
            for _ in stride(from: i, to: 1, by: -1) {
                content += "🖤"
            }
            for _ in 1...2*number+1-2*i {
                content += fruitImages[i-1]
            }
            content += "\n"
        }
        if number > 2 {
            for i in 1...number-1 {
                for _ in 1...i {
                    content += "🖤"
                }
                for _ in 1...2*number-1-2*i {
                    content += fruitImages[i]
                }
                content += "\n"
        }
        }
        fruitLabel.text = content
    }
    
    func changeShape(){
        switch shapeSegmentedControl.selectedSegmentIndex {
        case 0 :
            content = ""
            square()
        case 1 :
            content = ""
            triangle()
        case 2 :
            content = ""
            pyramid()
        case 3 :
            content = ""
            rhombus()
        default:
            break
        }
    }
    
    func changeShapeInMulti(){
        switch shapeSegmentedControl.selectedSegmentIndex {
        case 0 :
            content = ""
            multiSquare()
        case 1 :
            content = ""
            multiTriangle()
        case 2 :
            content = ""
            multiPyramid()
        case 3 :
            content = ""
            multiRhombus()
        default:
            break
        }
    }
    
    @IBAction func changeFruit(_ sender: Any) {
        
        if multiFruitSwitch.isOn == false {
            fruitSegmentedControl.isEnabled == true
            switch fruitSegmentedControl.selectedSegmentIndex {
            case 0 :
                imageIndex = 0
            case 1 :
                imageIndex = 1
            case 2 :
                imageIndex = 2
            case 3 :
                imageIndex = 3
            case 4 :
                imageIndex = 4
            default:
                break
            }
            changeShape()
        } else {
            fruitSegmentedControl.isEnabled == false
        }
        
    }
    
    @IBAction func changeShape(_ sender: Any) {
        
        if multiFruitSwitch.isOn {
            changeShapeInMulti()
        } else {
            changeShape()
        }
    }
    
    @IBAction func changeMultiFruit(_ sender: Any) {
        
        if multiFruitSwitch.isOn == true {
            fruitSegmentedControl.isEnabled == false
            changeShapeInMulti()
        } else {
            fruitSegmentedControl.isEnabled == true
            changeShape()
        }
    }
    
    @IBAction func changeNumber(_ sender: UISlider) {
        
        sender.value = sender.value.rounded()
        number = Int(sender.value)
        numberLabel.text = "\(number)"
        
        if multiFruitSwitch.isOn == true {
            changeShapeInMulti()
        } else {
            changeShape()
        }
        
    }
    
    @IBAction func resetAll(_ sender: Any) {

        shapeSegmentedControl.selectedSegmentIndex = 0
        fruitSegmentedControl.selectedSegmentIndex = 0
        multiFruitSwitch.isOn = false
        numberSlider.value = 1
        number = 1
        imageIndex = 0
        fruitLabel.text = "🍎"
        numberLabel.text = "1"

    }
    
}

