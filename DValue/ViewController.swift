//
//  ViewController.swift
//  DValue
//
//  Created by weimi on 2017/9/21.
//  Copyright © 2017年 weimi. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kGrayColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)

class ViewController: UIViewController {
    
    let carPrice1 = UITextField()
    let carPrice2 = UITextField()
    let gasAmount1 = UITextField()
    let gasAmount2 = UITextField()
    var resultStr : String = String()
    
    let resultLbl = UILabel()
    let sureBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createSubviews()
    }
    
    func createSubviews() -> Void {
        let label1 = UILabel()
        label1.text = "车1的总价";
        label1.textColor = UIColor.black
        label1.frame = CGRect(x: 10, y: 50, width:100, height: 44)
        self.view.addSubview(label1)
        
        carPrice1.frame = CGRect(x: kScreenWidth - 150 - 10, y: 50, width: 150, height: 44)
        carPrice1.placeholder = "总价";
        carPrice1.backgroundColor = kGrayColor
        carPrice1.keyboardType = .decimalPad
        carPrice1.textAlignment = .center
        self.view.addSubview(carPrice1)
        
        let label2 = UILabel()
        label2.text = "车2的总价";
        label2.textColor = UIColor.black
        label2.frame = CGRect(x: 10, y: 100, width:100, height: 44)
        self.view.addSubview(label2)
        
        carPrice2.frame = CGRect(x: kScreenWidth - 150 - 10, y: 100, width: 150, height: 44)
        carPrice2.placeholder = "总价";
        carPrice2.textAlignment = .center
        carPrice2.backgroundColor = kGrayColor
        carPrice2.keyboardType = .decimalPad
        self.view.addSubview(carPrice2)
        
        let label3 = UILabel()
        label3.text = "车1的百公里油耗";
        label3.textColor = UIColor.black
        label3.frame = CGRect(x: 10, y: 150, width:150, height: 44)
        self.view.addSubview(label3)
        
        gasAmount1.frame = CGRect(x: kScreenWidth - 150 - 10, y: 150, width: 150, height: 44)
        gasAmount1.placeholder = "油耗";
        gasAmount1.textAlignment = .center
        gasAmount1.backgroundColor = kGrayColor
        gasAmount1.keyboardType = .decimalPad
        self.view.addSubview(gasAmount1)
        
        let label4 = UILabel()
        label4.text = "车2的百公里油耗";
        label4.textColor = UIColor.black
        label4.frame = CGRect(x: 10, y: 200, width:150, height: 44)
        self.view.addSubview(label4)
        
        gasAmount2.frame = CGRect(x: kScreenWidth - 150 - 10, y: 200, width: 150, height: 44)
        gasAmount2.placeholder = "油耗";
        gasAmount2.textAlignment = .center
        gasAmount2.backgroundColor = kGrayColor
        gasAmount2.keyboardType = .decimalPad
        self.view.addSubview(gasAmount2)
        
        resultLbl.frame = CGRect(x: 10, y: 250, width: kScreenWidth - 20, height: 100)
        resultLbl.numberOfLines = 0
        resultLbl.textColor = UIColor(red: 139/255.0, green: 180/255.0, blue: 78/255.0, alpha: 1.0)
        self.view.addSubview(resultLbl)
        
        //MARK:  BUTTON
        sureBtn.frame = CGRect(x: 15, y: 350, width: kScreenWidth - 30, height: 44)
        sureBtn.setTitle("计算", for: .normal)
        sureBtn.setTitleColor(.white, for: .normal)
        sureBtn.backgroundColor = UIColor(red: 0/255.0, green: 165/255.0, blue: 195/255.0, alpha: 1.0)
        sureBtn.layer.cornerRadius = 5
        sureBtn.layer.masksToBounds = true
        sureBtn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(sureBtn)
        
    }
    
    
    @objc func buttonClick() -> Void {
        NSLog("button Click")
        self.textfieldResigning()
        
        if !carPrice1.text!.isEmpty && !carPrice2.text!.isEmpty && !gasAmount1.text!.isEmpty && !gasAmount2.text!.isEmpty {
            self.calculate()
        }
    }

    /**
      *     计算临界值
      */
    func calculate() -> Void {
        let price1 = Float(carPrice1.text!)
        let price2 = Float(carPrice2.text!)
        let gas1 = Float(gasAmount1.text!)
        let gas2 = Float(gasAmount2.text!)
        var result: Float = 0.0
        result =  fabs(price1! - price2!) / fabs(gas1! - gas2!) / 6.27 / 100
        
        resultStr = String(format: "%.2f", result)
        if price1! > price2! {
            resultLbl.text = "当行驶距离小于 \(resultStr) 万公里时，car 2花费低， 大于时， car 2 花费高"
        }else {
            resultLbl.text = "当行驶距离小于 \(resultStr) 万公里时，car 1花费低， 大于时， car 1 花费高"
        }
        
        
    }
    
    func textfieldResigning() -> Void {
        carPrice1.resignFirstResponder()
        carPrice2.resignFirstResponder()
        gasAmount1.resignFirstResponder()
        gasAmount2.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //点击空白处失去第一响应
        self.textfieldResigning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

