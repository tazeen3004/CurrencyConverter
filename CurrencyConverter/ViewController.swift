//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Tazeen on 16/02/17.
//  Copyright © 2017 Tazeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var  myCurrency:[String] = []
    var  myValues:[Double] = []
    var activeCurrency:Double = 0
    
    //objects
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var output: UILabel!
    
    //CREATING PICKER VIEW
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
    
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return myCurrency.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return myCurrency[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
            activeCurrency = myValues[row]
    }
    
    //button
    
    @IBAction func action(_ sender: Any)
    {
        if (input.text != "")
        {
        output.text = String(Double(input.text!)! * activeCurrency)
        }
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            //getting data
            let url = URL(string: "http://api.fixer.io/latest")
            
            let task = URLSession.shared.dataTask(with:url!) { (data, response, error) in
                
                if (error != nil)
                {
                    print("ERROR")
                }
                else
                {
                    if let content = data
                    {
                        do
                        {
                            
                            let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            if let rates = myJson["rates"] as? NSDictionary
                            {
                              for (key, value) in rates
                              {
                                self.myCurrency.append((key as? String)!)
                                self.myValues.append((value as? Double)!)
                                }
                           
                            }
                        }
                            
                        catch
                        {
                            
                        }
                    }
                    
                }
                self.pickerView.reloadAllComponents()
            }
            task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

