//
//  MainViewController.swift
//  HW11 Roulette
//
//  Created by 沈庭鋒 on 2023/4/5.
//

import UIKit

class MainViewController: UIViewController {

    var randomNumber = 0
    var myMoney = 1000{
        didSet{
            moneyLabel.text = "Money : \(myMoney)"
        }
    }
    var myChooseNumber = [Int]()
    var index = 0
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet var numberButtonsOutlet: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moneyLabel.text = "Money : \(myMoney)"
        
    }
    
    
    @IBAction func raiseButton(_ sender: UIButton) {
        switch sender.tag{
        case 100:
            let array = [3,6,9,12,15,18,21,24,27,30,33,36]
            if sender.isSelected == false{
                myChooseNumber.append(contentsOf: array)
                sender.isSelected = true
                sender.setImage(UIImage(named: "chip"), for: .normal)
                myMoney -= 100
            }else{
                for i in 0...array.count-1{
                    myChooseNumber.removeAll(where: array.contains(_:))                }
                sender.isSelected = false
                sender.setImage(UIImage(systemName: ""), for: .normal)
                myMoney += 100
            }
            print(myChooseNumber)
        case 101:
            let array = [2,5,8,11,14,17,20,23,26,29,32,35]
            if sender.isSelected == false{
                myChooseNumber += array
                sender.isSelected = true
                sender.setImage(UIImage(named: "chip"), for: .normal)
                myMoney -= 100
            }else{
                myChooseNumber.removeAll(where: array.contains(_:))
                sender.isSelected = false
                sender.setImage(UIImage(systemName: ""), for: .normal)
                myMoney += 100
            }
            print(myChooseNumber)
        case 102:
            let array = [1,4,7,10,13,16,19,22,25,28,31,34]
            if sender.isSelected == false{
                myChooseNumber += array
                sender.isSelected = true
                sender.setImage(UIImage(named: "chip"), for: .normal)
                myMoney -= 100
            }else{
                myChooseNumber.removeAll(where: array.contains(_:))
                sender.isSelected = false
                sender.setImage(UIImage(systemName: ""), for: .normal)
                myMoney += 100
            }
            print(myChooseNumber)
            
        default:

            if sender.isSelected == false{
                sender.isSelected = true
                sender.setImage(UIImage(named: "chip"), for: .normal)
                myChooseNumber.append(sender.tag)
                myMoney -= 100
            }else{
                sender.isSelected = false
                sender.setImage(UIImage(systemName: ""), for: .normal)
                
                index = 0
              
      while myChooseNumber[index] != sender.tag{
        index += 1 }
                myChooseNumber.remove(at: index)
                myMoney += 100
                
            }
            print(myChooseNumber)
        }
        
    }
 
    @IBAction func playButton(_ sender: Any) {
        
        randomNumber = Int.random(in: 1...36)
        if myChooseNumber.contains(randomNumber){
            myMoney += 3600
        }
        for i in 0...numberButtonsOutlet.count-1{
            numberButtonsOutlet[i].setImage(UIImage(systemName: ""), for: .normal)
        }
        print(randomNumber)
        myChooseNumber = []
    }
    
}
