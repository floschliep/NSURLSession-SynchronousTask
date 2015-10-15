NSURLSession+SynchronousTask
============================

`NSURLSession+SynchronousTask` is an `NSURLSession` category which brings `NSURLConnection`-like (remember `sendSynchronousRequest:returningResponse:error:`?) synchronous tasks to `NSURLSession`.

Internally the category uses GCD to wait for the tasks to finish.

## Installation

[CocoaPods](http://cocoapods.org) is the recommended method of installing `NSURLSession-SynchronousTask`. Simply add the following line to your `Podfile`:

#### Podfile

```ruby
pod 'NSURLSession-SynchronousTask'
```

## Usage

### NSURLSessionDataTask

```
NSURL *url = ...
NSError *error = nil;
NSURLResponse *response = nil;
NSData *data = [[NSURLSession sharedSession] sendSynchronousDataTaskWithURL:url returningResponse:&response error:&error];
...
```
### NSURLSessionDownloadTask

```
NSURL *url = ...
NSError *error = nil;
NSURLResponse *response = nil;
NSURL *fileURL = [[NSURLSession sharedSession] sendSynchronousDownloadTaskWithURL:url returningResponse:&response error:&error];
...
```
### NSURLSessionUploadTask

```
NSURLRequest *uploadRequest = ...
NSData *dataToBeUploaded = ...
NSError *error = nil;
NSURLResponse *response = nil;
NSData *data = [[NSURLSession sharedSession] sendSynchronousUploadTaskWithRequest:uploadRequest fromData:dataToBeUploaded returningResponse:&response error:&error];
...
```

---

## Contact

Florian Schliep

- http://github.com/floschliep
- http://twitter.com/floschliep
- http://floschliep.com

## License

NSURLSession+SynchronousTask is available under the MIT license. See the LICENSE.txt file for more info.
