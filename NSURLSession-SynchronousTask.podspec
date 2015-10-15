Pod::Spec.new do |s|

  s.name         = "NSURLSession-SynchronousTask"
  s.version      = "1.1"
  s.summary      = "NSURLSession category which brings NSURLConnection-like synchronous tasks to NSURLSession"

  s.description  = <<-DESC
                   NSURLSession+SynchronousTask is an NSURLSession category which brings NSURLConnection-like (remember sendSynchronousRequest:returningResponse:error:?) synchronous tasks to NSURLSession.
                   
                   Internally the category uses GCD to wait for the tasks to finish.
                   DESC

  s.homepage     = "https://github.com/floschliep/NSURLSession-SynchronousTask"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }

  s.author             = { "Florian Schliep" => "hello@floschliep.com" }
  s.social_media_url   = "http://twitter.com/floschliep"

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"

  s.source       = { :git => "https://github.com/floschliep/NSURLSession-SynchronousTask.git", :tag => "1.1" }
  s.source_files = "NSURLSession+SynchronousTask" 

end
