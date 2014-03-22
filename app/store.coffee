Store = DS.Store.extend
  findOrInitialize: (type, id) ->
    Ember.assert("You need to pass a type to the store's find method", arguments.length >= 1)
    Ember.assert("You may not pass `#{id}` as id to the store's find method", arguments.length == 1 || !Ember.isNone(id))

    if arguments.length == 1
      return @findAll(type)

    if Ember.typeOf(id) == 'object'
      return @findQuery(type, id)

    coercedId = if id == null then null else id+''
    promiseObject = @findById type, coercedId
    store = @
    promiseObject.then ((result) -> result), (reason) ->
      throw reason if (!reason || !reason.status || reason.status != 404)
      record = store.recordForId(type, id)
      record.loadedData()
      record

`export default Store`
