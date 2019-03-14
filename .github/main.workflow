workflow "Build Docker Tool Mixins" {
  on = "push"
  resolves = ["Build"]
}

action "Lint" {
  uses = "docker://koalaman/shellcheck-alpine:stable"
  runs = "sh"
  args = "ci/entrypoint_lint.sh"
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = "build --no-cache -t tedmiston/docker-tool-mixins ."
  needs = ["Lint"]
}
