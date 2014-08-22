process.env.LINDA_SPACE ||= "test"
process.env.LINDA_BASE  ||= "http://linda-server.herokuapp.com"

{exec} = require 'child_process'
LindaClient = require('linda').Client
socket = require('socket.io-client').connect(process.env.LINDA_BASE)
linda = new LindaClient().connect(socket)

ts = linda.tuplespace(process.env.LINDA_SPACE)

linda.io.on 'connect', ->

  console.log "connect!!"
  console.log "watching {type: 'say'} in tuplespace '#{ts.name}'"
  console.log "=> #{process.env.LINDA_BASE}/#{ts.name}?type=say&value=hello"

  ts.watch {type: 'say'}, (err, tuple) ->
    return if tuple.data.response?
    if err
      console.error err
      return
    console.log tuple
    if tuple.data?.value?
      console.log cmd = "say '#{tuple.data.value.toString().sanitize()}'"
      exec cmd, (err, stdout, stderr) ->
        data = tuple.data
        data.response = if err then "fail" else "success"
        ts.write data

String::sanitize = ->
  return @.replace(/[\`\"\'\r\n;\|><]/g, '')
