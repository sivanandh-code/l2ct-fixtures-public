resource "lab" "l2ct" {
  title       = "solo-h18"
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
    t01 = resource.task.h18a
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.h18b
  }
}

resource "task" "h18a" {
  description = "H18 parallel, both fail"
  config {
    target = resource.container.c1
    parallel_exec { condition = true }
  }
  condition "c1" {
    description = "fast fail"
    check {
      script = "scripts/h18_fast_fail.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
  condition "c2" {
    description = "slow fail"
    check {
      script = "scripts/h18_slow_fail.sh"
    }
  }
}

resource "task" "h18b" {
  description = "H18 parallel, one hangs"
  config {
    target = resource.container.c1
    parallel_exec { condition = true }
    timeout = "10s"
  }
  condition "c1" {
    description = "fast fail"
    check {
      script = "scripts/h18_fast_fail.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
  condition "c2" {
    description = "hangs"
    check {
      script = "scripts/sleep600.sh"
    }
  }
}
