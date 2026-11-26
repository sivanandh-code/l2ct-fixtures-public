resource "lab" "l2ct" {
  title       = "dh-case-label"
  description = "l2ct-tasks fixture dh-case-label. Generated; do not edit by hand."
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
    t01 = resource.task.Install
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.install
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.d101_reader
  }
}

resource "task" "Install" {
  description = "D101 task A: label Install (its own check passes, marker D101:Install)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check passes"
    check {
      script = "scripts/d101_upper.sh"
      failure_message = "D101: task A failed (it ran another task's check)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "install" {
  description = "D101 task B: label install (its own check fails, marker D101:install)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check fails"
    check {
      script = "scripts/d101_lower.sh"
      failure_message = "D101: task B failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d101_reader" {
  description = "D101 reader: passes only when the marker file is exactly 'D101:Install D101:install'"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "marker file"
    check {
      script = "scripts/d101_reader.sh"
      failure_message = "D101: the marker file is not exactly 'D101:Install D101:install' (another task's check ran)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
