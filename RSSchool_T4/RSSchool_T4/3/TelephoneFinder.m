#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    
    if ([number integerValue] < 0) {
        return nil;
    }
    
    NSDictionary *findNeighbour = @{ @"1" : @[@"2", @"4"],
                                     @"2" : @[@"1", @"5", @"3"],
                                     @"3" : @[@"2", @"6"],
                                     @"4" : @[@"1", @"5", @"7"],
                                     @"5" : @[@"2", @"4", @"6", @"8"],
                                     @"6" : @[@"3", @"5", @"9"],
                                     @"7" : @[@"4", @"8"],
                                     @"8" : @[@"7", @"9", @"0", @"5"],
                                     @"9" : @[@"6", @"8"],
                                     @"0" : @[@"8"]
    };
    
    NSMutableArray *arrayOfNeighbours = [[NSMutableArray alloc]init];
    for (NSInteger indexNumber = 0; indexNumber < number.length; indexNumber++) {
        NSRange range = NSMakeRange(indexNumber, 1);
        NSArray *neighboursOfNumbers = [findNeighbour valueForKey:[number substringWithRange:range]];
        
        for (NSInteger j = 0; j < neighboursOfNumbers.count; j++) {
            NSString *nextNumberNeighbour = [number stringByReplacingCharactersInRange:range withString: neighboursOfNumbers[j]];
            [arrayOfNeighbours addObject:nextNumberNeighbour];
        }
    }
    return arrayOfNeighbours;
}
@end
