`import { test, moduleFor } from 'ember-qunit'`
`import Store from 'appkit/store'`

moduleFor 'store:main', "Unit - Store",
  setup: -> @TestAdapter = DS.Adapter.extend()

test "it exists", ->
  ok @subject() instanceof Store

  module "#findOrInitialize"

  test "it requires a type", ->
    throws (-> @subject().findOrInitialize()), "requires a type to be passed"
  
  test "it does not allow an id to be passed as a type", ->
    throws (-> @subject().findOrInitialize('type')), "requires a type and an id"
  
  test "it calls findAll if a query is used as the id", ->
    expect 1

    currentType = DS.Model.extend()
    @TestAdapter = @TestAdapter.extend
      findQuery: (store, type, query) =>
        equal type, currentType, "findQuery was called"
        Ember.RSVP.resolve([$.extend({}, {id: 1}, query)])
    @subject().set 'adapter', @TestAdapter
    Ember.run => @subject().findOrInitialize(currentType, {blah: 'blah'})

  test "it returns the object if it exists", ->
    expect 3
  
    id = 1
    currentType = DS.Model.extend()
    @TestAdapter = @TestAdapter.extend
      find: (store, type, id) ->
        equal type, currentType, "find was called"
        Ember.RSVP.resolve({id: id})
    @subject().set 'adapter', @TestAdapter
    Ember.run => 
      @subject().findOrInitialize(currentType, id).then (object)->
        equal object.get('id'), id, "object was found"
        ok object.get('isLoaded'), "object was loaded from source"

  test "it creates an object if it does not exists", ->
    expect 1
  
    id = 1
    currentType = DS.Model.extend()
    @TestAdapter = @TestAdapter.extend
      find: (store, type, id) -> Ember.RSVP.reject({status: 404})
    @subject().set 'adapter', @TestAdapter
    Ember.run => 
      @subject().findOrInitialize(currentType, id).then (object)->
        ok object.get('isNew'), "object was created"

  test "it rethrows the error if the result is not a missing result", ->
    expect 1
  
    currentType = DS.Model.extend()
    @TestAdapter = @TestAdapter.extend
      find: (store, type, id) -> Ember.RSVP.reject({status: 500})
    @subject().set 'adapter', @TestAdapter
    Ember.run => 
      throws (-> @subject().findOrInitialize(currentType, 1)), "throws the error if it was not a 404"
