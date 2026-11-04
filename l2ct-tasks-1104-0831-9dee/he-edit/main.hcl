resource "lab" "l2ct" {
  title       = "he-edit"
  description = "l2ct-tasks fixture he-edit. Generated; do not edit by hand."
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

resource "page" "p01" {
  title = "Step 1"
  file  = "instructions/p01.md"
  activities = {
    t01 = resource.task.e1
  }
}

resource "task" "e1" {
  description = "editor target task"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "only condition"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
