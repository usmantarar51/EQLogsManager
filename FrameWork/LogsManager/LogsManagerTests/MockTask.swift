//
//  MockTask.swift
//  LogsManagerTests
//
//  Created by Usman Tarar on 3/14/21.
//

@testable import LogsManager
import UIKit

class MockTask {
    private let result: [String: Any]?
    private let error: Error?

    var callback: ([String: Any]?, Error?) -> Void
    init(result: [String: Any]?, error: Error?) {
        self.result = result
        self.error = error
    }

    func resume() {
        DispatchQueue.main.async {
            self.callback(self.result, self.error)
        }
    }
}
