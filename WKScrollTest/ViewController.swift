//
//  ViewController.swift
//  WKScrollTest
//
//  Created by Darryl Pogue on 2017-01-24.
//  Copyright © 2017 Darryl Pogue. All rights reserved.
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
        
        let doc = ["<!DOCTYPE html>",
                   "<html>",
                   " <head>",
                   "  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0\">",
                   "  <style>",
                   "   body { font-family: -apple-system; font-size: 1.25em; padding-top: 80px; padding-bottom: 50px; }",
                   "   header { position: fixed; height: 50px; padding-top: 30px; width: 100%; top: 0; left: 0; background: lightsteelblue; text-align: center; }",
                   "   footer { position: fixed; height: 30px; width: 100%; bottom: 0; left: 0; background: steelblue; text-align: center; }",
                   "  </style>",
                   "  <script>",
                   "   function logClick() { navigator.geolocation.getCurrentPosition(); }",
                   "  </script>",
                   " </head>",
                   " <body>",
                   "  <header>",
                   "   <input id=\"headerInput\" type=\"text\" />",
                   "  </header>",
                   "  <footer>",
                   "   <input id=\"footerInput\" type=\"text\" />",
                   "  </footer>",
                   "  <p>",
                   "   <b>WKWebView position:fixed input focus scrolling</b>",
                   "   <br><br>",
                   "   This is a test page with a fixed position header for testing the behaviour of input focus scrolling in combination with position fixed elements in the new Visual Viewport model in WKWebView.",
                   "  </p>",
                   "  <ol>",
                   "   <li><h3>💚 Test Case 1:</h3>",
                   "    <p>Scroll down the page. Tap the input element in the header. With the keyboard overlay shown, scroll up the page. The fixed position header should remain attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 2:</h3>",
                   "    <p>Tap the input element in the header. With the keyboard overlay shown, scroll down the page. The fixed position header should remain attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 3:</h3>",
                   "    <p>Tap the input element here:<br><input type=\"text\" /><br> When the keyboard is shown, the fixed position header should remain attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 4:</h3>",
                   "    <p>Tap the input element in the footer. When the keyboard is shown, the fixed position header should remain attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💚 Test Case 5:</h3>",
                   "    <p>Tap the input element in the footer. With the keyboard overlay shown, scroll down the page. The fixed position footer should remain attached to the bottom of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 6:</h3>",
                   "    <p>Tap the input element in the footer. With the keyboard overlay shown, scroll up the page. The fixed position footer should remain attached to the bottom of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 7:</h3>",
                   "    <p>Tap the input element here:<br><input type=\"text\" /><br> When the keyboard is shown, the fixed position footer should remain attached to the bottom of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 8:</h3>",
                   "    <p>Tap the input element in the header. When the keyboard is shown, the fixed position footer should remain attached to the bottom of the screen.</p>",
                   "   </li>",
                   "  </ol>",
                   " </body>",
                   "</html>"];

        self.webView!.loadHTMLString(doc.joined(separator:"\n"), baseURL: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

