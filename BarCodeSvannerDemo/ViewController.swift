//
//  ViewController.swift
//  BarCodeSvannerDemo
//
//  Created by Катя Смолякова on 3/6/18.
//  Copyright © 2018 Катя Смолякова. All rights reserved.
//

import UIKit
import BarcodeScanner

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func scanAction(_ sender: Any) {
        
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        
        present(viewController, animated: true, completion: nil)
    }
}
    
extension ViewController : BarcodeScannerCodeDelegate {
            func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
               guard let url = URL(string: "http://ean13.info/\(code).htm") else
               {return}
                webView.loadRequest(URLRequest(url: url))
                
            }
        }

    
    
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

