//
//  ViewController.swift
//  WKScrollTest
//
//  Created by Darryl Pogue on 2016-06-02.
//  Copyright © 2016 Darryl Pogue. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var containerView : UIView! = nil
    var webView: WKWebView?

    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.webView!.scrollView.bounces = false;
        self.view = self.webView!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var doc = ["<!DOCTYPE html>",
                   "<html>",
                   " <head>",
                   "  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\">",
                   "  <style>",
                   "   header { position: fixed; height: 50px; padding-top: 30px; width: 100%; top: 0; left: 0; background: lightsteelblue; text-align: center; }",
                   "   p { margin-top: 80px; }",
                   "  </style>",
                   "  <script>",
                   "   function logClick() { console.log('Clicked the Button'); }",
                   "  </script>",
                   " </head>",
                   " <body>",
                   "  <header>",
                   "   <button onclick=\"logClick()\">Hello World</button>",
                   "  </header>",
                   "  <p>",
                   "   <b>WKWebView position:fixed scroll bug</b>",
                   "   <br><br>",
                   "   To trigger this bug, scroll down the page slightly and stop. Then scroll up as if you were going to scroll beyond the top of the page. Then try to click the button in the fixed position header.",
                   "   <br>",
                   "   If you connect the Safari inspector and look at the header element, you can see that its logical position for interaction purposes does not match where it is visually drawn on the page. The visual position is correct.",
                   "  </p>",
                   "  <ul>"];
        
        for idx in 1...100 {
            doc.append("<li>List item \(idx)</li>");
        }
        
        let webContent = doc.joinWithSeparator("\n") + "</ul></body></html>";

        self.webView!.loadHTMLString(webContent, baseURL: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

