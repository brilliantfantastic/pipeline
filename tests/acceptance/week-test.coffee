App = undefined

module "Acceptance - Week",
  setup: -> App = startApp()
  teardown: -> Ember.run App, "destroy"

test "week renders", ->
  expect 1

  visit("/weeks/201412").then ->
    ok exists "#period-estimate"
