resource "lab" "l2ct" {
  title       = "dh-two-pages"
  description = "l2ct-tasks fixture dh-two-pages. Generated; do not edit by hand."
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
    t01 = resource.task.d105_shared
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.d105_shared
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.d105_reader
  }
}

resource "task" "d105_shared" {
  description = "D105 one task shown on page 1 AND page 2 (its check passes, marker D105:shared)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "own check passes"
    check {
      script = "scripts/d105_shared.sh"
      failure_message = "D105: the shared task failed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "d105_reader" {
  description = "D105 reader: passes only when the marker file is exactly 'D105:shared'"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "marker file"
    check {
      script = "scripts/d105_reader.sh"
      failure_message = "D105: the marker file is not exactly 'D105:shared' (another task's check ran)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
