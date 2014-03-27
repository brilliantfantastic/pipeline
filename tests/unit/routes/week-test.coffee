`import { test, moduleFor } from 'ember-qunit'`
`import Week from 'appkit/routes/week'`

store = undefined

moduleFor 'route:week', "Unit - WeekRoute",
  setup: ->
    store = {}

test "it exists", ->
  ok @subject() instanceof Week

test "its model is returned if it already exists", ->
  expect 1

  expectedModel = Ember.Object.create
    isNew: false
    id: 123
    week: 201412
    hoursEstimate: 25

  promise = new Ember.RSVP.Promise((resolve) -> Ember.run.later -> resolve(expectedModel))
  store.findOrInitialize = (type, params) -> 
    Ember.ObjectProxy.extend(Ember.PromiseProxyMixin).create { promise: promise }
  @subject().set 'store', store

  @subject().model(week_number: 201412).then (result) ->
    deepEqual result, expectedModel, "did not correctly invoke store"

test "its model sets the week if it does not exist", ->
  expect 1

  model = Ember.Object.create
    isNew: true
    id: null
    week: null
    hoursEstimate: null

  promise = new Ember.RSVP.Promise((resolve) -> Ember.run.later -> resolve(model))
  store.findOrInitialize = (type, params) -> 
    Ember.ObjectProxy.extend(Ember.PromiseProxyMixin).create { promise: promise }
  @subject().set 'store', store

  @subject().model(week_number: 201412).then (result) ->
    deepEqual result.get('week'), 201412, "did not correctly initialize the week"
