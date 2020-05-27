const { environment } = require('@rails/webpacker');

environment.loaders.delete('nodeModules');
environment.splitChunks();
module.exports = environment;
