workflow "npm test" {
  on = "push"
  resolves = ["npm run test"]
}

action "npm i" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "i"
}

action "npm run test" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["npm i"]
  args = "run test"
}
