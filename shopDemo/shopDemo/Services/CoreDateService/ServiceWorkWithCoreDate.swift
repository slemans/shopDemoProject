//
//  ServiceWorkWithCoreDate.swift
//  shopDemo
//
//  Created by Павел on 27.03.23.
//

import UIKit
import CoreData

class ServiceWorkWithCoreDate {
    
    static let shared = ServiceWorkWithCoreDate()
    private init() { }
    
    func newUserOrSaveNewUser(_ userName: String, completion: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<User> = User.fetchRequest()
        let itemPredicate = NSPredicate(format: "firstName MATCHES %@", userName)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [itemPredicate])
        if let allUser = try? getContext().fetch(request),
           allUser.count > 0 {
            completion(false)
        } else {
            completion(true)
        }
    }
    
    func saveNewUserInCoreDate(_ user: UserMode) {
        let newUser = User(context: getContext())
        newUser.firstName = user.firstName
        newUser.lastnName = user.lastName
        newUser.email = user.email
        
        saveInCoreData()
    }
    
}

private extension ServiceWorkWithCoreDate {
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveInCoreData() {
        do {
            try getContext().save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
}
