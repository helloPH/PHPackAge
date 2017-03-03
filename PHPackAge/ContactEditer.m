//
//  ContactEditer.m
//  PHPackAge
//
//  Created by wdx on 16/9/6.
//  Copyright © 2016年 wdx. All rights reserved.
//

#import "ContactEditer.h"

@interface ContactEditer ()
@property (nonatomic,strong)UINavigationController * navigationController;

@property (nonatomic,strong)CNContactPickerViewController * greater9Pick;

@property (nonatomic,strong)ABPeoplePickerNavigationController * less9Pick;

@end
@implementation ContactEditer
+(instancetype)shareContactEditer{
    static dispatch_once_t one;
    static ContactEditer * editContacter;
    dispatch_once(&one, ^{
        editContacter=[[ContactEditer alloc]init];
    });
    return editContacter;
}

#pragma  -- mark   add contack
-(void)addContactWithName:(NSString *)name mobilePhone:(NSString *)phoneNumber{
    if (SystemVersion>9) {
        CNMutableContact * contact=[[CNMutableContact alloc]init];
        contact.namePrefix=name;
        contact.phoneNumbers=@[[CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:phoneNumber]],[CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:phoneNumber]]];
        [self showContackWithContack:contact];
        
        

    }else{
        ABRecordRef person=ABPersonCreate();
        ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFStringRef)name,NULL);
        ABMutableMultiValueRef multi=ABMultiValueCreateMutable(kABStringPropertyType);
        ABMultiValueAddValueAndLabel(multi, (__bridge CFStringRef)phoneNumber, kABPersonPhoneIPhoneLabel, nil);
        [self showContactWithPerson:person andMutiValue:multi];
    };
//    return _navigationController;
}

// 系统版本大于 9 时的联系人 展示方式
-(void)showContackWithContack:(CNMutableContact *)contack{
        CNMutableContact * contact=[contack mutableCopy];
        CNContactViewController * cnContactController=[CNContactViewController viewControllerForContact:contact];
        cnContactController.delegate=self;
        cnContactController.navigationItem.leftBarButtonItem
    =[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    
    
        _navigationController=[[UINavigationController alloc]initWithRootViewController:cnContactController];
    
    
    if (_block) {
        _block(_navigationController);
    }
}
- (void)contactViewController:(CNContactViewController *)viewController didCompleteWithContact:(nullable CNContact *)contact{
    [self dismiss];
}
-(void)dismiss{
     [_navigationController dismissViewControllerAnimated:YES completion:nil];
}
// < 9
-(void)showContactWithPerson:(ABRecordRef)person andMutiValue:(ABMutableMultiValueRef)mutiValue{
    ABRecordSetValue(person, kABPersonPhoneProperty, mutiValue, nil);

    ABNewPersonViewController * personC=[[ABNewPersonViewController alloc]init];
    personC.displayedPerson=person;
    personC.newPersonViewDelegate=self;
    _navigationController=[[UINavigationController alloc]initWithRootViewController:personC];
    if (_block) {
        _block(_navigationController);
    }
}

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(nullable ABRecordRef)person{
    
    [_navigationController dismissViewControllerAnimated:YES completion:nil];
    
}



#pragma  -- mark contack picker
-(void)editContact;
{
    if (SystemVersion>9) {
        _greater9Pick=[[CNContactPickerViewController alloc]init];
        _greater9Pick.delegate=self;
        if (_block) {
            _block(_greater9Pick);
        }
   }else{
       _less9Pick=[[ABPeoplePickerNavigationController alloc]init];
       _less9Pick.peoplePickerDelegate=self;
       if (_block) {
           _block(_less9Pick);
       }
    
   };

}
//     picker delegate  > 9

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
    [picker dismissViewControllerAnimated:YES completion:^{
        [self showContackWithContack:contact];
        
    }];

    
    
//    CNContactViewController * cnContactController=[CNContactViewController viewControllerForContact:contact];
//    cnContactController.delegate=self;
//    _navigationController=[[UINavigationController alloc]initWithRootViewController:cnContactController];
//    [_pickController presentViewController:_navigationController animated:YES completion:nil];
}
//  < 9

-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
//    self.hidesBottomBarWhenPushed=YES;
    ABNewPersonViewController *personVc=[[ABNewPersonViewController alloc]init];
    personVc.newPersonViewDelegate=self;
    personVc.displayedPerson=person;
    
    [self showContactWithPerson:person andMutiValue:nil];
    
}


@end
