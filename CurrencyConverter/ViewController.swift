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
    
    //objects
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var output: UILabel!
    
    //CREATING PICKER VIEW
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    
        return 1
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
            }
            task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

