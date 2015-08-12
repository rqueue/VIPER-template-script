#import "BRConnectAccountsWireframe.h"
#import "BRConnectAccountsViewController.h"
#import "BRConnectAccountsPresenter.h"
#import "BRConnectAccountsInteractor.h"
#import "BRConnectAccountsDataManager.h"
#import "BRApplicationWireframe.h"

@interface BRConnectAccountsWireframe ()

@property (nonatomic) BRConnectAccountsViewController *connectAccountsViewController;
@property (nonatomic) UINavigationController *navigationController;
@property (weak, nonatomic, readwrite) BRApplicationWireframe *applicationWireframe;

@end

@implementation BRConnectAccountsWireframe

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (instancetype)initWithApplicationWireframe:(BRApplicationWireframe *)applicationWireframe session:(BRSession *)session {
    self = [super init];
    if (self) {
        self.applicationWireframe = applicationWireframe;
        self.connectAccountsViewController = [[BRConnectAccountsViewController alloc] init];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.connectAccountsViewController];

        BRConnectAccountsDataManager *dataManager = [[BRConnectAccountsDataManager alloc] initWithSession:session];
        BRConnectAccountsInteractor *interactor = [[BRConnectAccountsInteractor alloc] initWithDataManager:dataManager];
        BRConnectAccountsPresenter *presenter = [[BRConnectAccountsPresenter alloc] init];
        presenter.interactor = interactor;
        presenter.userInterface = self.connectAccountsViewController;
        self.connectAccountsViewController.eventHandler = presenter;
    }
    return self;
}

#pragma mark - BRWireframe Overrides

- (UIViewController *)mainViewController {
    return self.navigationController;
}

- (UIViewController *)rawViewController {
    return self.connectAccountsViewController;
}

@end
