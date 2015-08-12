#import <Foundation/Foundation.h>
#import "BRConnectAccountsInteractorInterface.h"

@class BRConnectAccountsDataManager;

@interface BRConnectAccountsInteractor : NSObject <BRConnectAccountsInteractorInterface>

- (instancetype)initWithDataManager:(BRConnectAccountsDataManager *)dataManager;

@end
