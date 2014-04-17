Project = DS.Model.extend
  name: DS.attr('string')
  period: DS.belongsTo('period')

`export default Project`
