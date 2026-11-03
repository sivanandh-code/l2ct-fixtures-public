resource "lab" "l2ct" {
  title       = "uivsgit"
  description = "l2ct-tasks fixture uivsgit. Generated; do not edit by hand."
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
    t01 = resource.task.a_simple
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.b_codes
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.c_lifecycle
  }
}

resource "task" "a_simple" {
  description = "UI-vs-Git A: simple check"
  config {
    target = resource.container.c1
    timeout = "45s"
  }
  condition "c1" {
    description = "simple"
    check {
      script = "scripts/ok.sh"
      failure_message = "A failed"
    }
  }
}

resource "task" "b_codes" {
  description = "UI-vs-Git B: exit codes + message"
  success_message = "B done"
  config {
    target = resource.container.c1
    success_exit_codes = [0]
    failure_exit_codes = [2]
    timeout = "20s"
  }
  condition "c1" {
    description = "codes"
    check {
      script = "scripts/fail2.sh"
      failure_message = "B listed failure"
    }
  }
}

resource "task" "c_lifecycle" {
  description = "UI-vs-Git C: setup+check+solve+cleanup"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "lifecycle"
    setup {
      script = "scripts/ok.sh"
    }
    check {
      script = "scripts/check_flag.sh"
      failure_message = "C not solved"
    }
    solve {
      script = "scripts/solve_flag.sh"
    }
    cleanup {
      script = "scripts/cleanup_marker.sh"
    }
  }
}
