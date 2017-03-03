//
//  ContactEditer.h
//  PHPackAge
//
//  Created by wdx on 16/9/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ContactEditer : NSObject<CNContactViewControllerDelegate,CNContactPickerDelegate,ABNewPersonViewControllerDelegate,ABPeoplePickerNavigationControllerDelegate>
@property (nonatomic,strong) void(^block)(id);
+(instancetype)shareContactEditer;
-(void)addContactWithName:(NSString *)name mobilePhone:(NSString *)phoneNumber;
-(void)editContact;
//-(void)skipWithBlock:(void (^)(id))block;
@end
