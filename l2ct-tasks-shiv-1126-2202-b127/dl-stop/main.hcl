resource "lab" "l2ct" {
  title       = "dl-stop"
  description = "l2ct-tasks fixture dl-stop. Generated; do not edit by hand."
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
    t01 = resource.task.l106
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.l108
  }
}

resource "task" "l106" {
  description = "L106/L107 a 25 s check"
  config {
    target = resource.container.c1
    timeout = "60s"
  }
  condition "c1" {
    description = "sleeps 25 s"
    check {
      script = "scripts/sleep25_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l108" {
  description = "L108 a check that never exits (no target)"
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
