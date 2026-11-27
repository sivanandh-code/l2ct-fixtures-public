resource "lab" "l2ct" {
  title       = "dh-key-dup"
  description = "l2ct-tasks fixture dh-key-dup. Generated; do not edit by hand."
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
    t01 = resource.task.d104_a
    t01 = resource.task.d104_b
  }
}

resource "task" "d104_a" {
  description = "D104 task A (page 1 sets activity key t01 to it first; its check passes)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d104_b" {
  description = "D104 task B (page 1 sets activity key t01 to it second; its check fails)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check fails"
    check {
      script = "scripts/fail1.sh"
      failure_message = "D104: task B ran"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
