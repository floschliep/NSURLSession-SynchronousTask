//
//  NSURLSession+SynchronousTask.m
//
//  Copyright (c) 2014 Florian Schliep (http://floschliep.com/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "NSURLSession+SynchronousTask.h"

@implementation NSURLSession (SynchronousTask)

#pragma mark - NSURLSessionDataTask

+ (NSData *)sendSynchronousDataTaskWithRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *taskData, NSURLResponse *taskResponse, NSError *taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return data;
}

+ (NSData *)sendSynchronousDataTaskWithURL:(NSURL *)url returningResponse:(NSURLResponse **)response error:(NSError **)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *taskData, NSURLResponse *taskResponse, NSError *taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return data;
}

#pragma mark - NSURLSessionDownloadTask

+ (NSURL *)sendSynchronousDownloadTaskWithURL:(NSURL *)url returningResponse:(NSURLResponse **)response error:(NSError **)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSURL *location = nil;
    [[[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL *taskLocation, NSURLResponse *taskResponse, NSError *taskError) {
        location = taskLocation;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return location;
}

+ (NSURL *)sendSynchronousDownloadTaskWithRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSURL *location = nil;
    [[[NSURLSession sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL *taskLocation, NSURLResponse *taskResponse, NSError *taskError) {
        location = taskLocation;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return location;
}

#pragma mark - NSURLSessionUploadTask

+ (NSData *)sendSynchronousUploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData returningResponse:(NSURLResponse **)response error:(NSError **)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[[NSURLSession sharedSession] uploadTaskWithRequest:request fromData:bodyData completionHandler:^(NSData *taskData, NSURLResponse *taskResponse, NSError *taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return data;
}

+ (NSData *)sendSynchronousUploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL returningResponse:(NSURLResponse **)response error:(NSError **)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[[NSURLSession sharedSession] uploadTaskWithRequest:request fromFile:fileURL completionHandler:^(NSData *taskData, NSURLResponse *taskResponse, NSError *taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return data;
}

@end
