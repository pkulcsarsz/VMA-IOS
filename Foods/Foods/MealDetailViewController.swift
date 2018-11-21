//
//  MealDetailViewController.swift
//  Foods
//
//  Created by Péter Kulcsár Szabó on 10/11/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {

    //MARK: Properties
    var meal : Meal?
    @IBOutlet var mealName: UILabel!
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var mealInfo: UILabel!
    @IBOutlet var mealTime: UILabel!
    @IBOutlet var mealNutrition: UILabel!
    @IBOutlet var authorImage: UIImageView!
    @IBOutlet var authorName: UILabel!
    @IBOutlet var ratingController: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mealName.text = meal?.name
        mealInfo.text = meal?.info
        mealImage.image = meal?.photo
        mealImage.layer.cornerRadius = 20
        mealImage.clipsToBounds = true
        authorName.text = meal?.authorName
        authorImage.image = meal?.author
        mealTime.text = meal?.time
        mealNutrition.text = meal?.nutrition
        
        self.title = meal?.name
        
        let starEmpty = UIImage(named: "star")
        let starFilled = UIImage(named: "starFilled")
        
        for i in 1...5 {
            let imageView = UIImageView()
            
            if ((meal?.rating)! <= i)
            {
                imageView.image = starEmpty
                
            }
            else
            {
                imageView.image = starFilled
            }
            ratingController.addArrangedSubview(imageView)
        }
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let mealIngredientViewController = segue.destination as? MealIngredientsViewController
        else {
            fatalError("Unexpected destination: \(sender ?? "unknown")")
        }
        
        mealIngredientViewController.meal = self.meal
    }
 

}
