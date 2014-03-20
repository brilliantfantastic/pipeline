Period = DS.Model.extend
  week: DS.attr('number')
  hours: DS.attr('number')

Period.reopenClass
  FIXTURES: [
    id: 1
    week: 201412
    hours: 63
  ]

`export default Period`
