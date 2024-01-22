//
//  ListBooksViewController.swift
//  FourthPractice
//
//  Created by Miguel Mexicano Herrera on 16/01/24.
//

import UIKit
import CoreData
class ListBooksViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    var context: NSManagedObjectContext!
    @IBOutlet weak var tableView: UITableView!
    var books: [BooksEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = appDelegate.persistentContainer.viewContext
        setupTableView()
        books = fetchData()
        //books = books.sorted(by: {$0.idBook < $1.idBook})
        books = books.sorted(by: { oneNumber, twoNumber in
            oneNumber.idBook < twoNumber.idBook
        })
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    func fetchData() -> [BooksEntity] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.dbName)
        request.returnsObjectsAsFaults = false
        var books: [BooksEntity] = []
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let id: Int = data.value(forKey: Constants.idBook) as! Int
                let name: String = data.value(forKey: Constants.nameBook) as! String
                print("El id es: \(id) y el nombre es: \(name)")
                books.append(BooksEntity(idBook: id, name: name))
            }
            return books
        } catch {
            print("Error al obtener los datos")
            return []
        }
    }
    func deleteBook(idBook: Int) {
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
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error al guardar")
        }
    }
}
extension ListBooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction: UIContextualAction = UIContextualAction(style: .destructive, title: "Eliminar") { action, view, complete in
            self.deleteBook(index: indexPath.row)
            complete(true)
        }
        let updateAction: UIContextualAction = UIContextualAction(style: .normal, title: "Actualizar") { action, view, complete in
            self.updateBook(index: indexPath.row)
            complete(true)
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction, updateAction])
        return config
    }
    func deleteBook(index: Int) {
        let book = self.books[index]
        print("delete el book con id: \(book.idBook)")
        self.deleteBook(idBook: book.idBook)
        self.books.remove(at: index)
        self.tableView.reloadData()
    }
    func updateBook(index: Int) {
        let book = books[index]
        let update = UpdateBookViewController()
        update.book = book
        self.navigationController?.pushViewController(update, animated: true)
    }
}
extension ListBooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = book.name
        //cell.backgroundColor = .red
        return cell
    }
}
