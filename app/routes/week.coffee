WeekRoute = Ember.Route.extend
  model: (params) ->
    @store.findOrInitialize 'period', params.week_number

`export default WeekRoute`
