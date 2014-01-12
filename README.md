node-linda-mac-say
==================
call Mac OSX's "say" command with linda-socket.io

- watch {type: "say"} and exec "say #{tuple.value}"


## Install Dependencies

    % npm install


## Run

    % npm start

### call mac say from web

write {type: "say", value: "hello"} from following URL
=> http://node-linda-base.herokuapp.com/test/type/say/value/hello


## Run with your linda-base

    % export LINDA_BASE=http://node-linda-base.herokuapp.com
    % LINDA_SPACE=test
    % npm start
