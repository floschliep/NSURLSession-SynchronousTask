//
//  NSURLSession+SynchronousTask.h
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

#import <Foundation/Foundation.h>

@interface NSURLSession (SynchronousTask)

#pragma mark - NSURLSessionDataTask

+ (NSData *)sendSynchronousDataTaskWithRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error;
+ (NSData *)sendSynchronousDataTaskWithURL:(NSURL *)url returningResponse:(NSURLResponse **)response error:(NSError **)error;

#pragma mark - NSURLSessionDownloadTask

+ (NSURL *)sendSynchronousDownloadTaskWithURL:(NSURL *)url returningResponse:(NSURLResponse **)response error:(NSError **)error;
+ (NSURL *)sendSynchronousDownloadTaskWithRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error;

#pragma mark - NSURLSessionUploadTask

+ (NSData *)sendSynchronousUploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData returningResponse:(NSURLResponse **)response error:(NSError **)error;
+ (NSData *)sendSynchronousUploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL returningResponse:(NSURLResponse **)response error:(NSError **)error;

@end
