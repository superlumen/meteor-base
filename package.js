Package.describe({
  name: 'superlumen:base',
  version: '0.0.2',
  // Brief, one-line summary of the package.
  summary: 'Superlumen base package',
  // URL to the Git repository containing the source code for this package.
  git: 'https://github.com/superlumen/meteor-base',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  // documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2');

  // We want coffeescript here because we're using it
  api.use('coffeescript');
  // And we want it everywhere else because it's freakin awesome
  api.imply('coffeescript');

  // Use and imply node's native server side asserts
  api.use('superlumen:assert@0.0.1');
  api.imply('superlumen:assert');

  // Export a global App namespace
  api.export('App');

  // This instantiates the A namespace object
  api.addFiles('scope.js');

  // Our meta schema which gets merged into all other schemas
  api.addFiles('meta.schema.both.coffee');

});
