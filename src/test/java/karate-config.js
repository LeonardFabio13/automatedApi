function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
    petStore = 'https://petstore.swagger.io/v2'
  }
  var config = {
    env: env,
    petStore: petStore,
    myVarName: 'someValue'

  }
  if (env == 'dev') {
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
  }
  return config;
}