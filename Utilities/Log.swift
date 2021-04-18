//
//  Log.swift
//  Ike
//
//  Created by Randy Hill on 11/26/20.
//

import Foundation
import SwiftUI

class Log {
    static private func log(_ message: String, filePath:String = #file, functionName:String = #function, line:Int = #line) {
        let timeStamp = Date().time() ?? ""
        let fileName = URL(fileURLWithPath: filePath).lastPathComponent
        let logMessage = "\(message)\n\(timeStamp), At: \(fileName):\(functionName), line \(line)\n"
        print(logMessage)
    }
    
	static func assert(_ isTrue: Bool, _ message: String = "", filePath:String = #file, functionName:String = #function, line:Int = #line) {
		if !isTrue {
            log("ASSERT FAILURE: \(message) ", filePath: filePath, functionName: functionName, line: line)
		}
	}
    
    static func error(_ message: String, filePath:String = #file, functionName:String = #function, line:Int = #line) {
        log("Error: \(message)", filePath: filePath, functionName: functionName, line: line)
    }
    
    static func exitApp(_ message: String, filePath:String = #file, functionName:String = #function, line:Int = #line) {
        log("Fatal error: \(message)", filePath: filePath, functionName: functionName, line: line)
        fatalError()
    }
    
    static func info(_ message: String, filePath:String = #file, functionName:String = #function, line:Int = #line) {
        log("\(message)", filePath: filePath, functionName: functionName, line: line)
    }
    
    static func console(_ value: Any, filePath:String = #file, functionName:String = #function, line:Int = #line) {
        log("\(value)", filePath: filePath, functionName: functionName, line: line)
    }
    
    static func isError(_ message: String, filePath:String = #file, functionName:String = #function, line:Int = #line) -> Bool {
        log(message, filePath: filePath, functionName: functionName, line: line)
        return true
    }
    
    static func threadCheck(shouldBeMain: Bool, message: String = "", filePath:String = #file, functionName:String = #function, line:Int = #line) {
        Log.assert(Thread.current.isMainThread == shouldBeMain, filePath: filePath, functionName: functionName, line: line)
    }
}

struct ViewError: View {
    var message: String
    var body: some View {
        EmptyView()
    }
    
    init(message: String, filePath:String = #file, functionName:String = #function, line:Int = #line) {
        self.message = message
        Log.error(message, filePath: filePath, functionName: functionName, line: line)
    }
}


