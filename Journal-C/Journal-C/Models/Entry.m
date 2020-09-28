//
//  Entry.m
//  Journal-C
//
//  Created by Jordan Bryant on 9/28/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "Entry.h"

@implementation Entry

static NSString * const titleKey = @"title";
static NSString * const bodyKey = @"body";
static NSString * const timestampKey = @"timestamp";

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp {
    self = [super init];
    if (self) {
        _title = title;
        _body = body;
        _timestamp = timestamp;
    }
    
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dictionary {
    NSString *title = dictionary[titleKey];
    NSString *body = dictionary[bodyKey];
    NSDate *timestamp = dictionary[timestampKey];
    Entry *entry = [self initWithTitle:title body:body timestamp:timestamp];
    return entry;
}

- (NSDictionary *)dictionaryCopy {
    NSLog(@"%@", self.title);
    NSLog(@"%@", self.body);
    return @{titleKey: self.title,
             bodyKey: self.body,
             timestampKey: self.timestamp};
}

@end
