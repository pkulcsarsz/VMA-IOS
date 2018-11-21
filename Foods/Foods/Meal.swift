//
//  Meal.swift
//  Foods
//
//  Created by Péter Kulcsár Szabó on 10/11/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var info: String
    var icon: UIImage?
    var photo: UIImage?
    var author: UIImage?
    var authorName: String
    var rating: Int
    var steps: [Step]
    var ingredients: [String]
    var ingredientsPhoto : UIImage?
    var nutrition: String
    var time: String
    
    //MARK: Initialization
    
    init?(name: String, info: String, authorName: String, author: UIImage?, photo: UIImage?, icon: UIImage?, rating: Int, steps: [Step], ingredients: [String], ingredientsPhoto: UIImage?, time: String, nutrition: String) {
        
        // Initialize stored properties.
        self.name = name
        self.rating = rating
        self.ingredients = ingredients
        self.steps = steps
        self.info = info
        self.authorName = authorName
        self.icon = icon
        self.photo = photo
        self.author = author
        self.time = time
        self.nutrition = nutrition
        self.ingredientsPhoto = ingredientsPhoto
    }
}

class Step {
    
    //MARK: Properties
    
    var index: Int32
    var text: String
    var image : UIImage
    
    //MARK: Initializatipon
    
    init?(index: Int32, text: String, image : UIImage)
    {
        self.index = index
        self.text = text
        self.image = image
    }
}

