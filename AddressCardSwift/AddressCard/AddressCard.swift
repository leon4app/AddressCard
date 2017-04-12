//
//  AddressCard.swift
//  AddressCard
//
//  Created by LeonTse on 2017/4/1.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import Foundation

class AddressCard : NSObject
{
    var name:String!
    var email:String!
    @objc(setName:andEmail:)
    public func set(name:String, email:String) -> Void
    {
        self.name = name
        self.email = email
    }
    
    func isEqual(theCard:AddressCard) -> Bool
    {
        if name == theCard.name && email == theCard.email
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    public func printIt()
    {
        print("====================================")
        print("|                                  |")
        print("|  \(name.padding(toLength: 31, withPad: " ", startingAt: 0)) |")
        print("|  " + email.padding(toLength: 31, withPad: " ", startingAt: 0) + " |")
        print("|                                  |")
        print("|                                  |")
        print("|                                  |")
        print("|      O            O              |")
        print("====================================")
    }
    
    func compareNames(element:AddressCard) -> ComparisonResult
    {
        return name.compare(element.name);
    }
    
}
