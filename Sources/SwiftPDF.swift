//
//  SwiftPDF.swift
//  SwiftPDFGenerator
//
//  Created by Vigneshuvi on 28/02/17.
//  Copyright © 2017 vigneshuvi. All rights reserved.
//
import Foundation
import UIKit

//MARK: -  Extension for String to find length
extension String {
    var length: Int {
        return self.characters.count
    }
}


//MARK: -  SwiftPDF Class
import UIKit

class SwiftPDF: NSObject {
    
    override init() {
        super.init()
    }
    
    func exportHTMLContentToPDF(fileName: String, HTMLContent: String, header : String, footer: String) -> String {
        let printPageRenderer = UviPrintPageRenderer()
        if !header.isEmpty && header.length > 0 {
            printPageRenderer.headerText = header
        }
        
        if !footer.isEmpty && footer.length > 0 {
            printPageRenderer.footerText = footer
        }

        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
        
        let pdfFilePath: String! = "\(self.getDocDir())/\(fileName).pdf"
        pdfData?.write(toFile: pdfFilePath, atomically: true)
        
        print(pdfFilePath)
        return pdfFilePath;
    }
    
    
    func getDocDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        
        UIGraphicsBeginPDFPage()
        
        printPageRenderer.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())
        
        UIGraphicsEndPDFContext()
        
        return data
    }
    
}

// For unit testing
public func samplePDF() ->String {
    let swiftPDF:SwiftPDF  = SwiftPDF()
    let bundle = Bundle(identifier: "vigneshuvi.SwiftPDFGenerator")
    let pathToSingleItemHTMLTemplate = bundle?.path(forResource: "Sample", ofType: "html")
    //reading
    do {
        let HTMLContent = try String(contentsOfFile: pathToSingleItemHTMLTemplate!)
        let filePath:String = swiftPDF.exportHTMLContentToPDF(fileName: "sample", HTMLContent: HTMLContent, header: "Uvi", footer: "Thank You!")
        return filePath;
        
    }
    catch  {/* error handling here */
        print("Unable to open and use HTML template files. \(error.localizedDescription)")
    }
    return "";
}

// Generate PDF File.
public func generatePDF(fileName: String, HTMLContent: String, header : String, footer: String) ->String {
    let swiftPDF:SwiftPDF  = SwiftPDF()
    let filePath:String = swiftPDF.exportHTMLContentToPDF(fileName: fileName, HTMLContent: HTMLContent, header: header, footer: footer)
    return filePath;
    
}


