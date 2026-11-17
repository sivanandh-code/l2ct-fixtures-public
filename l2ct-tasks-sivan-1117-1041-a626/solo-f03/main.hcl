resource "lab" "l2ct" {
  title       = "solo-f03"
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

resource "container" "c2" {
  image {
    name = "python:3.12-slim"
  }
  network {
    id = resource.network.net.meta.id
  }
}

resource "page" "p01" {
  title = "Step 1"
  file  = "instructions/p01.md"
  activities = {
    t01 = resource.task.f03
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
