//
//  FriendsViewControllerHelper.swift
//  fbMessenger
//
//  Created by GVN on 6/20/18.
//  Copyright © 2018 Son Vu. All rights reserved.
//

import UIKit
import CoreData

extension FriendsController {
    func setupData() {
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            let mark = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            mark.name = "Mark Zugkeberg"
            mark.imageProfileName = "zuckprofile"
            createMessageWithText(text: "My name is Mark, nice to meet you !", friend: mark, time: 0, context: context)
            
            let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            steve.name = "Steve Jobs"
            steve.imageProfileName = "steve_profile"
            createMessageWithText(text: "Good Morning", friend: steve, time: 2, context: context)
            createMessageWithText(text: "How are you ?", friend: steve, time: 1, context: context)
            createMessageWithText(text: "My name is Steve, nice to meet you !", friend: steve, time: 0, context: context)
            
            let donald = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            donald.name = "Donald Trump"
            donald.imageProfileName = "donald_trump_profile"
            createMessageWithText(text: "Good Morning", friend: donald, time: 5, context: context)
            //createMessageWithText(text: "How are you ?", friend: donald, time: 1, context: context)
            //createMessageWithText(text: "My name is Donald, nice to meet you !", friend: donald, time: 0, context: context)
            
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            
            //messages = [message, steveMessage]
            loadData()
        }
    }
    
    private func createMessageWithText(text: String, friend: Friend, time: Double, context: NSManagedObjectContext ) {
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.mess = text
        message.date = NSDate().addingTimeInterval(-time * 60)
        message.friend = friend
    }
    
    func loadData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            if let friends = fetchFriends() {
                
                messages = [Message]()
                
                for friend in friends {
                    print(friend)
                    
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
                    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                    fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                    fetchRequest.fetchLimit = 1
                    do {
                        let fetchResults = try (context.fetch(fetchRequest)) as? [Message]
                        messages?.append(contentsOf: fetchResults!)
                    } catch {
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    }
                }
                messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedDescending})
            }
        }
    }
    
    func clearData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            do {
                let entityName = ["Friend", "Message"]
                for entity in entityName {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
                    let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                    for object in objects! {
                        context.delete(object)
                    }
                }
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func fetchFriends() -> [Friend]? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
            do {
                return try (context.fetch(request)) as? [Friend]
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        return nil
    }
}
