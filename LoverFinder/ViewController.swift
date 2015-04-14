//
//  ViewController.swift
//  LoverFinder
//
//  Created by chad on 15/4/12.
//  Copyright (c) 2015年 chad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var heightText: UILabel!
    
    @IBOutlet weak var hasHouse: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        name.resignFirstResponder();
        return true;
    }
    
    @IBAction func sliderDidChange(sender: AnyObject) {
        var slider = sender as UISlider
        var i = Int(slider.value)
        slider.value = Float(i)
        heightText.text = "\(i)厘米"
    }
    
    @IBAction func okDidTap(sender: AnyObject) {
        
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅":"白富美";
        let hasHouseText = hasHouse.on ? "有房":"无房"
        let heightString = heightText.text!
        if name.text == "" {
            name.text = "无名氏"
        }
        
        /*let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian);
        let now = NSDate();
        let componnets = gregorian.components(NSCalendarUnit.YearCalendarUnit, fromDate: birthday.date, toData: now, options:NSCalendarOptions(0));
        let age = components.year;
        */
        //let birthYear = 0
        //let nowYear = 0
        
        //计算年龄：获取年份转换为数字进行减法计算
        let now = NSDate();
        var nowString = now.description
        let index2 = advance(nowString.startIndex,4)
        var nowYear = nowString.substringToIndex(index2).toInt()
        
        var birthdayString = birthday.date.description
        let index = advance(birthdayString.startIndex,4)
        var birthYear = birthdayString.substringToIndex(index).toInt()
        
        var age = nowYear! - birthYear!
        
        
        result.text = "\(name.text), \(age)岁, \(genderText), 身高\(heightString), \(hasHouseText), 求交往！"
    }

}

