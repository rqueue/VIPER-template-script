#import "BRConnectAccountsWireframe.h"
#import "BRConnectAccountsViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BRConnectAccountsWireframeSpec)

describe(@"BRConnectAccountsWireframe", ^{
    __block BRConnectAccountsWireframe *wireframe;

    beforeEach(^{
        wireframe = [[BRConnectAccountsWireframe alloc] initWithApplicationWireframe:nil session:nil];
    });

    it(@"should not be nil", ^{
        wireframe should_not be_nil;
    });
});

SPEC_END
