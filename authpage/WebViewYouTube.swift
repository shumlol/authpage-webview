//
//  youtube.swift
//  authpage
//
//  Created by Вадим Ахматханов on 17.05.2023.
//

import UIKit
import WebKit

class WebViewYouTube: UITabBarController {

    @IBOutlet var YouTubeView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        WebViewYouTube.load(URLRequest(url: URL(string: "https://www.youtube.com/")!))

    }
    
}
