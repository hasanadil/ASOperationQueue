//
//  ASOperationQueue.h
//
//  Created by Hasan on 3/25/14.
//  Copyright (c) 2014 Assemble Labs
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/hasanadil/ASOperationQueue
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "ASOperationQueue.h"

@interface ASOperationQueue()
{
    CompletionBlock queueCompletionBlock;
}

@property (copy) CompletionBlock queueCompletionBlock;

@end

@implementation ASOperationQueue

@synthesize queueCompletionBlock;

-(id) initWithCompletionBlock:(CompletionBlock)completionBlock
{
    self = [super init];
    self.queueCompletionBlock = completionBlock;
    return self;
}

-(void) addOperation:(NSOperation *)operation
{
    CompletionBlock operationCompletionBlock = [operation completionBlock];
    [operation setCompletionBlock:^{
        if (operationCompletionBlock) {
            operationCompletionBlock();
        }
        if (self.operationCount == 0) {
            queueCompletionBlock();
        }
    }];
    [super addOperation:operation];
    [super addOperationWithBlock:<#^(void)block#>]
}

@end
