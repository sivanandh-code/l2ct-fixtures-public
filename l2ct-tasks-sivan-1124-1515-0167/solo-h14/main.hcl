resource "lab" "l2ct" {
  title       = "solo-h14"
  description = "l2ct-tasks fixture hs-main. Generated; do not edit by hand."
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
    t01 = resource.task.h14a
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.h14b
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.h14c
  }
}

resource "task" "h14a" {
  description = "H14 kill -9"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "signal"
    check {
      script = "scripts/h14_kill9.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h14b" {
  description = "H14 exit 255"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "255"
    check {
      script = "scripts/h14_255.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h14c" {
  description = "H14 exit 130"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "130"
    check {
      script = "scripts/h14_130.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
