mqtt = require 'mqtt'
stats = require('sysstats')()

mqttUrl = process.env.MQTT or 'mqtt://localhost:4883'
client = mqtt.connect mqttUrl

update = ->
  x =
    cpus: stats.cpus()
    memory: stats.mem()

  str = JSON.  client.publish 'os/stats', str

client.on 'connect', ->
  console.log 'mqtt: connected'
  setInterval update, 1000
