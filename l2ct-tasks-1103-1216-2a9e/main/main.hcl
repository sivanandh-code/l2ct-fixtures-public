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
    }
  }
}

resource "layout" "main" {
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
    t11 = resource.task.stop_while_failed
  }
}

resource "page" "p12" {
  title = "Step 12"
  file  = "instructions/p12.md"
  activities = {
    t12 = resource.task.after_failed
  }
}

resource "task" "exit1" {
  description = "Exit 1 fails"
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
  description = "Listed failure code 2"
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
  description = "Needs exit0 first"
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
  description = "Exit 0 passes"
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
  description = "Solve does nothing"
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
  description = "Python shebang"
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
  description = "1 MB of output"
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
  description = "HTML in failure message"
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
  description = "Double click target"
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
  description = "Count the check runs"
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

resource "task" "stop_while_failed" {
  description = "Left failed, session stopped"
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
  description = "Must stay locked"
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
