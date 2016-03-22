//
//  InvertFilter.swift
//  Learning Core Image
//
//  Created by Saurabh Jain on 3/22/16.
//  Copyright © 2016 Saurabh Jain. All rights reserved.
//

import UIKit

public class InvertFilter: CIFilter {

    // the input image
    public var inputImage: CIImage
    
    // Kernel
    private var kernel: CIColorKernel?

    public init(image: CIImage) {
        self.inputImage = image
        super.init()
        
        if let file = NSBundle.mainBundle().URLForResource("Kernel", withExtension: "kernel") {
            if let str = try? String(contentsOfURL: file) {
                let arr = str.componentsSeparatedByString("#")
                let kernelString = arr[1]
                kernel = CIColorKernel.kernelsWithString(kernelString)?[0] as? CIColorKernel
            }
        }
    }
    
    public override var outputImage: CIImage? {
        get {
            return kernel?.applyWithExtent(inputImage.extent, arguments: [inputImage])
        }
    }
    
    public override var name: String { get { return "InvertFilter" } }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
