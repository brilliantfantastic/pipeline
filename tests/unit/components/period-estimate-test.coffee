`import { test, moduleForComponent } from 'ember-qunit'`

moduleForComponent('period-estimate', 'Unit - PeriodEstimateComponent')

test 'changing the hours', ->
  @component = @subject()

  equal @$().find('input').val(), ''

  Ember.run => @component.set 'hours', 45

  equal @$().find('input').val(), '45'
