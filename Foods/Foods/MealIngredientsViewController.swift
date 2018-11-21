//
//  MealIngredientsViewController.swift
//  Foods
//
//  Created by Péter Kulcsár Szabó on 16/11/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class MealIngredientsViewController: UIViewController {

    //MARK: Properties
    var meal : Meal?
    
    @IBOutlet var photo: UIImageView!
    @IBOutlet var ingredientsList: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //self.navigationItem.backBarButtonItem = backButton
        
        
        // Do any additional setup after loading the view.
        for subview in ingredientsList.subviews {
            subview.removeFromSuperview()
        }
        
        
        for ingredient in (meal?.ingredients)! {
            let textLabel = UILabel()
            textLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
            textLabel.text  = "- " + ingredient
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "Marker Felt", size: 20)
            ingredientsList.addArrangedSubview(textLabel)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Do any additional setup after loading the view.
        photo.image = meal?.ingredientsPhoto
        
        photo.layer.cornerRadius = 20
        photo.clipsToBounds = true
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let mealStepsViewController = segue.destination as? MealStepsViewController
            else {
                fatalError("Unexpected destination: \(sender ?? "unknown")")
        }
        
        mealStepsViewController.meal = self.meal
        mealStepsViewController.index = 0
    }
 

}
