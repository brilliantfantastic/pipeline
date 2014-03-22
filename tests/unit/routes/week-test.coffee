`import { test, moduleFor } from 'ember-qunit'`
`import Week from 'appkit/routes/week'`

store = undefined

moduleFor 'route:week', "Unit - WeekRoute",
  setup: ->
    store = {}

test "it exists", ->
  ok @subject() instanceof Week

test "#model", ->
  expect 2

  expectedModel = {
    id: 201412
    week: 201412
    hours: 25
  }

  store.findOrInitialize = (type) =>
    equal type, 'period'
    expectedModel
  @subject().set 'store', store

  equal @subject().model(201412), expectedModel, "did not correctly invoke store"
