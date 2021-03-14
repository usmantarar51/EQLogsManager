//
//  MockLogsManager.swift
//  LogsManagerTests
//
//  Created by Usman Tarar on 3/14/21.
//

import UIKit

class MockLogsManager: LogsManager {
    private var payload: [String: Any]? = nil
    private var error: Error? = nil
    
    init(payload: [String: Any]? = nil, error: Error? = nil) {
        self.payload = payload
        self.error = error
    }
    
    override func log(api: String, lat: Double = 0.0, lon: Double = 0.0, time: Int64 = 0, ext: String = "", callback: @escaping ([String : Any]?, Error?) -> Void) {
        self.payload?["url"] = api
        callback(payload, error)
    }
}
