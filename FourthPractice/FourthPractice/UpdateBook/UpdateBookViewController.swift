//
//  UpdateBookViewController.swift
//  FourthPractice
//
//  Created by Miguel Mexicano Herrera on 17/01/24.
//

import UIKit
import CoreData
class UpdateBookViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    @IBOutlet weak var idBookTxt: UITextField!
    @IBOutlet weak var nameBookTxt: UITextField!
    var book: BooksEntity?
    override func viewDidLoad() {
        super.viewDidLoad()
        context = appDelegate.persistentContainer.viewContext
        print(book?.name ?? "")
        guard let book = book else {
            return
        }
        idBookTxt.text = "\(book.idBook)"
        nameBookTxt.text = book.name
    }

    @IBAction func tapUpdateBook(_ sender: Any) {
        updateBook()
    }
    
    func updateBook() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.dbName)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: Constants.idBook) as! Int
                if id == idBook {
                    context.delete(data)
                }
            }
            saveContext()
        } catch {
            print("Error al obtener los datos")
        }
    }

}
