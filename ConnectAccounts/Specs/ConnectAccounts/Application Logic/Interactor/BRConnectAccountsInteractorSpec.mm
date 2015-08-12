#import "BRConnectAccountsInteractor.h"
#import "BRConnectAccountsDataManager.h"
#import <KSDeferred/KSDeferred.h>

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BRConnectAccountsInteractorSpec)

describe(@"BRConnectAccountsInteractor", ^{
    __block BRConnectAccountsInteractor *interactor;
    __block BRConnectAccountsDataManager *dataManager;
    __block SpecHelper *helper;
    __block KSDeferred *deferred;

    beforeEach(^{
        deferred = [KSDeferred defer];
        helper = [SpecHelper specHelper];
        helper.sharedExampleContext[@"deferred"] = deferred;

        dataManager = [[BRConnectAccountsDataManager alloc] initWithSession:nil];
        interactor = [[BRConnectAccountsInteractor alloc] initWithDataManager:dataManager];
    });

    it(@"should not be nil", ^{
        interactor should_not be_nil;
    });
});

SPEC_END
