//
//  ModalDetailVC.swift
//  StateRestoration
//
//  Created by Ish on 5/16/18.
//  Copyright © 2018 Illuminated Bits LLC. All rights reserved.
//

import UIKit

class ModalDetailVC: UIViewController {

    @IBAction func dismissPressed(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
