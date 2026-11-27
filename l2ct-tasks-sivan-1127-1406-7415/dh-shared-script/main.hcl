resource "lab" "l2ct" {
  title       = "dh-shared-script"
  description = "l2ct-tasks fixture dh-shared-script. Generated; do not edit by hand."
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
    t01 = resource.task.d102_a
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.d102_b
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.d102_reader
  }
}

resource "task" "d102_a" {
  description = "D102 task A: label d102_a (its own check passes, marker D102:A)"
  config {
    target = resource.container.c1
    environment = { L2CT_ID = "A" }
  }
  condition "c1" {
    description = "own check passes"
    check {
      script = "scripts/d102_shared.sh"
      failure_message = "D102: task A failed (it ran another task's check)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d102_b" {
  description = "D102 task B: label d102_b (its own check fails, marker D102:B)"
  config {
    target = resource.container.c1
    environment = { L2CT_ID = "B" }
  }
  condition "c1" {
    description = "own check fails"
    check {
      script = "scripts/d102_shared.sh"
      failure_message = "D102: task B failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d102_reader" {
  description = "D102 reader: passes only when the marker file is exactly 'D102:A D102:B'"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "marker file"
    check {
      script = "scripts/d102_reader.sh"
      failure_message = "D102: the marker file is not exactly 'D102:A D102:B' (another task's check ran)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
