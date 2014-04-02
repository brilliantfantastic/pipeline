App = undefined
server = undefined

module "Acceptance - Week Projects",
  setup: ->
    App = startApp()

  teardown: ->
    Ember.run App, "destroy"

test "week renders to show three empty projects", ->
  expect 1

  visit("/weeks/201405").then ->
    elements = Ember.$("input[type='text'][name='project[name]']")
    equal elements.length, 3, "expected 3 elements, got #{elements.length}"
