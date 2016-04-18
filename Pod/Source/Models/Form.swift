//
//  Form.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class Form {

    // MARK: - Properties

    public private(set) var sections = [ FormSection ]()
 
    // MARK: - Init
    
    public init() { /* Default Initialiser Swift Access Control Quirk */ }
    
    // MARK: - Public Methods
 
    public func registerTableViewCellsForTableView(tableView: UITableView) {
        for section in sections {
            section.registerTableViewCellsForTableView(tableView)
        }
    }
    
    public func appendFormSection(section: FormSection) {
        sections.append(section)
    }

    public func rowForIndexPath(indexPath: NSIndexPath) -> FormRowType {
        return sections[indexPath.section].visibleRows()[indexPath.row]
    }

    public func rows() -> [ FormRowType ] {
        return sections.map({ return $0.rows }).flatMap({ return $0 })
    }
    
    public func visibleRows() -> [ FormRowType ] {
        return rows() //sections.map({ return $0.visibleRows() }).flatMap({ return $0 })
    }

}