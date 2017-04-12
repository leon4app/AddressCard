//
//  AddressCard.m
//  AddressCard
//
//  Created by LeonTse on 15/6/4.
//  Copyright (c) 2015年 LeonTse. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard
@synthesize name,email;

//-(void) setName:(NSString *)theName
//{
//    if (name != theName)
//        name = [NSString stringWithString: theName];
//}
//
//-(void) setEmail:(NSString *)theEmail
//{
//    if (email != theEmail)
//        email = [NSString stringWithString:theEmail];
//}

-(void) setName:(NSString *)theName andEmail:(NSString *)theEmail
{
    self.name = theName;
    self.email = theEmail;
}

-(void) print
{
    NSLog(@"====================================");
    NSLog(@"|                                  |");
    NSLog(@"|  %-31s |", [name UTF8String]);
    NSLog(@"|  %-31s |", [email UTF8String]);
    NSLog(@"|                                  |");
    NSLog(@"|                                  |");
    NSLog(@"|                                  |");
    NSLog(@"|      O            O              |");
    NSLog(@"====================================");
}

-(BOOL) isEqual:(AddressCard *)theCard
{
    if ( [name isEqualToString: theCard.name] == YES
        && [email isEqualToString: theCard.email] == YES)
        return YES;
    else
        return NO;
}

-(NSComparisonResult) compareNames:(id)element
{
    return [name compare:[element name]];
}
@end
