ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render()

    @render 'header',
      into: 'application'
      outlet: 'header'

`export default ApplicationRoute`
