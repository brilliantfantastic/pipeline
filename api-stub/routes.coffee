module.exports = (server) ->

  # Create an API namespace, so that the root does not 
  # have to be repeated for each end point.
  server.namespace "/api", ->
