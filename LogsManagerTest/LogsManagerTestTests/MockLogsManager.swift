//
//  MockLogsManager.swift
//  LogsManagerTestTests
//
//  Created by Usman Tarar on 3/15/21.
//

import UIKit
import LogsManager

@testable import LogsManagerTest

open class MockLogsManager: LogsManager {
    private var payload: [String: Any]? = nil
    private var error: Error? = nil
    
    init(payload: [String: Any]? = nil, error: Error? = nil) {
        self.payload = payload
        self.error = error
    }
    
    open override func log(api: String, lat: Double = 0.0, lon: Double = 0.0, time: Int64 = 0, ext: String = "", callback: @escaping ([String : Any]?, Error?) -> Void) {
        self.payload?["url"] = api.isEmpty ? nil : api
        callback(payload, error)
    }
}
