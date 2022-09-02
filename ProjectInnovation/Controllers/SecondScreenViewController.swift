//
//  SecondScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit
import DropDown

class SecondScreenViewController: UIViewController {

    var toolBar = UIToolbar()
    var datePicker  = UIDatePicker()
    
    @IBOutlet weak var nameOfTaskField: UITextField!
    @IBOutlet weak var nameOfTask: UILabel!
    @IBOutlet weak var createNewTask: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var assignTo: UILabel!
    @IBOutlet weak var assignToFiedl: UITextField!
    @IBOutlet weak var subTaskButton: UIButton!
    @IBOutlet weak var assignTableView: UITableView!
    @IBOutlet weak var priorityDropDown: UIButton!
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var priorityLable: UILabel!
    @IBOutlet weak var selectDueDate: UIButton!
    @IBOutlet weak var descriptionField: UITextField!
    
    var searching = false
    var itemforassign = ["sad","sasdasd","wefe","sededad","dsasdasd","xwefe"]
    var filteredArrray = [String]()
    
    let dropDown = DropDown()
    let dropDownValues = ["High","Medium","Low"]
    
    func setupUI() {
        
        
        let view = nameOfTask!
        view.frame = CGRect(x: 0, y: 0, width: 27, height: 25)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        let view1 = nameOfTaskField!
        view1.frame = CGRect(x: 0, y: 0, width: 363, height: 51)
        view1.backgroundColor = .white
        view1.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view1.layer.cornerRadius = 5
        view1.layer.borderWidth = 0.5
        view1.layer.borderColor = UIColor(red: 0.762, green: 0.75, blue: 0.75, alpha: 1).cgColor
        let parent = self.view!
        view1.addSubview(view)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.widthAnchor.constraint(equalToConstant: 363).isActive = true
        view.heightAnchor.constraint(equalToConstant: 51).isActive = true
        view1.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
        view1.topAnchor.constraint(equalTo: parent.topAnchor, constant: 128).isActive = true
        
        let view2 = assignTo!
        view2.frame = CGRect(x: 0, y: 0, width: 55, height: 25)
        view2.backgroundColor = .white
        view2.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view2.font = UIFont(name: "OpenSans-Regular", size: 12)

        var paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineHeightMultiple = 1.96
        
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        subTaskButton.frame = CGRect(x: 0, y: 0, width: screenWidth/3, height: 25)
        subTaskButton.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        subTaskButton.layer.cornerRadius = 8

        addButton.frame = CGRect(x: 0, y: 0, width: screenWidth/3, height: 25)
        addButton.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        addButton.layer.cornerRadius = 8
        
        assignToFiedl.addTarget(self, action: #selector(searchAssign), for: .editingChanged)
        
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create a New Task"
        self.assignTableView.isHidden = true
        assignToFiedl.delegate = self
        dropDown.anchorView = dropDownView
        dropDown.dataSource = dropDownValues
        priorityDropDown.addTarget(self, action: #selector(showPriority), for: .touchDown)
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.priorityLable.text = item
        }
       
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    @IBAction func datePicker(_ sender: Any) {
        datePicker = UIDatePicker.init()
        datePicker.backgroundColor = UIColor.white
                
        datePicker.autoresizingMask = .flexibleWidth
        datePicker.datePickerMode = .date
                
        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(datePicker)
                
        toolBar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .blackTranslucent
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        toolBar.sizeToFit()
        self.view.addSubview(toolBar)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
            
        if let date = sender?.date {
            print("Picked the date \(dateFormatter.string(from: date))")
        }
    }

    @objc func onDoneButtonClick() {
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    @objc func showPriority(sender: Any) {
        dropDown.show()
    }
    
//    @State private var date = Date()
//
//    var body: some View {
//        DatePicker(
//            "Start Date",
//            selection: $date,
//            displayedComponents: [.date]
//        )
//        .datePickerStyle(.graphical)
//    }
    
    @objc func searchAssign(sender: UITextField)
    {
        self.filteredArrray.removeAll()
        if let searchData:Int = assignToFiedl.text?.count {
            if searchData != 0{
                searching = true
                for item in itemforassign {
                    if let itemTosearch = assignToFiedl.text
                    {
                        let range = item.lowercased().range(of: itemTosearch, options: .caseInsensitive, range: nil, locale: nil)
                        
                        if range != nil
                        {
                            self.filteredArrray.append(item)
                        }
                    }
                }
            }
        }
        else
        {
            filteredArrray = itemforassign
            searching = false
        }
        assignTableView.reloadData()
    }
}
extension SecondScreenViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return filteredArrray.count
        }
        else
        {
            return itemforassign.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assignTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching
        {
            cell.textLabel?.text = filteredArrray[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = itemforassign[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searching {
            assignToFiedl.text =  filteredArrray[indexPath.row]
        }
        else {
            assignToFiedl.text = itemforassign[indexPath.row]
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        assignToFiedl.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.assignTableView.isHidden = false
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.assignTableView.isHidden = true
    }
}

