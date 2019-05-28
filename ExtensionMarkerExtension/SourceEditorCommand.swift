//
//  SourceEditorCommand.swift
//  ExtensionMarkerExtension
//
//  Created by Sven Jansen on 28.05.19.
//  Copyright © 2019 Cellular GmbH. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {

        let sourceLines = invocation.buffer.lines
        var newLines = [Any]()
        sourceLines.forEach({ line in
            if let stringLine = line as? String {
                if stringLine.contains("extension") {
                    let components = stringLine.split(separator: ":")
                    if let lastComponent = components.last {
                        let extensionName = lastComponent.replacingOccurrences(of: "{", with: "").replacingOccurrences(of: " ", with: "")
                        let markLine = "// MARK: - \(extensionName)"
                        if !(sourceLines.compactMap { $0 as? String }).contains(markLine) {
                            newLines.append("\(markLine)\n")
                        }
                    }
                }
            }
            newLines.append(line)
        })
        
        sourceLines.removeAllObjects()
        sourceLines.addObjects(from: newLines)
        completionHandler(nil)
    }
    
}
