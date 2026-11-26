resource "lab" "l2ct" {
  title       = "dl-time1"
  description = "l2ct-tasks fixture dl-time1. Generated; do not edit by hand."
  layout      = resource.layout.main
  settings {
    timelimit {
      duration = "2m"
    }
  }
  content {
    chapter "main" {
      title = "Tasks"
      page "p01" {
        title     = "Step 1"
        reference = resource.page.p01
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
    t01 = resource.task.l115
  }
}

resource "task" "l115" {
  description = "L115 timeout longer than the lab time limit"
  config {
    target = resource.container.c1
    timeout = "30m"
  }
  condition "c1" {
    description = "sleeps 600 s"
    check {
      script = "scripts/sleep600.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
