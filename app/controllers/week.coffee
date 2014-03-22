WeekController = Ember.ObjectController.extend
  actions:
    acceptChanges: -> @get('model').save()

`export default WeekController`
