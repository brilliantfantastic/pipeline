`import { test, moduleFor } from 'ember-qunit'`
`import Week from 'appkit/routes/week'`

moduleFor('route:week', "Unit - WeekRoute")

test "it exists", ->
  ok @subject() instanceof Week
