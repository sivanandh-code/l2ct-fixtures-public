resource "lab" "l2ct" {
  title       = "dh-module"
  description = "l2ct-tasks fixture dh-module. Generated; do not edit by hand."
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
    t01 = resource.task.install
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.d106_reader
  }
}

resource "task" "install" {
  description = "D106 the LAB's task install (its check passes, marker D106:root)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check passes"
    check {
      script = "scripts/d106_root.sh"
      failure_message = "D106: the lab's task ran the module task's check"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d106_reader" {
  description = "D106 reader: passes only when the marker file is exactly 'D106:root'"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "marker file"
    check {
      script = "scripts/d106_reader.sh"
      failure_message = "D106: the marker file is not exactly 'D106:root' (another task's check ran)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

module "m" {
  source = "./modules/m"
}
