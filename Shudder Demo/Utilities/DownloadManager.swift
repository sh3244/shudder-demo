//
//  DownloadManager.swift
//  Shudder Demo
//
//  Created by Sam on 11/9/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Alamofire
import PromiseKit

class DownloadManager {
//    static let shared = DownloadManager()

    class func downloadSampleImage() -> Promise<UIImage?> {
        return Promise { fulfill, reject in
            Alamofire.request("https://via.placeholder.com/150", method: .get, parameters: nil).responseData { (data) in
                if let data = data.data {
                    fulfill(UIImage(data: data))
                } else {
                    reject(GenericError.error)
                }
            }
        }
    }

    // Use Flickr

    static let apiKey = "a1716a3b84f9b47a1e076191ce3d2bea"
    static let secret = "53e6fc3897a916f0"
}
