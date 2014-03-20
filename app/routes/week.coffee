Week = Ember.Route.extend
  model: (params) ->
    @store.find 'period', params.week_number

`export default Week`
