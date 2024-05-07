//
//  UI+Extensions.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import UIKit

extension UITableView {
    /// Register a table view cell using its type
    func registerNib<T: UITableViewCell>(cellType: T.Type) {
        let nibName = String(describing: cellType)
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: nibName)
    }
    
    /// Dequeue a reusable table view cell using its type
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable cell with identifier: \(String(describing: T.self))")
        }
        return cell
    }
}
