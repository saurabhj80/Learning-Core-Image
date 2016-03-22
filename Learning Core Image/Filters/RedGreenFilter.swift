//
//  RedGreenFilter.swift
//  Learning Core Image
//
//  Created by Saurabh Jain on 3/21/16.
//  Copyright © 2016 Saurabh Jain. All rights reserved.
//

import CoreImage

public class RedGreenFilter: CIFilter
{
    // the input image
    public var inputImage: CIImage
    
    // the kernel code
    private static let filterString =   "kernel vec4 redGreenKernel(sampler image) { " +
                                        "   vec4 src = sample(image, samplerCoord(image));    " +
                                        "   return vec4(src.g, src.r, src.b, src.a); " +
                                        "}"
    
    public init(image: CIImage) {
        self.inputImage = image
        super.init()
    }
    
    
    lazy private var kernel: CIColorKernel?  = {
        let kernel = CIColorKernel.kernelsWithString(filterString)
        return kernel?[0] as? CIColorKernel
    }()
    
    public override var outputImage: CIImage? {
        get {
            return kernel?.applyWithExtent(inputImage.extent, arguments: [inputImage])
        }
    }
    
    public override var name: String { get { return "RedGreenFilter" } }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
