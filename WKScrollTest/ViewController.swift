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
let VIEWPORT_FIT = "cover"; // "cover", "contain", or "auto"
let POSITION = "fixed"; // "fixed", or "sticky"

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
                   "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=\(VIEWPORT_FIT)\">",
                   "  <style>",
                   "   html { font: -apple-system-body; }",
                   "   body { font-family: -apple-system; font-size: 1.25em; padding-top: 2.5em; padding-bottom: 1.5em; margin: 0; padding: 0; }",
                   "   header { position: \(POSITION); height: 2.5em; padding-top: 30px; width: 100%; top: 0; left: 0; background: lightsteelblue; text-align: center; }",
                   "   footer { position: \(POSITION); height: 1.5em; width: 100%; bottom: 0; left: 0; background: steelblue; text-align: center; }",
                   "   p { padding: auto 1em; }",
                   "   input { font-size: 0.75em; }",
                   "  </style>",
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
                   "    <p>Scroll down the page. Tap the input element in the header. With the keyboard overlay shown, scroll up the page. The \(POSITION) position header should remain in position and attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 2:</h3>",
                   "    <p>Tap the input element in the header. With the keyboard overlay shown, scroll down the page. The \(POSITION) position header should remain in position and attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 3:</h3>",
                   "    <p>Tap the input element here:<br><input type=\"text\" /><br> When the keyboard is shown, the \(POSITION) position header should remain in position and attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 4:</h3>",
                   "    <p>Tap the input element in the footer. When the keyboard is shown, the \(POSITION) position header should remain in position and attached to the top of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💚 Test Case 5:</h3>",
                   "    <p>Tap the input element in the footer. With the keyboard overlay shown, scroll down the page. The \(POSITION) position footer should remain in position and attached to the bottom of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 6:</h3>",
                   "    <p>Tap the input element in the footer. With the keyboard overlay shown, scroll up the page. The \(POSITION) position footer should remain in position and attached to the bottom of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 7:</h3>",
                   "    <p>Tap the input element here:<br><input type=\"text\" /><br> When the keyboard is shown, the \(POSITION) position footer should remain in position and attached to the bottom of the screen.</p>",
                   "   </li>",
                   "   <li><h3>💔 Test Case 8:</h3>",
                   "    <p>Tap the input element in the header. When the keyboard is shown, the \(POSITION) position footer should remain in position and attached to the bottom of the screen.</p>",
                   "   </li>",
                   "  </ol>",
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

