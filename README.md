Purpose
=======

ASOperationQueue is a subclass of NSOperationQueue and adds support for executing a block when all the operations of a queue have completed their execution.

ARC Compatibility
=================

NSOperationStack works with both ARC and non-ARC projects.

Installation
============

To use ASOperationQueue, just drag the class files (ASOperationQueue.h and ASOperationQueue.m) into your project. In order to add a completion block, do not use the default init and instead use this method:

-(id) initWithCompletionBlock:(CompletionBlock)completionBlock;

Example:

ASOperationQueue* queue = [[ASOperationQueue alloc] initWithCompletionBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Hello World");
        });
    }];

Notes
=====

Currently only operations added to the queue using addOperation will be accounted for. Blocks added to the queue via addOperationWithBlock will not be accounted towards queue completion. That support will be added shortly.

Contact
=======

hasan@assemblelabs.com
