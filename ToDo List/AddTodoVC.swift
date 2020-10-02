//
//  AddTodoVC.swift
//  ToDo List
//
//  Created by Vinayak Sharma on 01/10/20.
//

import UIKit
import CoreData



class AddTodoVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var addTodoField: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardNotiAndButtons()
    }
    
    func keyboardNotiAndButtons(){
        cancelButton.layer.cornerRadius = 10
        doneButton.layer.cornerRadius = 10
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        addTodoField.becomeFirstResponder()
    }
    
    @objc func keyboardWillShow(with notifiction: Notification){
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notifiction.userInfo?[key] as? NSValue else {return}
        
        let keyboardHeight = keyboardFrame.cgRectValue.height + 16
        bottomContraint.constant = keyboardHeight
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    fileprivate func dismissAndResign(){
        dismiss(animated: true)
        addTodoField.resignFirstResponder()
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismissAndResign()
    }
    
    @IBAction func donePressed(_ sender: Any) {
        guard let title = addTodoField.text, !title.isEmpty else {return}
        let newTask = Todo(context: context)
        newTask.title = addTodoField.text
        
        // Save data
        do{
            try context.save()
            DataManager.shared.tasksTableVC.fetchTodo()
            dismissAndResign()
        } catch {
            print(error)
        }
    }
}

extension AddTodoVC: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if doneButton.isHidden {
            addTodoField.text.removeAll()
            addTodoField.textColor = .white
            
            doneButton.isHidden = false
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
