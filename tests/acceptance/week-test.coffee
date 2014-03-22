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

test "creates a new period when a period estimate is entered", ->
  expect 1

  visit("/weeks/201413").then ->
    input = $('#period-estimate input')
    fillIn input, 44
    keyEvent(input.selector, 'keyup', 13).then ->
      store = App.__container__.lookup('store:main')
      period = store.find 'period', 201413
      ok period
