workflow "Build Docker Tool Mixins" {
  on = "push"
  resolves = ["Build"]
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = "build -t tedmiston/docker-tool-mixins ."
}
