//
//  ViewController.swift
//  FourthPractice
//
//  Created by Miguel Mexicano Herrera on 16/01/24.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var nameBookTxt: UITextField!
    @IBOutlet weak var idBookTxt: UITextField!
    // MARK: Variables declearations
       let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
       var context:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        openDataBase()
    }
    /// CRUD
    /// Create
    /// Read
    /// Update
    /// Delete
    func openDataBase() {
        context = appDelegate.persistentContainer.viewContext
        fetchData()
    }
    func getManagedObject() -> NSManagedObject {
        let entity = NSEntityDescription.entity(forEntityName: Constants.dbName, in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        return managedObject
    }
    /// Create
    func saveBook(idBook: Int, nameBook: String) {
        let managedObject = getManagedObject()
        managedObject.setValue(idBook, forKey: Constants.idBook)
        managedObject.setValue(nameBook, forKey: Constants.nameBook)
        saveContext()
        showAlert(title: "Exito", message: "Se agrego un libro")
    }
    /// Delete
    func deleteAll() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.dbName)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
            saveContext()
        } catch {
            print("Error al obtener los datos")
        }
    }
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error al guardar")
        }
    }
    /// Read
    func fetchData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.dbName)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let id = data.value(forKey: Constants.idBook) ?? ""
                let name = data.value(forKey: Constants.nameBook) ?? ""
                print("El id es: \(id) y el nombre es: \(name)")
            }
        } catch {
            print("Error al obtener los datos")
        }
    }
    @IBAction func tapRegisterBook(_ sender: Any) {
        guard let idBookText = idBookTxt.text, let nameBook = nameBookTxt.text else {
            return
        }
        let idBook = Int(idBookText) ?? 0
        if idBook == 0 {
            print("el id no puede ser 0")
            return
        }
        if nameBook.isEmpty {
            print("el nombre no puede ser vacio")
            return
        }
        saveBook(idBook: idBook, nameBook: nameBook)
    }
    @IBAction func tapReadBooks(_ sender: Any) {
        let listBooks = ListBooksViewController()
        self.navigationController?.pushViewController(listBooks, animated: true)
        //fetchData()
    }
    @IBAction func tapDeleteAll(_ sender: Any) {
        deleteAll()
    }
}

