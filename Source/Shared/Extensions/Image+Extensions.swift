//
//  Image+Extensions.swift
//  Cache-iOS
//
//  Created by Kim Youngmin on 2020/02/05.
//  Copyright © 2020 Hyper Interaktiv AS. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

#if os(iOS) || os(tvOS)

    /// Helper UIImage extension.
    extension UIImage {
        /// Checks if image has alpha component
        var hasAlpha: Bool {
            let result: Bool

            guard let alpha = cgImage?.alphaInfo else {
                return false
            }

            switch alpha {
            case .none, .noneSkipFirst, .noneSkipLast:
                result = false
            default:
                result = true
            }

            return result
        }

        /// Convert to data
        var data: Data? {
            return hasAlpha ? pngData() : jpegData(compressionQuality: 1.0)
        }
    }

#elseif os(OSX)

    /// Helper UIImage extension.
    extension NSImage {
        /// Checks if image has alpha component
        var hasAlpha: Bool {
            var imageRect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

            guard let imageRef = cgImage(forProposedRect: &imageRect, context: nil, hints: nil) else {
                return false
            }

            let result: Bool
            let alpha = imageRef.alphaInfo

            switch alpha {
            case .none, .noneSkipFirst, .noneSkipLast:
                result = false
            default:
                result = true
            }

            return result
        }

        /// Convert to data
        var data: Data? {
            guard let data = tiffRepresentation else {
                return nil
            }

            let imageFileType: NSBitmapImageRep.FileType = hasAlpha ? .png : .jpeg
            return NSBitmapImageRep(data: data)?
                .representation(using: imageFileType, properties: [:])
        }
    }

#endif
