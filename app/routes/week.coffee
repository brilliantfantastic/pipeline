Week = Ember.Route.extend
  model: (params) ->
    @store.find 'period', week: params.week_number

`export default Week`
