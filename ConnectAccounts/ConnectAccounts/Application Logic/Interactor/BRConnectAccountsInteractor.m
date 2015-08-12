#import "BRConnectAccountsInteractor.h"
#import "BRConnectAccountsDataManager.h"

@interface BRConnectAccountsInteractor ()

@property (nonatomic) BRConnectAccountsDataManager *dataManager;

@end

@implementation BRConnectAccountsInteractor

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (instancetype)initWithDataManager:(BRConnectAccountsDataManager *)dataManager {
    self = [super init];
    if (self) {
        self.dataManager = dataManager;
    }
    return self;
}

@end
