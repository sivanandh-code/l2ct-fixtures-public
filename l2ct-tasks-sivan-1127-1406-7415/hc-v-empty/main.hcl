resource "lab" "l2ct" {
  title       = "hc-v-empty"
  description = "l2ct-tasks fixture hc-v-empty. Generated; do not edit by hand."
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
  title = ""
  file  = "instructions/p01.md"
  activities = {
    t01 = resource.task.k604
  }
}

resource "task" "k604" {
  description = ""
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = ""
    check {
      script = "scripts/fail1.sh"
      failure_message = ""
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
