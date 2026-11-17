resource "lab" "l2ct" {
  title       = "solo-f05"
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
    t01 = resource.task.f05
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
