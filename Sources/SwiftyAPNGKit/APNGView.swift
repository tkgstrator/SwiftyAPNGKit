import Foundation
import SwiftUI
import APNGKit

public struct APNGView: UIViewControllerRepresentable {

    let image: APNGImage?
    var tmp: Image? = nil
    
    public init(url: URL) {
        self.image = APNGImage(url: url)
    }
    
    public init(url urlString: String) {
        self.init(url: URL(string: urlString)!)
    }
    
//    public init(data: Data) {
//        self.image = APNGImage(data: data)
//    }
//
//    public init(contentsOfFile: String) {
//        self.image = APNGImage(contentsOfFile: contentsOfFile)
//    }
    
    public init(named: String) {
        self.image = APNGImage(named: named)
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        guard let image = self.image else { return viewController }
        let imageView = APNGImageView(image: image)
        imageView.startAnimating()
        viewController.view.addSubview(imageView)
        return viewController
    }
    
    public func makeCoordinator() -> () {
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

extension APNGImage {
    convenience init?(url: URL) {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        self.init(data: data)
    }
}
