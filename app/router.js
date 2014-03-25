var Router = Ember.Router.extend();

Router.map(function() {
  this.resource('week', { path: '/weeks/:week_number' });
});

export default Router;
