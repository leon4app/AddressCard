//
//  AddressBook.m
//  AddressCard
//
//  Created by LeonTse on 15/6/5.
//  Copyright (c) 2015年 LeonTse. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook
@synthesize bookName, book;

//
-(instancetype) initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        bookName = [NSString stringWithString:name];
        book = [NSMutableArray array];
    }
    
    return self;
}
-(instancetype) init
{
    return [self initWithName:@"NoName"];
}

-(void) addCard:(AddressCard *)theCard
{
    [book addObject: theCard];
}
-(int) entries
{
    return (int)[book count];
}

-(void) list
{
    NSLog(@"============ Contents of: %@ =========", bookName);
    for (AddressCard *theCard in book) {
        NSLog(@"%-20s      %-32s", [theCard.name UTF8String], [theCard.email UTF8String]);
    }
    NSLog(@"=============================================");
}

-(AddressCard *) lookup:(NSString *)theName
{
//    NSRange subRange;
//    NSIndexSet *index;
//    for (AddressCard *add in book)
//    {
//        subRange = [[add name] rangeOfString: theName];
//        if (subRange.location != NSNotFound)
//        {
//            [index ]
//        }
//    }
//    
//    
//    if (result != NSNotFound) {
//        return book[result];
//    }
//    else
//        return nil;
    for (AddressCard *nextCard in book)
        if ( [nextCard.name caseInsensitiveCompare:theName] ==NSOrderedSame)
            return nextCard;
    return nil;
}

-(NSArray *) lookupAll: (NSString *) theName
{
    NSIndexSet *indexSet = [book indexesOfObjectsPassingTest:
                          ^(id obj, NSUInteger idx, BOOL *stop)
    {
        if ([[obj name] caseInsensitiveCompare: theName] == NSOrderedSame)
            return YES; // found a match, keep going
        else
            return NO; // keep looking
    } ];
    // Return the result
    //return result;
    if (indexSet != nil) {
        NSArray *result = [book objectsAtIndexes:indexSet];
        return result;
    }
    else
        return nil;
    
}

-(void) removeCard:(AddressCard *)theCard
{
    [book removeObjectIdenticalTo:theCard];
}

-(void) sort
{
    [book sortUsingComparator:^(id obj1, id obj2){
        return [[obj1 name] compare:[obj2 name]];
    }];
    //   [book sortUsingSelector:@selector(compareNames:)];
}
@end
