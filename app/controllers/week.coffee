WeekController = Ember.ObjectController.extend
  projects: (->
    projects = @get('model.projects')
    numberOfProjects = 3 - projects.get('length')
    if numberOfProjects > 0
      period = @get('model')
      projects.pushObject(@store.createRecord('project', {period: period})) for [1..numberOfProjects]
    projects
  ).property('model.projects')

  actions:
    acceptChanges: -> @get('model').save()

`export default WeekController`
