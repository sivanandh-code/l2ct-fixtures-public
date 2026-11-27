resource "lab" "l2ct" {
  title       = "dh-key-reuse"
  description = "l2ct-tasks fixture dh-key-reuse. Generated; do not edit by hand."
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
    t01 = resource.task.d103_a
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t01 = resource.task.d103_b
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.d103_reader
  }
}

resource "task" "d103_a" {
  description = "D103 task A: label d103_a (its own check passes, marker D103:a)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check passes"
    check {
      script = "scripts/d103_a.sh"
      failure_message = "D103: task A failed (it ran another task's check)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d103_b" {
  description = "D103 task B: label d103_b (its own check fails, marker D103:b)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check fails"
    check {
      script = "scripts/d103_b.sh"
      failure_message = "D103: task B failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d103_reader" {
  description = "D103 reader: passes only when the marker file is exactly 'D103:a D103:b'"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "marker file"
    check {
      script = "scripts/d103_reader.sh"
      failure_message = "D103: the marker file is not exactly 'D103:a D103:b' (another task's check ran)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
