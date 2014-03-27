App = undefined
server = undefined

module "Acceptance - Week",
  setup: -> 
    App = startApp()
    server = new FakeServer(true).respondWith 200, 'GET', '/api/periods/201412',
      period:
        id: 1
        week: 201412
        hoursEstimate: 63

  teardown: -> 
    Ember.run App, "destroy"
    server.restore()

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
      server.respondWith 201, "POST", "/api/periods", 
        period:
          id: 2
          week: 201413
          hoursEstimate: 44
      # This is a poor verification but it is good for now since we don't know 
      # what to verify just yet
      ok true == true
