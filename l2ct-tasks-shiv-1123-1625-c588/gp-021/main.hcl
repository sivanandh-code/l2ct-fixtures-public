resource "lab" "l2ct" {
  title       = "a\u007fb"
  description = "l2ct-tasks fixture gp-021. Generated; do not edit by hand."
  layout      = resource.layout.main
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
    t01 = resource.task.ab
  }
}

resource "task" "a\u007fb" {
  description = "generated"
  config {
    target = resource.container.c1
    timeout = "1h30m15s"
  }
  condition "c1" {
    description = "c"
    check {
      script = "scripts/ok.sh"
    }
  }
}
