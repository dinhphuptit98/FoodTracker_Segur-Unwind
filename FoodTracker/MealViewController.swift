//
//  ViewController.swift
//  FoodTracker
//
//  Created by dinhphu98 on 4/1/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class MealViewController: UIViewController , UITextFieldDelegate ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var ratingControl: RatingController!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var meal : Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text   = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
    }
    
    // chọn ảnh
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present( imagePickerController , animated: true, completion: nil)
    }
    
    // nút cancel trong viewcontroller // copy
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        dismiss(animated: true, completion: nil)
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
    }
    
    // tryền dữ liệu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue , sender: sender)
        let button = sender as? UIBarButtonItem == saveButton
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        meal = Meal(name: name, photo: photo!, rating: rating)
    }
    
    
}

