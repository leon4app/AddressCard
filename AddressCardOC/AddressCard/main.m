//
//  main.m
//  AddressCard
//
//  Created by LeonTse on 15/6/4.
//  Copyright (c) 2015年 LeonTse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"

@interface NSSet (Printing)
-(void) print;
@end

@implementation NSSet (Printing)
-(void) print
{
    printf("{ ");
    for (NSNumber *element in self)
        printf(" %li ", (long)[element integerValue]);
    printf("}\n");
}
@end

@interface NSDate (ElapsedDays)
-(unsigned long) elapsedDays: (NSDate *) theDate;
@end

@implementation NSDate (ElapsedDays)

-(unsigned long) elapsedDays:(NSDate *)theDate
{
    //NSDate *nowDate = [NSDate date];
    NSTimeInterval timeInterval = [self timeIntervalSinceDate:theDate];
    return timeInterval;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /*//Date使用学习
        NSDate *aDate = [NSDate dateWithString:@"2015-06-28 11:45:32 +0800"];
        NSDate *today = [NSDate date];
        NSTimeInterval result = [aDate elapsedDays:today];
        int intResult = (int)result;
        int seconds = intResult % 60;
        intResult = intResult / 60;
        int minutes = intResult % 60;
        intResult /= 60;
        int hours = intResult % 24;
        int days = intResult / 24;
        
        NSLog(@"%i days, %i : %i : %i", days, hours, minutes, seconds);
         */
//        NSMutableSet *set1 = [NSMutableSet setWithObjects:@1, @3, @5, @10, nil];
//        NSSet *set2 = [NSSet setWithObjects:@-5, @100, @3, @5, nil];
//        NSSet *set3 = [NSSet setWithObjects:@12, @200, @3, nil];
//        NSLog(@"set1: ");
//        [set1 print];
//        NSLog(@"set2: ");
//        [set2 print];
//        
//        if ([set1 isEqualToSet:set2])
//            NSLog(@"set1 equals set2");
//        else
//            NSLog(@"set1 is not equals to set2");
//        
//        if ([set1 containsObject:@10] == YES)
//            NSLog(@"set1 contains 10");
//        else
//            NSLog(@"set1 does not contain 10");
//        
//        
   /*//Dictionary
        NSDictionary *glossary = [NSDictionary dictionaryWithObjectsAndKeys:
                                         @"A class defined so other classes can inherit from it", @"abstract class",
                                         @"To implement all the methods defined in a protocol", @"adopt",
                                         @"Storing an object for later use", @"archiving",
                                         nil];
        NSLog(@"abstract class: %@",[glossary objectForKey:@"abstract class"]);
        NSLog(@"adopt: %@", [glossary objectForKey:@"adopt"]);
        NSLog(@"archiving: %@", glossary[@"archiving"]);
    */
        
        NSString *aName = @"Julia Kochan";
        NSString *aEmail = @"jewls337@axlc.com";
        AddressCard *card1 = [AddressCard new];
        [card1 setName:aName];
        [card1 setEmail:aEmail];
        //[card1 print];
        AddressCard *card2 = [AddressCard new];
        [card2 setName:@"Tony Iannino" andEmail:@"tony.iannino@techfitness.com"];
        //[card2 print];
        AddressCard *card3 = [AddressCard new];
        [card3 setName:@"Stephen Kochan" andEmail:@"steve@classroom.com"];
        AddressCard *card4 = [AddressCard new];
        [card4 setName:@"Jamie Baker" andEmail:@"jbaker@classroom.com"];
        AddressCard *card5 = [AddressCard new];
        [card5 setName:@"Jamie Baker" andEmail:@"jer@classroom.com"];
        AddressBook *myBook = [[AddressBook alloc] initWithName:@"my address book"];
        AddressCard *myCard;
        NSArray *result;
        NSIndexSet *indexSet;
        NSLog(@"Entries in address book after creation: %i", [myBook entries]);
        
        [myBook addCard:card1];
        [myBook addCard:card2];
        [myBook addCard:card3];
        [myBook addCard:card4];
        [myBook addCard:card5];
       // [myBook list];
       // [myBook sort];
       // [myBook list];
        NSLog(@"Jamie Baker");
        //myCard = [myBook lookup:@"Jamie Baker"];
        result = [myBook lookupAll:@"Jamie Baker"];
        if (result != nil)
        {
            for (myCard in result)
                [myCard print];
        }
        else
            NSLog(@"Not found!");
        //[myBook removeCard:myCard];
        //[myBook list];
    }
    return 0;
}
