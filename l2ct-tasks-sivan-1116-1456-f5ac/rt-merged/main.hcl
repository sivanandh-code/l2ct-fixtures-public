resource "lab" "l2ct" {
  title       = "rt-merged"
  description = "l2ct-tasks fixture rt-merged. Generated; do not edit by hand."
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
    t01 = resource.task.b07
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.b05
  }
}

resource "task" "b07" {
  description = "Task 1 - check hangs, timeout 10s (no target)"
  config {
    timeout = "10s"
  }
  condition "c1" {
    description = "sleep 600"
    check {
      script = "scripts/sleep600.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "b05" {
  description = "Task 2 - check hangs, timeout 10s (container)"
  config {
    target = resource.container.c1
    timeout = "10s"
  }
  condition "c1" {
    description = "sleep 600"
    check {
      script = "scripts/sleep600.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
