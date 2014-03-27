WeekRoute = Ember.Route.extend
  model: (params) ->
    @store.findOrInitialize('period', params.week_number).then (period) ->
      # populate the week number
      period.set 'week', params.week_number if period.get('isNew')
      period

`export default WeekRoute`
