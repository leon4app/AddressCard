//
//  AddressBook.h
//  AddressCard
//
//  Created by LeonTse on 15/6/5.
//  Copyright (c) 2015年 LeonTse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"
@interface AddressBook : NSObject

@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

-(instancetype) initWithName: (NSString *) name;
-(void) addCard: (AddressCard *) theCard;
-(int) entries;
-(void) list;
-(AddressCard *) lookup:(NSString *) theName;
-(NSArray *) lookupAll: (NSString *) theName;
-(void) removeCard:(AddressCard *) theCard;
-(void) sort;
@end
