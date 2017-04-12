//
//  AddressCard.h
//  AddressCard
//
//  Created by LeonTse on 15/6/4.
//  Copyright (c) 2015年 LeonTse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject
@property(nonatomic,copy) NSString *name,*email;
-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail;

-(BOOL) isEqual:(AddressCard *) theCard;
-(void) print;
-(NSComparisonResult) compareNames:(id) element;
@end
