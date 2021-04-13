//
//  ViewController.m
//  SQLPopVC
//
//  Created by DOFAR on 2021/4/12.
//

#import "ViewController.h"
#import "DFPopupController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onclickBtn:(UIButton *)sender {
    if(sender.tag == 105){
        [DFPopupController popupViewAddToViewController:self style:DFPopupControllerStyleSure Message:@"确认信息"];
        return;
    }
    DFPopupController * vc = [DFPopupController popupViewWithTitle:@"Title" imgName:@"" message:@"Message"];
    switch (sender.tag) {
        case 101:{
            [vc addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"OK" style:DFPopViewButtonStyleDefault handler:^(DFPopViewButton *popViewButton) {
                [vc dismissViewControllerAnimated:YES completion:nil];
            }]];
            break;
        }
        case 102:{
            [vc addPopViewTextFieldWithConfigurationHandler:^(DFPopViewTextField * _Nullable popViewTextField) {
                [popViewTextField setPlaceholder:@"请输入"];
            }];
            [vc addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"OK" style:DFPopViewButtonStyleDefault handler:^(DFPopViewButton *popViewButton) {
                [vc dismissViewControllerAnimated:YES completion:nil];
            }]];
            break;
        }
        case 103:{
            DFPopViewButton *btn1 = [DFPopViewButton popViewButtonWithTitle:@"OK" style:DFPopViewButtonStyleDefault handler:^(DFPopViewButton *popViewButton) {
                [vc dismissViewControllerAnimated:YES completion:nil];
            }];
            DFPopViewButton *btn2 = [DFPopViewButton popViewButtonWithTitle:@"OK" style:DFPopViewButtonStyleDefault handler:^(DFPopViewButton *popViewButton) {
                [vc dismissViewControllerAnimated:YES completion:nil];
            }];
            DFPopViewButton *btn3 = [DFPopViewButton popViewButtonWithTitle:@"OK" style:DFPopViewButtonStyleDefault handler:^(DFPopViewButton *popViewButton) {
                [vc dismissViewControllerAnimated:YES completion:nil];
            }];
            [vc addPopViewButtons:@[btn1,btn2,btn3]];
            break;
        }
        case 104:{
            UIImage *img = [UIImage imageNamed:@"chat_def_pic"];
            UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, vc.areaView.bounds.size.width, 200)];
            imgV.contentMode = UIViewContentModeScaleAspectFit;
            imgV.userInteractionEnabled = YES;
            imgV.image = img;
            [vc addPopOtherView:imgV];
            [vc addPopViewButton:[DFPopViewButton popViewButtonWithTitle:@"OK" style:DFPopViewButtonStyleDefault handler:^(DFPopViewButton *popViewButton) {
                [vc dismissViewControllerAnimated:YES completion:nil];
            }]];
            break;
        }
        default:
            break;
    }
    if(vc){
        [self presentViewController:vc animated:YES completion:nil];
    }
    
}




@end
