//
//  PersonViewController.m
//  通讯录
//
//  Created by Mikez on 2017/5/4.
//  Copyright © 2017年 Mikez. All rights reserved.
//
#import "DBManager.h"
#import "PersonViewController.h"
#import "Person.h"
@interface PersonViewController ()
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新建联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction)];
    
    
    if (self.person) {//修改
        self.nameTF.text = self.person.name;
        self.codeTF.text = self.person.code;
    }
    
}

- (void)saveAction {
    
    if (self.person) {//修改
        self.person.name = self.nameTF.text;
        self.person.code = self.codeTF.text;
        
        [[DBManager shareManager]updatePerson:self.person];
        
    }else{
        
        Person *p = [Person new];
        p.name = self.nameTF.text;
        p.code = self.codeTF.text;
        
        [[DBManager shareManager]insertPerson:p];
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
