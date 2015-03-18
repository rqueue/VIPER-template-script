#!/bin/bash

module=$1

uppercase=$(echo $(echo ${module:0:1} | tr '[:lower:]' '[:upper:]')$(echo ${module:1}))
lowercase=$(echo $(echo ${module:0:1} | tr '[:upper:]' '[:lower:]')$(echo ${module:1}))

mkdir ${uppercase}
cd ${uppercase}

cat <<EOF > BR${uppercase}Interactor.h
#import <Foundation/Foundation.h>
#import "BR${uppercase}InteractorInterface.h"

@class BR${uppercase}DataManager;

@interface BR${uppercase}Interactor : NSObject <BR${uppercase}InteractorInterface>

- (instancetype)initWithDataManager:(BR${uppercase}DataManager *)dataManager;

@end
EOF

cat <<EOF > BR${uppercase}Interactor.m
#import "BR${uppercase}Interactor.h"
#import "BR${uppercase}DataManager.h"

@interface BR${uppercase}Interactor ()

@property (nonatomic) BR${uppercase}DataManager *dataManager;

@end

@implementation BR${uppercase}Interactor

- (instancetype)initWithDataManager:(BR${uppercase}DataManager *)dataManager {
    self = [super init];
    if (self) {
        self.dataManager = dataManager;
    }
    return self;
}

@end
EOF

cat <<EOF > BR${uppercase}InteractorInterface.h
#import <Foundation/Foundation.h>

@protocol BR${uppercase}InteractorInterface <NSObject>

@end
EOF

cat <<EOF > BR${uppercase}Presenter.h
#import <Foundation/Foundation.h>
#import "BR${uppercase}EventInterface.h"

@protocol BR${uppercase}ViewInterface;
@protocol BR${uppercase}InteractorInterface;

@interface BR${uppercase}Presenter : NSObject <BR${uppercase}EventInterface>

@property (weak, nonatomic) UIViewController<BR${uppercase}ViewInterface> *userInterface;
@property (nonatomic) id<BR${uppercase}InteractorInterface> interactor;

@end
EOF

cat <<EOF > BR${uppercase}Presenter.m
#import "BR${uppercase}Presenter.h"
#import "BR${uppercase}ViewInterface.h"
#import "BR${uppercase}InteractorInterface.h"

@implementation BR${uppercase}Presenter

@end

EOF

cat <<EOF > BR${uppercase}ViewController.h
#import <UIKit/UIKit.h>
#import "BR${uppercase}ViewInterface.h"
#import "BRViewController.h"

@protocol BR${uppercase}EventInterface;

@interface BR${uppercase}ViewController : BRViewController <BR${uppercase}ViewInterface>

@property (nonatomic) id<BR${uppercase}EventInterface> eventHandler;

@end
EOF

cat <<EOF > BR${uppercase}ViewController.m
#import "BR${uppercase}ViewController.h"
#import "BR${uppercase}EventInterface.h"

@implementation BR${uppercase}ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"${uppercase}";
    }
    return self;
}

@end
EOF

cat <<EOF > BR${uppercase}ViewController.xib
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="5056" systemVersion="13D65" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES">
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="3733"/>
    </dependencies>
    <objects>
        <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner" customClass="BR${uppercase}ViewController">
            <connections>
                <outlet property="view" destination="i5M-Pr-FkT" id="sfx-zR-JGt"/>
            </connections>
        </placeholder>
        <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
        <view clearsContextBeforeDrawing="NO" contentMode="scaleToFill" id="i5M-Pr-FkT">
            <rect key="frame" x="0.0" y="0.0" width="320" height="568"/>
            <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
            <subviews>
                <label opaque="NO" clipsSubviews="YES" userInter${lowercase}Enabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="${uppercase}" textAlignment="center" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="PuK-Hr-Qb9">
                    <rect key="frame" x="20" y="20" width="280" height="21"/>
                    <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                    <fontDescription key="fontDescription" type="system" pointSize="17"/>
                    <color key="textColor" cocoaTouchSystemColor="darkTextColor"/>
                    <nil key="highlightedColor"/>
                </label>
            </subviews>
            <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="calibratedWhite"/>
            <simulatedStatusBarMetrics key="simulatedStatusBarMetrics"/>
            <simulatedScreenMetrics key="simulatedDestinationMetrics" type="retina4"/>
        </view>
    </objects>
</document>
EOF

cat <<EOF > BR${uppercase}ViewInterface.h
#import <Foundation/Foundation.h>

@protocol BR${uppercase}ViewInterface <NSObject>

@end
EOF

cat <<EOF > BR${uppercase}Wireframe.h
#import <Foundation/Foundation.h>
#import "BRWireframe.h"

@class BRApplicationWireframe;

@interface BR${uppercase}Wireframe : BRWireframe

@property (weak, nonatomic) BRApplicationWireframe *applicationWireframe;

- (instancetype)initWithApplicationWireframe:(BRApplicationWireframe *)applicationWireframe;
- (void)routeOntoBaseViewController:(UIViewController *)viewController;

@end
EOF

cat <<EOF > BR${uppercase}Wireframe.m
#import "BR${uppercase}Wireframe.h"
#import "BR${uppercase}ViewController.h"
#import "BR${uppercase}Presenter.h"
#import "BR${uppercase}Interactor.h"
#import "BR${uppercase}DataManager.h"
#import "BRApplicationWireframe.h"

@interface BR${uppercase}Wireframe ()

@property (nonatomic) BR${uppercase}ViewController *${lowercase}ViewController;
@property (nonatomic) UINavigationController *navigationController;
@property (nonatomic) UIViewController *baseViewController;

@end

@implementation BR${uppercase}Wireframe

- (instancetype)initWithApplicationWireframe:(BRApplicationWireframe *)applicationWireframe {
    self = [super init];
    if (self) {
        self.applicationWireframe = applicationWireframe;
        self.${lowercase}ViewController = [[BR${uppercase}ViewController alloc] init];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.${lowercase}ViewController];

        BR${uppercase}DataManager *dataManager = [[BR${uppercase}DataManager alloc] init];
        BR${uppercase}Interactor *interactor = [[BR${uppercase}Interactor alloc] initWithDataManager:dataManager];
        BR${uppercase}Presenter *presenter = [[BR${uppercase}Presenter alloc] init];
        presenter.interactor = interactor;
        presenter.userInterface = self.${lowercase}ViewController;
        self.${lowercase}ViewController.eventHandler = presenter;
    }
    return self;
}

- (void)routeOntoBaseViewController:(UIViewController *)viewController {
    self.baseViewController = viewController;
    [self.baseViewController presentViewController:[self mainViewController] animated:SHOULD_ANIMATE completion:nil];
 }

#pragma mark - BRWireframe Overrides

- (UIViewController *)mainViewController {
    return self.navigationController;
}

- (UIViewController *)rawViewController {
    return self.${lowercase}ViewController;
}

@end
EOF

cat <<EOF > BR${uppercase}EventInterface.h
#import <Foundation/Foundation.h>

@protocol BR${uppercase}EventInterface <NSObject>

@end
EOF

cat <<EOF > BR${uppercase}DataManager.h
#import <Foundation/Foundation.h>

@interface BR${uppercase}DataManager : NSObject

@end
EOF

cat <<EOF > BR${uppercase}DataManager.m
#import "BR${uppercase}DataManager.h"

@implementation BR${uppercase}DataManager

@end
EOF

cd ..
mkdir ${uppercase}Specs
cd ${uppercase}Specs

cat <<EOF > BR${uppercase}InteractorSpec.mm
#import "BR${uppercase}Interactor.h"
#import "BR${uppercase}DataManager.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BR${uppercase}InteractorSpec)

describe(@"BR${uppercase}Interactor", ^{
    __block BR${uppercase}Interactor *interactor;

    beforeEach(^{
        interactor = [[BR${uppercase}Interactor alloc] init];
    });

    it(@"should not be nil", ^{
        interactor should_not be_nil;
    });
});

SPEC_END
EOF

cat <<EOF > BR${uppercase}DataManagerSpec.mm
#import "BR${uppercase}DataManager.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BR${uppercase}DataManagerSpec)

describe(@"BR${uppercase}DataManager", ^{
    __block BR${uppercase}DataManager *dataManager;

    beforeEach(^{
        dataManager = [[BR${uppercase}DataManager alloc] init];
    });

    it(@"should not be nil", ^{
        dataManager should_not be_nil;
    });
});

SPEC_END
EOF

cat <<EOF > BR${uppercase}PresenterSpec.mm
#import "BR${uppercase}Presenter.h"
#import "BR${uppercase}Interactor.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BR${uppercase}PresenterSpec)

describe(@"BR${uppercase}Presenter", ^{
    __block BR${uppercase}Presenter *presenter;

    beforeEach(^{
        presenter = [[BR${uppercase}Presenter alloc] init];
    });

    it(@"should not be nil", ^{
        presenter should_not be_nil;
    });
});

SPEC_END
EOF

cat <<EOF > BR${uppercase}WireframeSpec.mm
#import "BR${uppercase}Wireframe.h"
#import "BR${uppercase}ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BR${uppercase}WireframeSpec)

describe(@"BR${uppercase}Wireframe", ^{
    __block BR${uppercase}Wireframe *wireframe;

    beforeEach(^{
        wireframe = [[BR${uppercase}Wireframe alloc]
        initWithApplicationWireframe:nil];
    });

    it(@"should not be nil", ^{
        wireframe should_not be_nil;
    });
});

SPEC_END
EOF
