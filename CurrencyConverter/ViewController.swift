//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Tazeen on 16/02/17.
//  Copyright © 2017 Tazeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
        override func viewDidLoad() {
        super.viewDidLoad()
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
                            print (myJson)
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

