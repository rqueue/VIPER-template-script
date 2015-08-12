#import "BRConnectAccountsPresenter.h"
#import "BRConnectAccountsInteractor.h"
#import <KSDeferred/KSDeferred.h>

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BRConnectAccountsPresenterSpec)

describe(@"BRConnectAccountsPresenter", ^{
    __block BRConnectAccountsPresenter *presenter;
    __block SpecHelper *helper;
    __block KSDeferred *deferred;

    beforeEach(^{
        deferred = [KSDeferred defer];
        helper = [SpecHelper specHelper];
        helper.sharedExampleContext[@"deferred"] = deferred;
        presenter = [[BRConnectAccountsPresenter alloc] init];
    });

    it(@"should not be nil", ^{
        presenter should_not be_nil;
    });
});

SPEC_END
