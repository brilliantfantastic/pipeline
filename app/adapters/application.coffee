DS.FixtureAdapter.reopen 
  queryFixtures: (records, query, type) ->
    records.filter (record) ->
      for key of query
        continue  unless query.hasOwnProperty(key)
        value = query[key]
        return false  if record[key] isnt value
      true

  simulateRemoteErrorCall: (callback, context) ->
    adapter = this
    new Ember.RSVP.Promise((resolve) ->
      if get(adapter, "simulateRemoteResponse")
        # Schedule with setTimeout
        Ember.run.later (->
          resolve callback.call(context)
          return
        ), get(adapter, "latency")
      else
        # Asynchronous, but at the of the runloop with zero latency
        Ember.run.schedule "actions", null, ->
          resolve callback.call(context)
          return

      return
    , "DS: FixtureAdapter#simulateRemoteCall")

`export default DS.FixtureAdapter.extend()`
