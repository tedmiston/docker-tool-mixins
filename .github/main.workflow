workflow "Build Docker Tool Mixins" {
  on = "push"
  resolves = ["Build"]
}

action "Lint" {
  uses = "docker://koalaman/shellcheck-alpine:stable"
  runs = "shellcheck"
  args = "alias_list.sh"
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = "build -t tedmiston/docker-tool-mixins ."
  needs = ["Lint"]
}
