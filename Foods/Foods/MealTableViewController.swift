//
//  MealTableViewController.swift
//  Foods
//
//  Created by Péter Kulcsár Szabó on 10/11/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    //MARK: Properties
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Load the sample data
        loadSampleMelas()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Table view cells are reused and should be dequeqed using a cell identifier
        
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]
        
        cell.nameLabel?.text = meal.name
        cell.iconView.image = meal.icon
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let mealDetailViewController = segue.destination as? MealDetailViewController
            else {
                fatalError("Unexpected destination: \(sender ?? "unknown")")
        }
        
        guard let selectedMealCell = sender as? MealTableViewCell
            else {
                fatalError("Unexpected sender \(sender ?? "unknown")")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedMealCell)
            else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedMeal = meals[indexPath.row]
        
        mealDetailViewController.meal = selectedMeal
    }
 
    
    //MARK: Private functions
    
    private func loadSampleMelas() {
        
        var spaghettiSteps: [Step] = []
        spaghettiSteps.append(Step(index: 1, text: "Put the spagetti to the salted boiling water", image: UIImage(named: "spaghetti1")!)!)
        spaghettiSteps.append(Step(index: 2, text: "Make a bolognese souce- put the onion to the hot oil, them add the meat, tomato and the seasining with the garlic", image: UIImage(named: "spaghetti2")!)!)
        spaghettiSteps.append(Step(index: 3, text: "Mix the pasta with the souce", image: UIImage(named: "spaghetti3")!)!)
        
        var pancakeSteps: [Step] = []
        pancakeSteps.append(Step(index: 1, text: "Mix flour, milk, eggs, sugar, little bit od oil together", image: UIImage(named: "pancake1")!)!)
        pancakeSteps.append(Step(index: 2, text: "Put the mix to the pan and make pancakes", image: UIImage(named: "pancake2")!)!)
        pancakeSteps.append(Step(index: 3, text: "Serve with marmelade or cocoa", image: UIImage(named: "pancake3")!)!)
        
        var pizzaSteps: [Step] = []
        pizzaSteps.append(Step(index: 1, text: "Make a pastry, put the ingredients on", image: UIImage(named: "pizza1")!)!)
        pizzaSteps.append(Step(index: 2, text: "Put it into the oven for 30 min", image: UIImage(named: "pizza2")!)!)
        
        var ingredientsSpaghettiList: [String] = []
        ingredientsSpaghettiList.append("minced meat")
        ingredientsSpaghettiList.append("tomato sauce")
        ingredientsSpaghettiList.append("onion")
        ingredientsSpaghettiList.append("bolognese seasoning")
        ingredientsSpaghettiList.append("oil")
        ingredientsSpaghettiList.append("spaghetti")
        
        var pancakeIngredientsList: [String] = []
        pancakeIngredientsList.append("flour")
        pancakeIngredientsList.append("milk")
        pancakeIngredientsList.append("eggs")
        pancakeIngredientsList.append("sugar")
        pancakeIngredientsList.append("marmelade")
        pancakeIngredientsList.append("cocoa")
        pancakeIngredientsList.append("oil")
        
        var pizzaIngredientsList: [String] = []
        pizzaIngredientsList.append("flour")
        pizzaIngredientsList.append("water")
        pizzaIngredientsList.append("egg")
        pizzaIngredientsList.append("sourdrough")
        pizzaIngredientsList.append("ham")
        pizzaIngredientsList.append("corn")
        
        
        guard let pancake = Meal(
                name: "Pancake",
                info: "with marmelade and cocoa",
                authorName: "Kika",
                author: UIImage(named: "female"),
                photo: UIImage(named: "pancakeMeal"),
                icon: UIImage(named: "pancake"),
                rating: 2,
                steps: pancakeSteps,
                ingredients: pancakeIngredientsList,
                ingredientsPhoto: UIImage(named: "pancakeIngredients"),
                time: "20",
                nutrition: "225"
                )
            else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let pizza = Meal(
            name: "Pizza",
            info: "with ham and corn",
            authorName: "Don Cicci",
            author: UIImage(named: "male"),
            photo: UIImage(named: "pizzaMeal"),
            icon: UIImage(named: "pizza"),
            rating: 5,
            steps: pizzaSteps,
            ingredients: pizzaIngredientsList,
            ingredientsPhoto: UIImage(named: "pizzaIngredients"),
            time: "45",
            nutrition: "675"
            )
            else {
                fatalError("Unable to instantiate meal1")
        }
      
        guard let spaghetti = Meal(
            name: "Spaghetti",
            info: "Bolognese",
            authorName: "Don Corleone",
            author: UIImage(named: "male"),
            photo: UIImage(named: "spaghettiMeal"),
            icon: UIImage(named: "spaghetti"),
            rating: 4,
            steps: spaghettiSteps,
            ingredients: ingredientsSpaghettiList,
            ingredientsPhoto: UIImage(named: "spaghettiIngredients"),
            time: "60",
            nutrition: "580"
            )
            else {
                fatalError("Unable to instantiate meal1")
        }
        
        meals += [pancake, pizza, spaghetti]

    }

}


