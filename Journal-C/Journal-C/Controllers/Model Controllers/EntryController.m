//
//  EntryController.m
//  Journal-C
//
//  Created by Jordan Bryant on 9/28/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _entries = [NSMutableArray new];
    }
    return self;
}

//MARK: - CRUD Functions
- (void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText {
    Entry *entry = [[Entry alloc]initWithTitle:title body:bodyText timestamp:[NSDate date]];
    [_entries addObject:entry];
    [self saveToPersistentStore];
}

- (void)removeEntry:(Entry *)entry {
    [_entries removeObject:entry];
    NSLog(@"%@", _entries);
    [self saveToPersistentStore];
}

- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText {
    entry.title = title;
    entry.body = bodyText;
    entry.timestamp = [NSDate date];
    [self saveToPersistentStore];
}

//MARK: - Persistence
- (void)saveToPersistentStore {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"entries"];
}

- (void)loadFromPersistentStore {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDict:dictionary];
        [_entries addObject:entry];
    }
}

@end
