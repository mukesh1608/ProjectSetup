//
//  Logger.swift
//  ProjectSetup
//
//  Created by Mukesh_Taazaa on 15/05/21.
//  Copyright © 2021 Mukesh_Taazaa. All rights reserved.
//

import Foundation

import Foundation

/// This function is used for printing the logs in your console.
/// - Parameters:
///   - log: Description of log
///   - type: Pass the log type enum
///   - file: File Name
///   - function: Function Name
///   - line: Line Number
func printLOG(_ log: Any, type: LogType = .debug, _ file: String = #file, _ function: String = #function, _ line: Int = #line)  {
    #if DEBUG
        print("File: \(file) || Func: \(function) || Line: \(line)::=> \(log)");
    #endif
}

/// This have all the keys which has to passed in LogType.
///
/// - verbose: For the log of verbose type
/// - debug:  For the log of debug type
/// - info:  For the log of info type
/// - warning:For the log of warning type
/// - error: For the log of error type
enum LogType {
    case verbose
    case debug
    case info
    case warning
    case error
}
