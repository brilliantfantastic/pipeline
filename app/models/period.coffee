`import Project from 'appkit/models/project'`

Period = DS.Model.extend
  week: DS.attr('number')
  hoursEstimate: DS.attr('number')

  projects: DS.hasMany(Project)

`export default Period`
