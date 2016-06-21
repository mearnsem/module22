//
//  ResultsTableViewController.swift
//  SearchControllerTableView
//
//  Created by Emily Mearns on 6/21/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    var filteredStudents: [String] = []

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStudents.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultCell", forIndexPath: indexPath)

        let student = filteredStudents[indexPath.row]
        cell.textLabel?.text = student

        return cell
    }
}
