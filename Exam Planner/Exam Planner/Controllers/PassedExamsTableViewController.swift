//
//  PassedExamsTableViewController.swift
//  Exam Planner
//
//  Created by Péter Kulcsár Szabó on 17/12/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class PassedExamsTableViewController: BaseExamsTableViewController {
    
    
    @IBOutlet var passedExamsTableView: UITableView!
    private var filteredExams = [Exam]()
    var availableMonths = [String]()
    var goupedExams = Dictionary<String, [Exam]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doGrouping()
    }
    
    func doGrouping()
    {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM-yyyy"
        
        super.loadExams()
        
        //filter the exams for the current state
        self.filteredExams = super.exams.filter { $0.state == ExamState.passed }
        
        
        self.goupedExams = Dictionary(grouping: self.filteredExams) { (exam) in
            return dateFormater.string(from: exam.date)
        }
        self.availableMonths = self.goupedExams.keys.sorted()
        print(availableMonths)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.availableMonths.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.goupedExams[self.availableMonths[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.availableMonths[section]
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //var index = self.filteredExams.index{ $0 === self.goupedExams[self.availableMonths[indexPath.section]]![indexPath.row]}
            
            let examToDelete = self.goupedExams[self.availableMonths[indexPath.section]]?[indexPath.row]
            super.exams.remove(at: super.exams.index{ $0 === examToDelete }!)
            
            super.saveExams()
            
            doGrouping()
            tableView.reloadData()
            
            
            //self.goupedExams[self.availableMonths[indexPath.section]]?.remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: .fade)
            
            //if(self.goupedExams[self.availableMonths[indexPath.section]]?.count == 0)
            //{
            //    self.goupedExams.removeValue(forKey: self.availableMonths[indexPath.section])
            //    self.availableMonths.remove(at: indexPath.section)
            //    let index : IndexSet = [indexPath.section]
            //    tableView.deleteSections(index, with: .fade)
            //}
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PassedExamTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PassedExamTableViewCell  else {
            fatalError("The dequeued cell is not an instance of PassedExamTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let exam = self.goupedExams[self.availableMonths[indexPath.section]]![indexPath.row]
        
        cell.nameLabel?.text = exam.name
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM.dd.yyy HH:mm"
        cell.dateLabel?.text = dateFormater.string(from: exam.date)
        
        return cell
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

    
    
    @IBAction func toggleEditMode(_ sender: Any) {
        self.passedExamsTableView.setEditing(!self.passedExamsTableView.isEditing
            , animated: true)
    }
    
}
