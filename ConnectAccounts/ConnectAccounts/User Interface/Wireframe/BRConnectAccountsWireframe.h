#import <Foundation/Foundation.h>
#import "BRWireframe.h"

@class BRApplicationWireframe;
@class BRSession;

@interface BRConnectAccountsWireframe : BRWireframe

@property (weak, nonatomic, readonly) BRApplicationWireframe *applicationWireframe;

- (instancetype)initWithApplicationWireframe:(BRApplicationWireframe *)applicationWireframe session:(BRSession *)session;

@end
