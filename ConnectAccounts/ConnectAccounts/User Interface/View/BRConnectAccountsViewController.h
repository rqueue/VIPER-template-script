#import <UIKit/UIKit.h>
#import "BRConnectAccountsViewInterface.h"
#import "BRViewController.h"

@protocol BRConnectAccountsEventInterface;

@interface BRConnectAccountsViewController : BRViewController <BRConnectAccountsViewInterface>

@property (nonatomic) id<BRConnectAccountsEventInterface> eventHandler;

@end
