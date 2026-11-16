resource "lab" "l2ct" {
  title       = "solo-h04"
  description = "l2ct-tasks fixture hp-main. Generated; do not edit by hand."
  layout      = resource.layout.main
  settings {
    timelimit {
      duration = "45m"
      extend   = "5m"
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
    t01 = resource.task.h04
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.h04r
  }
}

resource "task" "h04" {
  description = "H04 two tabs check"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow fail"
    check {
      script = "scripts/h04_slow_fail.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h04r" {
  description = "H04 reader"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "detects overlap"
    check {
      script = "scripts/h04_overlap.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
