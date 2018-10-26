//
//  ViewController.swift
//  TestKingfisherImageCache1026
//
//  Created by Yuan Zhou on 2018/10/26.
//  Copyright © 2018 Brightcove K.K. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urls = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: nil)
        if let urls = urls {
            NSLog("urls count: \(urls.count)")
            
            let imageCache = ImageCache(name: "SharedTempCache")
            // https://github.com/onevcat/Kingfisher/issues/538#issuecomment-266633887
            imageCache.maxMemoryCost = 10
            
            let queue = DispatchQueue.global()
            queue.async {
                NSLog("Start")
                for url in urls {
                    // put image.pngData() into an autoreleasepool block to prevent app consumes crash-tend memory in iOS 10.3.3
                    autoreleasepool {
                        if let image = UIImage(contentsOfFile: url.path),
                           let imageData = image.pngData() {
                            NSLog("store file:\(url.path) into cache")
                            imageCache.store(image, original: imageData, forKey: url.path) {
                                NSLog("\(url.path) is stored in cache")
                                
                                if urls.lastIndex(of: url) == urls.count - 1 {
                                    print("cache completed")
                                }
                            }
                        }
                    }
                }
            }
        } else {
            print("urls is nil")
        }
    }
}

