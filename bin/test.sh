#!/bin/bash

#had to hard-code the id because of travis-ci/travis-ci#7031
#xcodebuild test -workspace frederic-client.xcworkspace/ -scheme frederic-client -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2'
xcodebuild test -workspace frederic-client.xcworkspace/ -scheme frederic-client -destination 'id=1FD54EA7-5A25-4D6F-8599-D6F7687DA4EE'
