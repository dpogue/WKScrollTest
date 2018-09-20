//
//  ViewController.swift
//  WKScrollTest
//
//  Created by Darryl Pogue on 2017-01-24.
//  Copyright © 2017 Darryl Pogue. All rights reserved.
//

import UIKit
import WebKit

let USE_UIWEBVIEW = false; // false, or true

class ViewController: UIViewController {
    
    @IBOutlet var containerView : UIView! = nil
    var webView: WKWebView?
    var oldView: UIWebView?

    override func loadView() {
        super.loadView()
        
        if (USE_UIWEBVIEW) {
            self.oldView = UIWebView()
            self.oldView!.scrollView.bounces = false;
            self.view = self.oldView!
        } else {
            self.webView = WKWebView()
            self.webView!.scrollView.bounces = false;
            self.view = self.webView!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doc = ["<!DOCTYPE html>",
                   "<html>",
                   " <head>",
                   "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover\">",
                   "  <style>",
                   "   * { box-sizing: border-box; }",
                   "   html { font: -apple-system-body; height: 100vh; background: lime; }",
                   /* Apologies for my horrific choice of colours! */
                   "   body { font-family: -apple-system; font-size: 1.25em; padding: 0; padding-top: env(safe-area-inset-top, 20px); padding-bottom: env(safe-area-inset-bottom, 0px); margin: 0; height: 100%; background: linear-gradient(to bottom, red, blue) no-repeat; color: white; }",
                   "   p { padding: 0.5em 1em; }",
                   "   input { font-size: 0.75em; }",
                   "  </style>",
                   " </head>",
                   " <body>",
                   "  <p><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</b><br><br>Nunc felis sapien, laoreet in nibh sed, finibus dapibus augue. Morbi risus nisl, mattis eget velit vitae, tristique malesuada velit. Duis elementum vulputate iaculis. Nunc id erat ultrices, eleifend eros nec, sodales nisl. Praesent at justo mi.</p>",
                   "  <input type=\"email\">",
                   " </body>",
                   "</html>"];
        
        if (USE_UIWEBVIEW) {
            self.oldView!.loadHTMLString(doc.joined(separator:"\n"), baseURL: nil);
        } else {
            self.webView!.loadHTMLString(doc.joined(separator:"\n"), baseURL: nil);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

