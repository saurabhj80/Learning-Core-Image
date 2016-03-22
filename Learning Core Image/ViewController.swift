//
//  ViewController.swift
//  Learning Core Image
//
//  Created by Saurabh Jain on 3/21/16.
//  Copyright © 2016 Saurabh Jain. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    // CIContext is used for creating images
    private var context = CIContext()
    
    // for rendering the UIImage
    @IBOutlet weak var imageView: UIImageView!
    
    // the input image
    private var inputImage: CIImage? {
        get {
            if let url = NSBundle.mainBundle().URLForResource("house", withExtension: "jpg") {
                return CIImage(contentsOfURL: url)
            }
            return nil
        }
    }
    
    // MARK:- View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // filter the image
        guard let ci = inputImage else { return }
        let filter = InvertFilter(image: ci)
        if let filteredImage = filter.outputImage {
            let img = context.createCGImage(filteredImage, fromRect: filteredImage.extent)
            self.imageView?.image = UIImage(CGImage: img)
        }

    }
}

