//
//  RootViewController.swift
//  TestSidebar
//
//  Created by Viet on 29/9/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import Cocoa


class RootViewController: NSSplitViewController {

    var listitems:[String] = ["View 1" , "View 2", "View 3" ,"View 4"]
    
    var VCname:[String] = ["MasterViewController","FirstViewController","SecondViewController","ThridViewController"]

    var listVC = [NSViewController]()
   
    @IBOutlet weak var OutlineView: NSOutlineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareVC()
    }
}




extension RootViewController: NSOutlineViewDataSource, NSOutlineViewDelegate{
    
    
    
    // Number of items in the sidebar
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return listitems.count
    }
    
    // Items to be added to sidebar
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return listitems[index]
    }
    
    // Whether rows are expandable by an arrow
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    
    // Height of each row
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 40
    }
    
    func load(nameVC: String) -> NSViewController
    {
        let viewController = self.storyboard?.instantiateController(withIdentifier: nameVC) as? NSViewController
        return viewController!
    }
    
    func prepareVC()
    {
        if !VCname.isEmpty
        {
            for vc in VCname
            {
                listVC.append(load(nameVC: vc))
            }
        }
    }

    func loadViewController(index: Int)
    {
        
        let splitViewController = self.parent as? NSSplitViewController
        
        let item = NSSplitViewItem(viewController: listVC[index])
        
        var items = splitViewController!.splitViewItems
        
        items[1] = item
        splitViewController!.splitViewItems = items
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification)
    {
        var selected = OutlineView.selectedRow
        switch selected {
        case 0:
            print("Selected 0")
            loadViewController(index: 0)
        case 1:
            print("selected 1")
            loadViewController(index: 1)

        case 2:
            print("selected 2")
            loadViewController(index: 2)
        case 3:
            print("selected 3")
            loadViewController(index: 3)
            
        default:
            print("Nothing here")
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView?
    {
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


