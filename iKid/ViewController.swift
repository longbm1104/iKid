//
//  ViewController.swift
//  iKid
//
//  Created by Long Nguyen on 4/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    var dad: DadJokeViewController!
    var good: GoodJokeViewController!
    var pun: PunJokeViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dad = instantiate(id: "dad_joke")
        good = instantiate(id: "good_joke")
        pun = instantiate(id: "pun_joke")
        switchViewController(nil, to: dad)
    }

    @IBAction func switchView(_ sender: UIBarButtonItem) {
    }
    
    func instantiate<T>(id: String) -> T! {
        return storyboard?.instantiateViewController(withIdentifier: id) as? T
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController) {
        // Remove the old....
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }

        // ... swap in the new
        self.addChild(to)
        self.view.insertSubview(to.view, at: 0)
        to.didMove(toParent: self)
    }
    
}

