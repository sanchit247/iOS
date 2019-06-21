import UIKit
class CameraFeature{
    
    var capturedImage = UIImage()
    var hdCapturedImage = UIImage()
    static let shared = CameraFeature()
    
    private init(){}
    // function that return image with exposure passed
    func imageWithAdjustedExposure(ev: Double , image : UIImage) -> UIImage? {
        guard let cgImage = image.cgImage else { return nil }
        
        let filterName = "CIExposureAdjust"
        guard let filter = CIFilter(name: filterName) else {
            print("No filter with name: \(filterName).")
            return nil
        }
        
        let inputImage = CoreImage.CIImage(cgImage: cgImage)
        
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(ev, forKey: kCIInputEVKey)
        
        guard let filteredImage = filter.outputImage else {
            print("No output image.")
            return nil
        }
        
        let context = CIContext(options: nil)
        
        return UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)
    }
    // function to overlay images
    func combineWith(image1: UIImage , image2: UIImage) -> UIImage {
        let bottomImage = image1
        let topImage = image2
        
        let newSize = CGSize(width: image1.size.width, height: image1.size.height)   // set this to what you need
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        bottomImage.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        topImage.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    // function to combine images to generate hdr image
    func generateHDR(images :[UIImage]) -> UIImage{
        let imageCount = images.count
        var image = images[0]
        for i in 1..<imageCount{
            image = combineWith(image1: image, image2: images[i])
        }
        return image
    }

}

