#import <Foundation/Foundation.h>
#import "BRConnectAccountsEventInterface.h"

@protocol BRConnectAccountsViewInterface;
@protocol BRConnectAccountsInteractorInterface;

@interface BRConnectAccountsPresenter : NSObject <BRConnectAccountsEventInterface>

@property (weak, nonatomic) UIViewController<BRConnectAccountsViewInterface> *userInterface;
@property (nonatomic) id<BRConnectAccountsInteractorInterface> interactor;

@end
