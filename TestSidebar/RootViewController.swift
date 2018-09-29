//
//  RootViewController.swift
//  TestSidebar
//
//  Created by Viet on 29/9/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import Cocoa

let items = ["View 1" , "View 2", "View 3" ,"View 4"]

class RootViewController: NSSplitViewController {


    @IBOutlet weak var MyOutline: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension RootViewController: NSOutlineViewDataSource, NSOutlineViewDelegate{
    // Number of items in the sidebar
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return items.count
    }
    
    // Items to be added to sidebar
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return items[index]
    }
    
    // Whether rows are expandable by an arrow
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    
    // Height of each row
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 40
    }


    func loadViewController(vc: String)
    {
        guard let splitViewController = self.parent as? NSSplitViewController,
            let viewController = self.storyboard?.instantiateController(withIdentifier: vc) as? NSViewController
            else { return }
        
        let item = NSSplitViewItem(viewController: viewController)
        
        var items = splitViewController.splitViewItems
        items[1] = item
        splitViewController.splitViewItems = items
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        var selected = MyOutline.selectedRow
 
        
        switch selected {
        case 0:
            print("Selected 0")
            loadViewController(vc: "MasterViewController")
            
        case 1:
            print("selected 1")
            
            loadViewController(vc: "FirstViewController")
        case 2:
            print("selected 2")
            loadViewController(vc: "SecondViewController")

        case 3:
            print("selected 3")
            loadViewController(vc: "ThridViewController")

            
        default:
            print("Nothing here")
        }
        
        
        

    }
    
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        
        if let title = item as? String {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "itemCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = title
                textField.sizeToFit()
            }
        }
        
        return view
    }
    
}


