//
//  MealStepsViewController.swift
//  Foods
//
//  Created by Péter Kulcsár Szabó on 16/11/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class MealStepsViewController: UIViewController {

    //MARK: Properties
    var meal : Meal?
    var index : Int?
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if((meal?.steps.count)! - 1 == index)
        {
            nextButton.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Step " + String(self.index! + 1)
        textLabel.text = meal?.steps[index!].text
        image.image = meal?.steps[index!].image
        
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
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
        mealStepsViewController.index = self.index! + 1
    }
    
 

}
