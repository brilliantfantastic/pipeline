App = undefined

module "Acceptance - Week",
  setup: -> App = startApp()
  teardown: -> Ember.run App, "destroy"

test "week renders with an existing period", ->
  expect 1

  visit("/weeks/201412").then ->
    ok exists "#period-estimate"

test "week renders with a new period", ->
  expect 1

  visit("/weeks/201410").then ->
    ok exists "#period-estimate"
