//
//  EntryController.h
//  Journal-C
//
//  Created by Jordan Bryant on 9/28/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

+ (EntryController *)sharedInstance;

- (void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;
- (void)removeEntry:(Entry *)entry;
- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText;
- (void)saveToPersistentStore;
- (void)loadFromPersistentStore;

@property (nonatomic, strong) NSMutableArray *entries;

@end

NS_ASSUME_NONNULL_END
