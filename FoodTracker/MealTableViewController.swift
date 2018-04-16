//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by dinhphu98 on 4/5/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit
class MealTableViewController: UITableViewController {

    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // nút edit khi xoá
        navigationItem.leftBarButtonItem = editButtonItem
        // load dữ liệu 3 cell
        loadSampleMeals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell" , for: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
            cell.nameLabel.text = meal.name
            cell.photoImageView.image = meal.photo
            cell.ratingControl.rating = meal.rating
            return cell
    }
    
    //khai báo các phần tử cell vào mảng : 3 meal cho vào mảng meals
    private func loadSampleMeals() {
        let photo1 = UIImage(named : "meal1")
        let photo2 = UIImage(named : "meal2")
        let photo3 = UIImage(named : "meal3")
        let meal1 = Meal(name: "Caprese Salad", photo: photo1!, rating: 4)!
        let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2!, rating: 5)!
        let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3!, rating: 3)!
        meals += [meal1, meal2, meal3]
    }
    // truyền dữ liệu từ tableviewcontroller đến viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if(segue.identifier ?? "") == "ShowDetail" {
            let mealDetailViewController = segue.destination as? MealViewController
            
            let selectedMealCell = sender as? MealTableViewCell
            
            if let indexpath = tableView.indexPath(for: selectedMealCell!){
                let selectedMeal = meals[indexpath.row]
                mealDetailViewController?.meal = selectedMeal
            }
        }
    }
    
    // chỉnh sửa và thêm
    @IBAction func unwindToMealList(sender : UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                meals[selectedIndexPath.row] = sourceViewController.meal!
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: meals.count, section: 0)
                meals.append(sourceViewController.meal!)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    // xoá cell ở tableviewcontroller
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            meals.remove(at: indexPath.row  )
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}
