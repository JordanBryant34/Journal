//
//  Entry.h
//  Journal-C
//
//  Created by Jordan Bryant on 9/28/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp;
- (instancetype)initWithDict:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryCopy;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSDate *timestamp;

@end

NS_ASSUME_NONNULL_END
