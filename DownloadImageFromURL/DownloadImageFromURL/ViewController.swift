//
//  ViewController.swift
//  DownloadImageFromURL
//
//  Created by Rizki Syaputra on 11/8/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //URL containing the image
    let URL_IMAGE = URL(string: "http://www.simplifiedtechy.net/wp-content/uploads/2017/07/simplified-techy-default.png")

    @IBOutlet weak var imgPreview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let session = URLSession(configuration: .default)
        //creating a dataTask
        let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                        let image = UIImage(data: imageData)
                        
                        //displaying the image
                        self.imgPreview.image = image
                        
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

