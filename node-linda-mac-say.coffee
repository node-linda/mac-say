process.env.LINDA_SPACE ||= "test"
process.env.LINDA_BASE  ||= "http://node-linda-base.herokuapp.com"

{exec} = require 'child_process'
LindaClient = require('linda-socket.io').Client
socket = require('socket.io-client').connect(process.env.LINDA_BASE)
linda = new LindaClient().connect(socket)

ts = linda.tuplespace(process.env.LINDA_SPACE)

linda.io.on 'connect', ->
  console.log "connect!! #{process.env.LINDA_BASE}"
  ts.watch {'type': 'say'}, (err, tuple) ->
    console.log tuple
    exec "say #{tuple.data.value}"
