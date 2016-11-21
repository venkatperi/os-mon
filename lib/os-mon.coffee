mqtt = require 'mqtt'
monitor = require 'os-monitor'

mqttUrl = process.env.MQTT or 'mqtt://localhost'
client = mqtt.connect mqttUrl

monitor.start()
monitor.on 'monitor', ( e ) ->
  console.log e

client.on 'connect', ->
  monitor.on 'monitor', ( e ) ->
    console.log e
    client.publish 'os/stats', e
  


