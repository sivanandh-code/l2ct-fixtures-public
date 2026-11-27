# D106: a module task with the same label as the lab's task "install"
resource "task" "install" {
  description = "D106 the MODULE's task install (its check fails, marker D106:module)"
  condition "c1" {
    description = "module check fails"
    check {
      script = "scripts/d106_module.sh"
      failure_message = "D106: the module task ran"
    }
  }
}
