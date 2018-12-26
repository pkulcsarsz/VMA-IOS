//
//  examViewController.swift
//  Exam Planner
//
//  Created by Péter Kulcsár Szabó on 18/12/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class examViewController: UIViewController {

    var exams = [Exam]()
    var exam : Exam? = nil
    var isEditMode : Bool = false;
    
    @IBOutlet var nameInput: UITextField!
    @IBOutlet var dateInput: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(isEditMode)
        {
            nameInput.text = exam?.name
            dateInput.date = (exam?.date)!
            nameInput.isEnabled = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func saveExam(_ sender: Any) {
        
        if(isEditMode)
        {
            var gg = exams.filter {$0 === exam!}
            gg[0].date = dateInput.date
        }
        else
        {
            guard let newexam = Exam (
                name: nameInput.text!,
                state: .pending,
                date: dateInput.date
                )
                else {
                    fatalError("Unable to instantiate meal1")
            }
            
            exams += [newexam]
        }
        
        
        saveExams()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    public func loadExams()
    {
        //Load from local storage
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent("exams").appendingPathExtension("json")
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Exam].self, from: data)
            exams = jsonData
        } catch {
            print("error:\(error)")
        }
        
        
    }
    
    public func saveExams()
    {
        
        if let encodedData = try? JSONEncoder().encode(exams) {
            let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = DocumentDirURL.appendingPathComponent("exams").appendingPathExtension("json")
            
            do {
                try encodedData.write(to: fileURL)
            }
            catch {
                print("Failed to write JSON data: \(error.localizedDescription)")
            }
        }
    }
}
