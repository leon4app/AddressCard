//
//  AddressBook.swift
//  AddressCard
//
//  Created by LeonTse on 2017/4/1.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

//
//  AddressBook.m
//  AddressCard
//
//  Created by LeonTse on 15/6/5.
//  Copyright (c) 2015年 LeonTse. All rights reserved.
//

import Foundation

class AddressBook : NSObject
{
    var bookName:String!
    var book:NSMutableArray
    
    init(name:String)
    {
        bookName = name
        book = NSMutableArray.init()
    }
    
    override convenience init()
    {
        self.init(name:"NoName")
    }
    @objc(addCard:)
    public func addCard(theCard:AddressCard)
    {
        book.insert(theCard, at: book.count)
    }
    
    func entries()->Int
    {
        return book.count
    }
    
    func list()
    {
        print("============ Contents of: \(bookName) =========")
        for theCard in book
        {
            print(String(format:"%-20s",(theCard as! AddressCard).name)+"      "+String(format:"%-32s",(theCard as! AddressCard).email))
        }
        print("=============================================")
    }
    
    func lookup(theName :String) -> AddressCard?
    {
        for nextCard  in book
        {
            if (nextCard as! AddressCard).name.caseInsensitiveCompare(theName) == ComparisonResult.orderedSame
            {
                return nextCard as? AddressCard
            }
        }
        return nil
    }
    @objc(lookupAll:)
    public func lookupAll(theName: String) -> Array<Any>?
    {
        var indexSet = book.indexesOfObjects(options: NSEnumerationOptions.concurrent, passingTest: { (obj:Any, idx:Int, stop:UnsafeMutablePointer<ObjCBool>) -> Bool in
            
                return (obj as! AddressCard).name.caseInsensitiveCompare(theName) == ComparisonResult.orderedSame
            
        })
        if !indexSet.isEmpty
        {
            var result = book.objects(at: indexSet)
            return result
        }
        else
        {
            return nil
        }
    }
    
    func removeCard(theCard:AddressCard)
    {
        book.removeObject(identicalTo:theCard)
    }
    
    func sort()
    {
        book.sort(options: NSSortOptions.concurrent) { (obj1:Any, obj2: Any) -> ComparisonResult in
            
                return (obj1 as! AddressCard).name.compare((obj2 as! AddressCard).name)
            
            
        }
    }

}
