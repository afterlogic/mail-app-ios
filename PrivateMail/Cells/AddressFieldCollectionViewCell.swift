//
//  AddressFieldCollectionViewCell.swift
//  PrivateMail
//
//  Created by Артём Абрамов on 09/08/2019.
//  Copyright © 2019 PrivateRouter. All rights reserved.
//

import UIKit

protocol AddressFieldCollectionViewCellProtocol: NSObjectProtocol {
    func addAddress(email: String?)
}

class AddressFieldCollectionViewCell: UICollectionViewCell {

    @IBOutlet var textField: UITextField!
    
    weak open var delegate: AddressFieldCollectionViewCellProtocol?
    
    static func cellID() -> String {
        return "AddressFieldCollectionViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.delegate = self
    }
}


extension AddressFieldCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.addAddress(email: textField.text)
        textField.text = nil

        return false
    }
}