//
//  ViewController.swift
//  ModalVC
//
//  Created by Талгат Лукманов on 15.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    
        showModalVC()
    }
    
    func showModalVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let redVC = RedViewController()
            redVC.modalPresentationStyle = .formSheet
            self.present(redVC, animated: true, completion: nil)

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                redVC.dismiss(animated: false, completion: nil)
                
                let greenVC = GreenViewController()
                greenVC.modalPresentationStyle = .formSheet
                self.present(greenVC, animated: false, completion: nil)
            }
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        showModalVC()
    }
}

class RedViewController : UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .red
    }
}

class GreenViewController : UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .green
    }
}
