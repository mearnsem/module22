//
//  StudentTableViewController.swift
//  SearchControllerTableView
//
//  Created by Emily Mearns on 6/21/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController, UISearchResultsUpdating {

    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
    
    // MARK: - Search Controller Methods
    
    func setupSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsVC")
        searchController = UISearchController(searchResultsController: resultsController)
        
        searchController?.searchBar.placeholder = "Search for Student"
        searchController?.searchResultsUpdater = self
        searchController?.hidesNavigationBarDuringPresentation = true
        searchController?.definesPresentationContext = true
        tableView.tableHeaderView = searchController?.searchBar
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let text = searchController.searchBar.text, resultsController = searchController.searchResultsController as? ResultsTableViewController else {return}
        resultsController.filteredStudents = StudentController.searchForStudentWith(text)
        resultsController.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentController.students.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath)

        let student = StudentController.students[indexPath.row]
        cell.textLabel?.text = student

        return cell
    }

}
