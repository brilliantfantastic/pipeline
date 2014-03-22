PeriodAdapter = DS.FixtureAdapter.extend
  # Simulate what the server would do (find by week)
  find: (store, type, id) ->
    fixtures = @fixturesForType(type)
    Ember.assert "Unable to find fixtures for model type " + type.toString(), fixtures
    fixture = Ember.A(fixtures).findProperty("week", parseInt(id))  if fixtures
    if fixture
      @simulateRemoteCall (->
        fixture
      ), this
    else
      Ember.RSVP.Promise.reject {status: 404}

`export default PeriodAdapter`
