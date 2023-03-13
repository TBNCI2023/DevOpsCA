module.exports = {
    apps: [
      {
        name: "myapp",
        script: "./app.js",
        instances: "max",
        env: {
          NODE_ENV: "production",
          PORT: 3000
        }
      }
    ]
  }