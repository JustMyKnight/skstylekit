//
//    Copyright (c) 2016 Mikhail Motylev https://twitter.com/mikhail_motylev
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import XCTest
import UIKit
@testable import SKStyleKit

class SKFontStyleTests: XCTestCase {
    
    @available(iOS 8.2, *)
    func testWeight() {
        
        // given
        let styles = ["ultraLight", "Thin", "light", "regULar", "medium", "seMibold", "bold", "heavy", "black"]
        let expectedWeights: [UIFont.Weight] = [.ultraLight,
                                                .thin,
                                                .light,
                                                .regular,
                                                .medium,
                                                .semibold,
                                                .bold,
                                                .heavy,
                                                .black]
        
        // when
        let weights = styles.compactMap({ SKFontStyle.from(rawValue: $0)?.weight })
        
        // then
        XCTAssertEqual(expectedWeights, weights)
    }
    
    func testInitWithNil() {
        
        // when
        let fontStyle = SKFontStyle.from(rawValue: nil)
        
        // then
        XCTAssertNil(fontStyle)
    }
    
    
    func testSystemFontGet() {
        
        if #available(iOS 8.2, *) {
        
            // given
            let styles = ["ultraLight", "Thin", "light", "regULar", "medium", "heavy", "black", "italic", "bold"]
            let fontSize: CGFloat = 15
            let expectedWeights: [UIFont.Weight] = [.ultraLight,
                                                    .thin,
                                                    .light,
                                                    .regular,
                                                    .medium,
                                                    .heavy,
                                                    .black]
            var expectedFonts = expectedWeights.map({ UIFont.systemFont(ofSize: fontSize, weight: $0) })
            expectedFonts.append(UIFont.italicSystemFont(ofSize: fontSize))
            expectedFonts.append(UIFont.boldSystemFont(ofSize: fontSize))
            
            // when
            let fonts = styles.compactMap({ SKFontStyle.from(rawValue: $0)?.systemFont(ofSize: fontSize) })
            
            // then
            XCTAssertEqual(fonts, expectedFonts)
            
        } else {
            
            // given
            let styles = ["ultraLight", "Thin", "light", "regULar", "medium", "heavy", "black", "italic", "bold"]
            let fontSize: CGFloat = 15
            let expectedWeights: [UIFont.Weight] = [.ultraLight,
                                                    .thin,
                                                    .light,
                                                    .regular,
                                                    .medium,
                                                    .heavy,
                                                    .black]
            var expectedFonts = expectedWeights.map({ _ in UIFont.systemFont(ofSize: fontSize) })
            expectedFonts.append(UIFont.italicSystemFont(ofSize: fontSize))
            expectedFonts.append(UIFont.boldSystemFont(ofSize: fontSize))
            
            // when
            let fonts = styles.flatMap({ SKFontStyle.from(rawValue: $0)?.systemFont(ofSize: fontSize) })
            
            // then
            XCTAssertEqual(fonts, expectedFonts)
        }
    }
}
