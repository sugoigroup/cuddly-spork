#import <Foundation/Foundation.h>

@interface MyPlugin: NSObject
{

    NSDate *creationDate;
}
@end

@implementation MyPlugin

+(MyPlugin*) sharedInstance
{
    static MyPlugin *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"Create Instance IOS");
        _sharedInstance = [[MyPlugin alloc] init];
    });
    
    return _sharedInstance;
}


-(id)init
{
    self = [super init];
    if (self)
        [self initHelper];
    return self;
    
}

-(void)initHelper
{
    NSLog(@"InintHelper callsed");
    creationDate = [NSDate date];
}

-(double)getElapsedTime
{
    return [[NSDate date] timeIntervalSinceDate:creationDate];
}
@end


extern "C"
{
double IOSgetElapsedTime() {
    return [[MyPlugin sharedInstance] getElapsedTime];
}
}
