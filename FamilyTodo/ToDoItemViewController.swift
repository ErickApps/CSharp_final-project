

import Foundation
import UIKit

protocol ToDoItemDelegate {
    func didSaveItem(text : String)
}

class ToDoItemViewController: UIViewController,  UIBarPositioningDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var text: UITextField!
    
    var delegate : ToDoItemDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.text.delegate = self
        self.text.becomeFirstResponder()
    }
    
    @IBAction func cancelPressed(sender : UIBarButtonItem) {
        self.text.resignFirstResponder()
    }
    
    @IBAction func savePressed(sender : UIBarButtonItem) {
        saveItem()
        self.text.resignFirstResponder()
    }
    
    // Textfield
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool
    {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        saveItem()
        
        textField.resignFirstResponder()
        return true
    }
    
    // Delegate
    
    func saveItem()
    {
        if let text = self.text.text {
            self.delegate?.didSaveItem(text)
        }
    }
}