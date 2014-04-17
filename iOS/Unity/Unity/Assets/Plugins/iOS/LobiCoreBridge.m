#import <UIKit/UIKit.h>

#import <LobiCore/LobiCore.h>
#import <LobiCore/LobiAPI.h>
#import <LobiCore/LobiNetworkResponse.h>

#import "LobiCoreCommon.h"

static UIViewController*(*sGetUnityViewController)();

void LobiCore_set_root_view_controller_func(UIViewController*(*getViewController)())
{
    sGetUnityViewController = getViewController;
}

UIViewController* LobiCore_get_root_view_controller()
{
    return sGetUnityViewController();
}

int LobiCore_is_ready_()
{
    return [LobiCore isReady] ?  1 : 0;
}

void LobiCore_set_account_base_name_(const char *base_name, int base_name_len)
{
    NSString *baseName = make_autorelease_string(base_name);
    [LobiCore sharedInstance].accountBaseName = baseName;
}

void LobiCore_present_profile_()
{
    [LobiCore setRootViewController:sGetUnityViewController()];
    [LobiCore presentProfile];
}

void LobiCore_setup_pop_over_controller_(int x, int y, LobiPopOverArrowDirection direction)
{
    [LobiCore setupPopOverController:CGPointMake(x, y) direction:direction];
}

void LobiCore_set_navigation_bar_custom_color_(float r, float g, float b)
{
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    [LobiCore setNavigationBarCustomColor:color];
}
