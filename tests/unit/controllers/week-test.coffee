`import { test, moduleFor } from 'ember-qunit'`
`import WeekController from 'appkit/controllers/week'`

moduleFor 'controller:week', "Unit - WeekController",
  setup: ->
    store = { createRecord: -> {} }
    @subject().set 'store', store

    model = { projects: Ember.A() }
    @subject().set 'model', model

test "it exists", ->
  ok @subject() instanceof WeekController

test "projects initialize to 3 instances", ->
  projects = @subject().get('projects')
  equal projects.get('length'), 3
