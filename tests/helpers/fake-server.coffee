`import resolver from 'appkit/tests/helpers/resolver'`

class FakeServer
  constructor: (autoRespond = false) ->
    @fake = sinon.fakeServer.create()
    @fake.autoRespond = autoRespond

  respondWith: (status, method, url, response) ->
    @fake.respondWith method, url, [
      status
      {
        "Content-Type": "application/json"
      }
      JSON.stringify(response)]
    @

  restore: -> @fake.restore()

`export default FakeServer`
