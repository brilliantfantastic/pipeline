App = undefined
module "Acceptances - Initial state",
  setup: ->
    App = startApp()
    return

  teardown: ->
    Ember.run App, "destroy"
    return

test "index renders", ->
  expect 1
  visit("/").then ->
    ok exists "#period-estimate"
