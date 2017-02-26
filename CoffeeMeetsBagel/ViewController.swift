//
//  ViewController.swift
//  CoffeeMeetsBagel
//
//  Created by Luke Solomon on 2/24/17.
//  Copyright © 2017 Luke Solomon. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!

    var images:[UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        kolodaView.dataSource = self
        kolodaView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
//        dataSource.reset()
    }
    
    func koloda(koloda: KolodaView, didSelectCardAtIndex index: UInt) {
        UIApplication.shared.openURL(NSURL(string: "http://yalantis.com/")! as URL)
    }
}

extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        //        return images.count
        return 1
    }

    func koloda(_ koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        return UIImageView(image: images[Int(index)])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}
