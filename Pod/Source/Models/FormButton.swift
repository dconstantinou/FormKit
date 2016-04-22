//
//  FormButton.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormButton: FormRowType, FormRowTypeInteractable {
    
    // MARK: - Properties
    
    public var title: String?
    public var tap: ((cell: UITableViewCell) -> ())?
    
    public weak var section: FormSection?
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormButtonCell.self, forCellReuseIdentifier: String(FormButtonCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(FormButtonCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormButtonCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.titleLabel.text = title
    }
    
    public func controller(controller: FormViewController, didSelectCell cell: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        controller.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tap?(cell: cell)
    }
    
}