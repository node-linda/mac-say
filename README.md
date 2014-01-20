node-linda-mac-say
==================
call Mac OSX's "say" command with [linda-socket.io](https://github.com/node-linda/linda-socket.io)

- watch tuple {type: "say"}
  - say tuple.value
  - write {type: "say", value: value, result: ["success" or "fail"]}
- https://github.com/node-linda/node-linda-mac-say


## Install Dependencies

    % npm install


## Run

    % npm start

### call mac say from web

write {type: "say", value: "hello"} from following URL

=> http://node-linda-base.herokuapp.com/test?type=say&value=hello


## Run with your [linda-base](https://github.com/node-linda/node-linda-base)

    % export LINDA_BASE=http://node-linda-base.herokuapp.com
    % export LINDA_SPACE=test
    % npm start


## Install as Service

    % gem install foreman

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app node-linda-mac-say -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/node-linda-mac-say-main-1.plist
