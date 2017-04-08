//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int
    public var currency : String
    
    public func convert(_ to: String) -> Money {
        
        // put cases to convert the amount in money according to the currency passed in "to", or return as is if the currency to be converted to is the present currency
        // in each case, have to check what the self.currency is..??? srsly
        
        switch to {
            
        case self.currency : // works because swift automatically breaks out of the statement when a matching case is met
            return self;
            
        case "USD" : //converting to USD
            
            switch self.currency {
                
            case "GBP" : // 1 GBP to 2 USD
                
                return Money(amount: self.amount * 2, currency: "USD")
                
            case "EUR" : // 3 EUR to 2 USD
                
                return Money(amount: (self.amount * 2) / 3, currency: "USD")
                
            case "CAN" :  // 5 CAN to 4 USD
                
                return Money(amount: (self.amount * 4) / 5, currency: "USD")
                
            default : //since USD case dealt by the very first case
                print ("Invalid exchange currency inputted, no conversion conducted")
                return self;
            }
            
        case "GBP" : //converting to GBP
            
            switch self.currency {
                
            case "USD" : // 2 USD to 1 GBP
                
                return Money(amount: self.amount / 2, currency: "GBP")
                
            case "EUR" : // 3 EUR to 1 GBP
                
                return Money(amount: self.amount / 3, currency: "GBP")
                
            case "CAN" : // 5 CAN to 2 GBP
                
                return Money(amount: (self.amount / 5) * 2, currency: "GBP")
                
            default : //since GBP case dealt by the very first case
                print ("Invalid exchange currency inputted, no conversion conducted")
                return self;
            }
            
        case "EUR" : // converting to EUR
            
            switch self.currency {
                
            case "USD" : // 2 USD to 3 EUR
                
                return Money(amount: (self.amount / 2) * 3, currency: "EUR")
                
            case "GBP" : // 1 GBP to 3 EUR
                
                return Money(amount: self.amount * 3, currency: "EUR")
                
            case "CAN" : //  5 CAN to 6 EUR
                
                return Money(amount: (self.amount / 5) * 6, currency: "EUR")
                
            default : //since GBP case dealt by the very first case
                print ("Invalid exchange currency inputted, no conversion conducted")
                return self;
            }
            
        case "CAN" : // converting to CAN
            
            switch self.currency {
                
            case "USD" : // 4 USD to 5 CAN
                
                return Money(amount: (self.amount / 4) * 5, currency: "EUR")
                
            case "GBP" : // 2 GBP to 5 CAN
                
                return Money(amount: (self.amount / 2) * 5, currency: "EUR")
                
            case "EUR" : // 6 EUR to 5 CAN
                
                return Money(amount: (self.amount / 6) * 5, currency: "EUR")
                
            default : //since GBP case dealt by the very first case
                print ("Invalid exchange currency inputted, no conversion conducted")
                return self;
            }
            
        default :
            print ("Invalid exchange currency inputted, no conversion conducted")
            return self;
        }
        
    }
    
    public func add(_ to: Money) -> Money {
        // convert self to to's types then operate then return
        
        //var updatedSelf = self.convert(to.currency)
        
        return Money(amount: (self.convert(to.currency)).amount + to.amount, currency: to.currency)
    }
    
    public func subtract(_ from: Money) -> Money {
        
        return Money(amount: (self.convert(from.currency)).amount - from.amount, currency: from.currency)
        
        //which way to subtract???
        
    }
}

////////////////////////////////////
// Job
//
open class Job {
    fileprivate var title : String
    fileprivate var type : JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int) //per-year
    }
    
    public init(title : String, type : JobType) {
    }
    
    open func calculateIncome(_ hours: Int) -> Int {
    }
    
    open func raise(_ amt : Double) {
    }
}

////////////////////////////////////
// Person
//
open class Person {
    open var firstName : String = ""
    open var lastName : String = ""
    open var age : Int = 0
    
    fileprivate var _job : Job? = nil
    open var job : Job? {
        get { }
        set(value) {
        }
    }
    
    fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
        get { }
        set(value) {
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    open func toString() -> String {
    }
}

////////////////////////////////////
// Family
//
open class Family {
    fileprivate var members : [Person] = []
    
    public init(spouse1: Person, spouse2: Person) {
    }
    
    open func haveChild(_ child: Person) -> Bool {
    }
    
    open func householdIncome() -> Int {
    }
}





