resource "lab" "l2ct" {
  title       = "hp-b"
  description = "l2ct-tasks fixture hp-b. Generated; do not edit by hand."
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
      page "p03" {
        title     = "Step 3"
        reference = resource.page.p03
      }
      page "p04" {
        title     = "Step 4"
        reference = resource.page.p04
      }
      page "p05" {
        title     = "Step 5"
        reference = resource.page.p05
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
    t01 = resource.task.h06g
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.h06t
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.h07
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.h08
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.h10
  }
}

resource "task" "h06g" {
  description = "H06 gate stays failed"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails"
    check {
      script = "scripts/fail1.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h06t" {
  description = "H06 locked target"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "ok"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h07" {
  description = "H07 never visited"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "ok"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h08" {
  description = "H08 bad ids"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "ok"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h10" {
  description = "H10 stop/extend mid check"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
