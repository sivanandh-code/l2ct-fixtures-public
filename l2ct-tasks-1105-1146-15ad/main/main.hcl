resource "lab" "l2ct" {
  title       = "main"
  description = "l2ct-tasks fixture main. Generated; do not edit by hand."
  layout      = resource.layout.main
  settings {
    timelimit {
      duration = "45m"
    }
  }
  content {
    chapter "main" {
      title = "Tasks"
      page "p01" {
        title     = "Step 1"
        reference = resource.page.p01
      }
      page "p02" {
        title     = "Step 2"
        reference = resource.page.p02
      }
      page "p03" {
        title     = "Step 3"
        reference = resource.page.p03
      }
      page "p04" {
        title     = "Step 4"
        reference = resource.page.p04
      }
      page "p05" {
        title     = "Step 5"
        reference = resource.page.p05
      }
      page "p06" {
        title     = "Step 6"
        reference = resource.page.p06
      }
      page "p07" {
        title     = "Step 7"
        reference = resource.page.p07
      }
      page "p08" {
        title     = "Step 8"
        reference = resource.page.p08
      }
      page "p09" {
        title     = "Step 9"
        reference = resource.page.p09
      }
      page "p10" {
        title     = "Step 10"
        reference = resource.page.p10
      }
      page "p11" {
        title     = "Step 11"
        reference = resource.page.p11
      }
      page "p12" {
        title     = "Step 12"
        reference = resource.page.p12
      }
      page "p13" {
        title     = "Step 13"
        reference = resource.page.p13
      }
      page "p14" {
        title     = "Step 14"
        reference = resource.page.p14
      }
      page "p15" {
        title     = "Step 15"
        reference = resource.page.p15
      }
      page "p16" {
        title     = "Step 16"
        reference = resource.page.p16
      }
      page "p17" {
        title     = "Step 17"
        reference = resource.page.p17
      }
      page "p18" {
        title     = "Step 18"
        reference = resource.page.p18
      }
    }
  }
}

resource "layout" "main" {
  column {
    width = "50"
    instructions {}
  }
  column {
    width = "50"
    tab "terminal" {
      title  = "Terminal"
      target = resource.terminal.shell
    }
  }
}

resource "terminal" "shell" {
  target = resource.container.c1
}

resource "network" "net" {
  subnet = "10.0.0.0/24"
}

resource "container" "c1" {
  image {
    name = "ubuntu:24.04"
  }
  network {
    id = resource.network.net.meta.id
  }
}

resource "page" "p01" {
  title = "Step 1"
  file  = "instructions/p01.md"
  activities = {
    t01 = resource.task.exit1
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.exit_listed
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.prereq
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.exit0
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.nothing_solve
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.python_shebang
  }
}

resource "page" "p07" {
  title = "Step 7"
  file  = "instructions/p07.md"
  activities = {
    t07 = resource.task.big_output
  }
}

resource "page" "p08" {
  title = "Step 8"
  file  = "instructions/p08.md"
  activities = {
    t08 = resource.task.html_message
  }
}

resource "page" "p09" {
  title = "Step 9"
  file  = "instructions/p09.md"
  activities = {
    t09 = resource.task.dblclick
  }
}

resource "page" "p10" {
  title = "Step 10"
  file  = "instructions/p10.md"
  activities = {
    t10 = resource.task.r16_read
  }
}

resource "page" "p11" {
  title = "Step 11"
  file  = "instructions/p11.md"
  activities = {
    t11 = resource.task.f01
  }
}

resource "page" "p12" {
  title = "Step 12"
  file  = "instructions/p12.md"
  activities = {
    t12 = resource.task.f02
  }
}

resource "page" "p13" {
  title = "Step 13"
  file  = "instructions/p13.md"
  activities = {
    t13 = resource.task.f03
  }
}

resource "page" "p14" {
  title = "Step 14"
  file  = "instructions/p14.md"
  activities = {
    t14 = resource.task.f04
  }
}

resource "page" "p15" {
  title = "Step 15"
  file  = "instructions/p15.md"
  activities = {
    t15 = resource.task.f05
  }
}

resource "page" "p16" {
  title = "Step 16"
  file  = "instructions/p16.md"
  activities = {
    t16 = resource.task.f06
  }
}

resource "page" "p17" {
  title = "Step 17"
  file  = "instructions/p17.md"
  activities = {
    t17 = resource.task.stop_while_failed
  }
}

resource "page" "p18" {
  title = "Step 18"
  file  = "instructions/p18.md"
  activities = {
    t18 = resource.task.after_failed
  }
}

resource "task" "exit1" {
  description = "Task A - always fails (check exits 1)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails"
    check {
      script = "scripts/fail1.sh"
      failure_message = "Expected failure t01"
    }
    solve {
      script = "scripts/solve_flag.sh"
    }
  }
}

resource "task" "exit_listed" {
  description = "Task B - fails with the listed exit code 2"
  config {
    target = resource.container.c1
    failure_exit_codes = [2]
  }
  condition "c1" {
    description = "listed"
    check {
      script = "scripts/fail2.sh"
      failure_message = "listed code"
    }
    solve {
      script = "scripts/solve_flag.sh"
    }
  }
}

resource "task" "prereq" {
  description = "Task C - needs Task D first (prerequisite)"
  prerequisites = [resource.task.exit0]
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "needs t04"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/noop.sh"
    }
  }
}

resource "task" "exit0" {
  description = "Task D - always passes (check exits 0)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
      failure_message = "should not show"
    }
  }
}

resource "task" "nothing_solve" {
  description = "Task E - the Solve script does nothing"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "noop"
    check {
      script = "scripts/fail1.sh"
      failure_message = "nothing solved"
    }
    solve {
      script = "scripts/noop.sh"
    }
  }
}

resource "task" "python_shebang" {
  description = "Task F - check is a Python script"
  config {
    target = resource.container.c2
  }
  condition "c1" {
    description = "py"
    check {
      script = "scripts/py_check.py"
    }
  }
}

resource "task" "big_output" {
  description = "Task G - check prints 1 MB of output"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "big"
    check {
      script = "scripts/big_output.sh"
    }
  }
}

resource "task" "html_message" {
  description = "Task H - failure message contains HTML"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "html"
    check {
      script = "scripts/fail1.sh"
      failure_message = "<img src=x onerror=alert(1)> <b>bold</b> &amp; <script>1</script>"
    }
    solve {
      script = "scripts/solve_flag.sh"
    }
  }
}

resource "task" "dblclick" {
  description = "Task I - double-click the Check button"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow fail"
    check {
      script = "scripts/r16_slow_fail.sh"
      failure_message = "R16 first task failed as designed"
    }
    solve {
      script = "scripts/noop.sh"
    }
  }
}

resource "task" "r16_read" {
  description = "Task J - counts how often Task I ran"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/r16_count.sh"
      failure_message = "R16: the check script ran more than once"
    }
  }
}

resource "task" "f01" {
  description = "Task M - success_message is set"
  success_message = "L2CT-SUCCESS-MESSAGE-F01"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "always passes"
    check {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "f02" {
  description = "Task N - runs as user nobody"
  config {
    target = resource.container.c1
    user = "nobody"
  }
  condition "c1" {
    description = "id -un must be nobody"
    check {
      script = "scripts/f_user.sh"
      failure_message = "F02: the script did not run as user nobody"
    }
  }
}

resource "task" "f03" {
  description = "Task O - runs in group daemon"
  config {
    target = resource.container.c1
    user = "nobody"
    group = "daemon"
  }
  condition "c1" {
    description = "id -gn must be daemon"
    check {
      script = "scripts/f_group.sh"
      failure_message = "F03: the script did not run in group daemon"
    }
  }
}

resource "task" "f04" {
  description = "Task P - working directory /tmp"
  config {
    target = resource.container.c1
    working_directory = "/tmp"
  }
  condition "c1" {
    description = "pwd must be /tmp"
    check {
      script = "scripts/f_cwd.sh"
      failure_message = "F04: the script did not start in /tmp"
    }
  }
}

resource "task" "f05" {
  description = "Task Q - environment variable"
  config {
    target = resource.container.c1
    environment = { L2CT_ENV = "l2ct-value" }
  }
  condition "c1" {
    description = "L2CT_ENV must be l2ct-value"
    check {
      script = "scripts/f_env.sh"
      failure_message = "F05: L2CT_ENV was not set"
    }
  }
}

resource "task" "f06" {
  description = "Task R - two 8 s conditions in parallel"
  config {
    target = resource.container.c1
    parallel_exec { condition = true }
  }
  condition "c1" {
    description = "sleeps 8 s"
    check {
      script = "scripts/sleep8_ok.sh"
    }
  }
  condition "c2" {
    description = "sleeps 8 s"
    check {
      script = "scripts/sleep8_ok.sh"
    }
  }
}

resource "task" "stop_while_failed" {
  description = "Task K - left failed on purpose"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "stays failed"
    check {
      script = "scripts/fail1.sh"
      failure_message = "stays failed"
    }
    cleanup {
      script = "scripts/cleanup_marker.sh"
    }
  }
}

resource "task" "after_failed" {
  description = "Task L - must stay locked while Task K is failed"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "never runs"
    check {
      script = "scripts/ok.sh"
    }
  }
}

resource "container" "c2" {
  image {
    name = "python:3.12-slim"
  }
  network {
    id = resource.network.net.meta.id
  }
}
