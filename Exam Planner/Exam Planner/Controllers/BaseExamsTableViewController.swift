//
//  BaseExamsTableViewController.swift
//  Exam Planner
//
//  Created by Péter Kulcsár Szabó on  17/12/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit


class BaseExamsTableViewController: UITableViewController {
    
    //MARK: Properties
    var exams = [Exam]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createTempData()
        
        saveExams()
        
        loadExams()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    
    public func createTempData()
    {
        guard let exam1 = Exam (
            name: "Math",
            state: .passed,
            date: Date()
            )
            else {
                fatalError("Unable to instantiate meal1")
        }
        
        guard let exam2 = Exam (
            name: "English1",
            state: .pending,
            date: Date()
            )
            else {
                fatalError("Unable to instantiate meal1")
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        guard let exam3 = Exam (
            name: "English2",
            state: .pending,
            date: formatter.date(from: "2018/10/08") ?? Date()
            )
            else {
                fatalError("Unable to instantiate meal1")
        }
        
        guard let exam4 = Exam (
            name: "English3",
            state: .pending,
            date: formatter.date(from: "2018/11/08") ?? Date()
            )
            else {
                fatalError("Unable to instantiate meal1")
        }
        
        guard let exam5 = Exam (
            name: "English4",
            state: .pending,
            date: formatter.date(from: "2018/12/08") ?? Date()
            )
            else {
                fatalError("Unable to instantiate meal1")
        }
        
        exams += [exam1, exam2, exam3, exam4, exam5]
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
    

}
